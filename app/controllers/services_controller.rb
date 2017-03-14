class ServicesController < ApplicationController
  layout 'management'

  def new
    @category = Category.find_by(id: params[:category_id])
    @service = Service.new
  end

  def create
    category = Category.find_by(id: params[:category_id])
    service = Service.new(service_params)

    if category.services << service && service.save!
      redirect_to category, notice: 'Услуга добавлена'
    end
  end

  def show
    @service = Service.find_by(id: params[:id])
  end

  def info
    @service = Service.find_by(id: params[:id])
    render layout: 'application'
  end

  def edit
    @service = Service.find_by(id: params[:id])
  end

  def update
    @service = Service.find_by(id: params[:id])
    respond_to do |format|
      if @service.update!(service_params)
        format.html { redirect_to [@service.category, @service], notice: 'Услуга успешно обновлена' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    service = Service.find_by(id: params[:id])
    respond_to do |format|
      if service.destroy
        format.html {redirect_to service.category, notice: 'Услуга успешно удалена'}
      else
        format.html {redirect_to service.category, notice: 'Не удалось удалить услугу'}
      end
    end
  end

  private
    def service_params
      params.require(:service).permit(:name, :description, :image)
    end
end
