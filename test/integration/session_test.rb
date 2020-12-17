# frozen_string_literal: true

require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should login' do
    post users_path, params: { user: { email: 'da@afff.afff', password: '111111', last_name:'kkk', first_name:'kkk' } }
    assert_response :redirect
    assert_redirected_to '/session/new'
    post session_index_url, params: { session: { email: 'da@afff.afff', password: '111111' } }
    assert_response :redirect
    assert_redirected_to '/main/index'
  end

  test 'no should login' do
    post users_path, params: { user: { email: 'da@afff.afff', password: '111111', last_name:'kkk', first_name:'kkk' } }
    assert_response :redirect
    assert_redirected_to '/session/new'
    post session_index_url, params: { session: { email: 'da@', password: '111111' } }
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test 'no should registration' do
    post users_path, params: { user: { email: 'da@afff.afff', password: '11', last_name:'kkk', first_name:'kkk' } }
    assert_response :success
  end
end
