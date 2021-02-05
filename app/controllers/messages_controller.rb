class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        MessageMailer.contact(@message).deliver_now
        @notice = t("alert.thanks")
        format.html { render "pages/home", status: :created }
        format.json { render json: @message, status: :created }
        @message = Message.new
      else
        @alert = t("alert.credentials")
        format.html { render "pages/home", status: :unprocessable_entity  }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body, :subject)
  end
end
