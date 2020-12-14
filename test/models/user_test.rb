# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'test_save_db' do
    instance = User.new(email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег' )
    assert instance.save
    instance.delete
  end

  test 'test_unique_email' do
    instanse1 = User.new(email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег')
    instanse1.save
    instance2 = User.new(email: 'test@mail.ru', password: '222222', first_name: 'Олегин', last_name: 'Милох')
    instance2.validate
    assert_equal instance2.errors[:email], ['уже существует']
  end
   

  test 'test_get_db' do
    instance = User.new(email: 'test4@mail.ru', password: '123456', first_name: 'Баканов', last_name: 'Олег')
    assert instance.save
    assert_equal  'Баканов', User.find_by_email('test4@mail.ru').first_name
    id = instance.id
    assert_equal  'Олег', User.find_by_id(id).last_name
  end

  test 'test_template_email' do
    instance = User.new(email: 'hlgbl', password: '123456', first_name: 'Баканов', last_name: 'Олег')
    instance.validate
    assert_equal instance.errors[:email], ["имеет неверное значение"]
  end

  test 'test_length_last_name' do
    instance = User.new(email: 'test4@mail.ru', password: '123456', first_name: 'Баканов', last_name: 'Олегггггггггггггггггг')
    instance.validate
    assert_equal instance.errors[:last_name], ['слишком большой длины (не может быть больше чем 18 символов)']
  end

  test 'test_template_group' do
    instance = User.new(email: 'test4@mail.ru', password: '123456', first_name: 'Баканов', last_name: 'Олег', group:'ррггш')
    instance.validate
    assert_equal instance.errors[:group], ["должна соответствовать указанному формату"]
  end

test 'error_last_name_blank' do
instance = User.new(email: "aaa@gmail.com", password: '123456', first_name: 'Баканов' )
instance.validate
assert_equal instance.errors[:last_name], ["не может быть пустым"]
end

test 'error_first_name_blank' do
instance = User.new(email: "aaa@gmail.com", password: '123456', last_name: 'Баканова' )
instance.validate
assert_equal instance.errors[:first_name], ["не может быть пустым"]
end

test 'error_email_blank' do
instance = User.new(last_name: "Олег", password: '12345', first_name: 'Олегин')
instance.validate
assert_equal instance.errors[:email], ["не может быть пустым", "имеет неверное значение"]
end

test 'error_password_blank' do
instance = User.new(first_name: "Ренат", email: "aaa@mail.ru", last_name: "Ренатов")
instance.validate
assert_equal instance.errors[:password], ["не может быть пустым", "недостаточной длины (не может быть меньше 6 символов)"]
end

test 'test_length_first_name' do
    instance = User.new(email: 'test4@mail.ru', password: '123456', first_name: 'Бакановввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввввв', last_name: 'Олег')
    instance.validate
    assert_equal instance.errors[:first_name], ['слишком большой длины (не может быть больше чем 30 символов)']
  end

  test 'test_template_contact' do
    instance = User.new(email: 'test4@mail.ru', password: '123456', first_name: 'Баканов', last_name: 'Олег', contact:'ррггш')
    instance.validate
    assert_equal instance.errors[:contact], ["должен быть ссылкой на вк"]
  end

end
