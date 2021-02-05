class PagesController < ApplicationController
  def home
    @partial_name = "pages/banner"
  end

  def append_form
    respond_to do |format|
      @message = Message.new
      format.turbo_stream
    end
  end

  def cancel_form
    respond_to do |format|
      format.turbo_stream
    end
  end

  def replace_partial
    render turbo_stream: turbo_stream.update("partials-container", partial: params[:partial_name])
  end
end
