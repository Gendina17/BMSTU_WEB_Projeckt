# frozen_string_literal: true

require 'test_helper'

class WallControllerTest < ActionDispatch::IntegrationTest
  test 'should get records' do
    user1 = User.new(email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег' )
    user1.save
    get "/records/#{user1.id}"
    assert_response :redirect
    assert_redirected_to signin_url
  end
end
