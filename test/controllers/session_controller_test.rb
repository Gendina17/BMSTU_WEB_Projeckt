# frozen_string_literal: true

require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get signin_url
    assert_response :success
  end

  test 'should_redirect_to_signin' do
    get '/main/my_profile'
    assert_response :redirect
    assert_redirected_to signin_url
    get '/profile/19'
    assert_response :redirect
    assert_redirected_to signin_url
    get '/love/'
    assert_response :redirect
    assert_redirected_to signin_url
  end
end
