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
    sign_in @user
  end

  describe '' do
  end

  after do
    sign_out @user
  end
end
