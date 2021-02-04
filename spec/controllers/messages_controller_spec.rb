require "rails_helper"

RSpec.describe MessagesController, type: :controller do
  let(:message_params) { { email: "basile.quinchon@gmail.com", name: "Basile", body: "Lala" } }

  describe "POST #create" do
    context "with valid params" do
      it "creates a message and enqueues de mail delivery job" do
        expect {
          post :create, params: { message: message_params }
        }.to change { Message.count }.by(1)
        .and change { ActionMailer::Base.deliveries.count }.by(1)
        expect(response.status).to eq 200
        expect(Message.last.email).to eq(message_params[:email])
        expect(Message.last.name).to eq(message_params[:name])
        expect(Message.last.body).to eq(message_params[:body])
      end
    end

    context "with invalid params" do
      it "doesn't send the email" do
        message_params[:email] = "lololo"
        expect {
          post :create, params: { message: message_params }
        }.to not_change { Message.count }
        .and not_change { ActionMailer::Base.deliveries.count }
      end
    end
  end
end
