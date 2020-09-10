require 'rails_helper'

RSpec.describe AuthenticationAdminController, type: :controller do
  let!(:administrator) { create(:administrator) }
  # set headers for authorization
  let(:headers) { { 'Authorization' => token_generator_admin(administrator.id) } }
  let(:invalid_headers) { { 'Authorization' => nil } }

  describe "#authorize_request" do
    context "when auth token is passed" do
      before { allow(request).to receive(:headers).and_return(headers) }

      # private method authorize_request returns current user
      it "sets the current admin" do
        expect(subject.instance_eval { authorize_request_admin }).to eq(administrator)
      end
    end

    context "when auth token is not passed" do
      before do
        allow(request).to receive(:headers).and_return(invalid_headers)
      end

      it "raises MissingToken error" do
        expect { subject.instance_eval { authorize_request_admin } }.
            to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end
    end
  end
end