class FeedbackController < ApplicationController

  def send_message
    respond_to do |format|
      if message_params[:email].nil?
        format.js { render :email_empty }
      elsif message_params[:body].nil?
        format.js { render :body_empty }
      else
        MessageMailer.submitted(message_params).deliver
        format.js { render :success }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:email, :body)
  end
end
