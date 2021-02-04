class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      flash[:notice] = t("alert.thanks")
      @message.save
      @message = Message.new
    else
      flash[:alert] = t("alert.credentials")
      response.status = 400
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body, :subject)
  end
end
