require "rails_helper"

RSpec.describe "Pages Home View", type: :view do
  let(:message) { Message.new }

  it "renders the homepage" do
    assign(:message, [message])
    assign(:partial_name, "pages/banner")
    render template: "pages/home.html.erb"
    expect(response).to render_template(partial: "pages/_banner")
    expect(response).to render_template(partial: "pages/_presentation")
    expect(response).to render_template(partial: "pages/_presentation_2")
    expect(response).to render_template(partial: "pages/_presentation_3")
    expect(response).to render_template(partial: "pages/_presentation_4")
  end
end
