require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not valid if nothing is passed' do
    @user = User.new
    expect(@user).to_not be_valid
  end

  it 'should passed when values are passed' do
    @user = User.create(
      email: 'rspec@email.com',
      password: 'password',
      password_confirmation: 'password',
      image_url: 'https://xsgames.co/randomusers/assets/avatars/male/4.jpg',
      mobile_number: 11_111_111_111,
      first_name: 'rspec',
      last_name: 'rspecLastname',
      birthdate: '2002-01-01'
    )
    expect(@user).to be_valid
  end
end
