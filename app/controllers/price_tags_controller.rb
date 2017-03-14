class PriceTagsController < ApplicationController
  def create
    @service = Service.find_by(id: params[:service_id])
    @price_tag = PriceTag.new(price_params)
    @old_id = params[:old_id]
    respond_to do |format|
      if @service.price_tags << @price_tag
        format.js {render :created, status: :ok}
      else
        format.js {head :unprocessable_entity}
      end
    end
  end

  def update
    price_tag = PriceTag.find_by(id: params[:id])
    respond_to do |format|
      if price_tag.update!(price_params)
        format.js { head :ok }
      else
        format.js { head :unprocessable_entity }
      end
    end
  end

  def destroy
    @price_tag = PriceTag.find_by(id: params[:id])
    respond_to do |format|
      if @price_tag.destroy
        format.js { render :deleted, status: :ok }
      else
        format.js { head :unprocessable_entity }
      end
    end
  end

  private

  def price_params
    params.require(:price_tag).permit(:tag, :min_price, :max_price)
  end
end
