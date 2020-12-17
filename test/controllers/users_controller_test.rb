# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'nina@mail.com', last_name: 'nina', password: '123456', password_confirmation: '123456',last_name: 'nina'} }
    end
    assert_redirected_to signin_url
  end

  test 'should not create user' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: 'nina', password: '123456' } }
    end
  end
end
