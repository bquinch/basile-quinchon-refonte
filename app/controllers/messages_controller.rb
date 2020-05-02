class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.valid?
        MessageMailer.contact(@message).deliver_now
        format.js
        format.json { render :json => post }
        format.html { redirect_to root_url, notice: t('alert.thanks') }
        flash[:notice] = t('alert.thanks')
        @message.save
      else
        format.html
        format.json { render :json => post }
        format.js   { render layout: false, content_type: 'text/javascript' }
        flash[:notice] = t('alert.credentials')
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
