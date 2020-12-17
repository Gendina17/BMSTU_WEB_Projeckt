# frozen_string_literal: true

require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get main_index_url
    assert_response :success
  end

  test 'should get likers' do
    get '/likers/19'
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test 'should get search' do
    get '/search/IU6-32B'
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test 'should get faculty' do
    get '/faculty/IU6'
    assert_response :redirect
    assert_redirected_to signin_url
  end
end
