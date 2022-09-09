require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  before do
    @user = User.create(
      email: 'rspec@email.com',
      password: 'password',
      password_confirmation: 'password',
      first_name: 'rspec',
      last_name: 'rspecLastname',
      birthdate: '2002-01-01'
    )
    @user.skip_confirmation!
    @user.skip_confirmation_notification!
    sign_in @user
  end

  it 'should show user profile' do
    get :view_profile, params: { id: @user.id }
    expect(response.status).to eq(302)
  end
end
