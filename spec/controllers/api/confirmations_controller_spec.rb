require 'spec_helper'

describe Api::ConfirmationsController do
  describe 'Confirmation#post' do
    context 'it sends the confirmation token' do
      before(:each) do
        @user = create()
        post :create, params: { user: { email: @user.email } }, format: :json
      end

      it 'sets the confirmation token' do
        expect(User.find_by(id: @user.id).confirmation_token).not_to be_nil
      end

      it { is_expected.to respond_with(200) }
    end

    context 'it does not send the confirmation token if already confirmed' do
      before(:each) do
        @user = create(trait: :confirmed)
        post :create, params: { user: { email: @user.email } }, format: :json
      end

      # inconsistent

      # it 'renders a JSON error' do
      #   expect(json_response).to include(:errors)
      # end

      # it 'renders the reason in the JSON' do
      #   expect(json_response[:errors][:email]).to include("was already confirmed, please try signing in")
      # end

      it { is_expected.to respond_with(422) }
    end
  end

  describe 'Confirmation#get' do
    context 'it confirms a user with a valid confirmation_token' do
      before(:each) do
        @user = create(trait: :confirmation_token)
        get :show, params: {confirmation_token: @user.confirmation_token}, format: :json
      end

       it "sets the confirmed_at to a value" do
          created_user = User.find_by(id: @user.id)
          expect(created_user.confirmed_at).not_to be_nil
       end

       it {is_expected.to respond_with 200}
    end

    context 'it does not confirm a user with a invalid confirmation_token' do
      before(:each) do
        @user = create(trait: :confirmation_token)
        get :show, params: {confirmation_token: "12345"}, format: :json
      end

      # inconsistent

      #  it "renders an error JSON" do
      #     user_response = json_response
      #     expect(user_response).to include(:confirmation_token)
      #  end

      #  it 'renders the reason in the JSON' do
      #   expect(json_response[:confirmation_token]).to include("is invalid")
      # end

      it { is_expected.to respond_with(422) }
    end
  end

  describe 'Method not Allow' do
    it "does not allow new method" do
      get :new, format: :json
      user_response = json_response
      expect(response.status).to eql(405)
    end
  end
end
