# frozen_string_literal: true

require 'application_system_test_case'

class MainsTest < ApplicationSystemTestCase
  setup do
    User.new(email: 'nina@mail.com', password: '123456', last_name:'Ninova', first_name:'Nina').save
    visit signin_url
    fill_in 'session[email]', with: 'nina@mail.com'
    fill_in 'session[password]', with: '123456'
    click 'commit'
  end

  test 'test_to_index_with_autorization' do
    visit root_url
    find('#exit').click
    assert_text 'Новый пользователь? Зарегестрируйся!'
  end

  test 'test_to_likers' do
    visit root_url
    find("#like_#{User.find_by_email('MyText').id}").click
    assert_text 'пока никто не оценил пользователя'
  end

  test 'test_to_likers_with_like' do
    visit root_url
    find("#add_#{User.find_by_email('MyText').id}").click
    assert_text '1'
    find("#like_#{User.find_by_email('MyText').id}").click
    assert_text 'Оценили пользователя'
  end

  test 'test_to_love_without_like' do
  	 visit root_url
    find("#add_#{User.find_by_email('MyText').id}").click
    visit '/love/'
    assert_text 'MyText'
    find("#dis_#{User.find_by_email('MyText').id}").click
  end

  test 'test_to_love_with_like' do
    visit '/love/'
    assert_text 'К сожалению, вам пока никто не понравился'
  end

  test 'no updating a User' do
    visit '/main/edit'
    fill_in 'user[last_name]', with: 'Ninochka'
    fill_in 'user[group]', with: 'ИУ'
    fill_in 'user[password]', with: '123456'
    assert_text 'Передумали?'
  end
end
