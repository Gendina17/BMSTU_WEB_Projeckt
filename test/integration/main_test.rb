require 'test_helper'

class MainTest < ActionDispatch::IntegrationTest
	setup do
    post users_path, params: { user: { email: 'da@afff.afff', password: '111111', last_name:'kkk', first_name:'kkk' } }
    post session_index_url, params: { session: { email: 'da@afff.afff', password: '111111' } }
  end
  
test 'should do to profile' do
    get '/profile/19'
    assert_response :success
  end

  test 'should do to edit' do
    get '/main/edit'
    assert_response :success
    post '/main/create', params: { user: { email: 'da@afff.afff', password: '111111', last_name:'Альберт', first_name:'Альбертов' } }
    assert_response :redirect
    assert_redirected_to '/main/my_profile'
  end

  test 'should do to likers' do
    get "/likers/#{User.find_by_email('da@afff.afff').id}"
    assert_response :success
  end

   test 'should to redirect to signin after destroy' do
    get '/main/destroy'
    assert_response :redirect
    assert_redirected_to root_url
  end


    test 'should do to faculty' do
    get "/faculty/IU6"
    assert_response :success
  end

  test 'should do to love' do
    get "/love/"
    assert_response :success
  end

  test 'should do to group' do
    get "/search/IU6-32B"
    assert_response :success
  end

  


end
