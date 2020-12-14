require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test 'test_no_signin' do
    visit signin_url
    fill_in 'session[email]', with: 'aaaaa'
    fill_in 'session[password]', with: 'aaaa'
    click_on 'commit'
    assert_text 'Новый пользователь? Зарегестрируйся!'
  end

  test 'test_sign_in' do
    User.new(email: 'nina@mail.com', password: '123456', last_name:'Ninova', first_name:'Nina').save
    visit signin_url
    fill_in 'session[email]', with: 'nina@mail.com'
    fill_in 'session[password]', with: '123456'
    click_on 'commit'
    assert_text 'Новые пользователи'
  end

  test 'test_registration' do
    visit signup_url
    fill_in 'user[first_name]', with: 'Nina'
    fill_in 'user[last_name]', with: 'Ninova'
    fill_in 'user[email]', with: 'nina@mail.ru'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_on 'commit'
    assert_text 'Новый пользователь? Зарегестрируйся!'
  end

   test 'test_no_registration' do
    visit signup_url
    fill_in 'user[first_name]', with: 'Nina'
    fill_in 'user[last_name]', with: 'Ninova'
    fill_in 'user[email]', with: 'ninaaaaaaaaaa'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    click_on 'commit'
    assert_text 'Уже есть'
  end

   test 'test_to_index' do
    visit root_url
    find('#reg').click
    assert_text 'Уже есть'
     visit root_url
    find('#entre').click
    assert_text 'Новый пользователь? Зарегестрируйся!'
  end
end
