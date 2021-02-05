class PagesController < ApplicationController
  def home; end

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
end
