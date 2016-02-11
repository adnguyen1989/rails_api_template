require 'spec_helper'

describe Api::PasswordsController do
  describe "Passwords#post" do
    context 'it sends a password confirmation token for valid emails' do
      before(:each) do
        @user = create
        post :create, params: { user: { email: @user.email } }, format: :json
      end

      it 'sets the token' do
        created_user = User.find_by(id: @user.id)
        expect(created_user.reset_password_token).not_to be_nil
      end

      it { is_expected.to respond_with 201 }
    end

    context 'it sends a password confirmation token for valid emails' do
      before(:each) do
        post :create, params: { user: { email: "randomunmatchedemailed@gmail.com" } }, format: :json
      end

      it 'renders a JSON error' do
        expect(json_response).to include(:errors)
      end

      it 'renders the reason in the JSON' do
        expect(json_response[:errors][:email]).to include("not found")
      end

      it { is_expected.to respond_with(422) }
    end
  end

  # describe "Passwords#update" do
  #   context 'it update the tokens' do
  #     before(:each) do
  #       @user = create
  #       @old_password = @user.encrypted_password
  #       post :create, { user: { email: @user.email } }, format: :json
  #       puts User.find_by(id: @user.id).reset_password_token
  #       put :update, { user: { reset_password_token: User.find_by(id: @user.id).reset_password_token, password: "newpassword", password_confirmation: "newpassword" } }, format: :json
  #     end

  #     it 'sets the token' do
  #       puts json_response
  #       created_user = User.find_by(id: @user.id)
  #       expect(created_user.encrypted_password).not_to eql(@old_password)
  #     end

  #     it { is_expected.to respond_with 201 }
  #   end
  # end

  describe "Method not Allow" do
    it "does not allow new method" do
      get :new, format: :json
      user_response = json_response
      expect(response.status).to eql(405)
    end

    it "does not allow edit method" do
      get :edit, params: { reset_password_token: "123" }, format: :json
      user_response = json_response
      expect(response.status).to eql(405)
    end
  end
end
