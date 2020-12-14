require 'test_helper'

class UserCommunicationTest < ActiveSupport::TestCase
   test 'test_save_db' do
   	user1 = User.new(email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег' )
    user1.save
    user2 = User.new(email: 'test2@mail.ru', password: '123456', first_name: 'Олегин', last_name: 'Милох' )
    user2.save
    instance = UserCommunication.new(liker: user1.id, like: user2.id )
    assert instance.save
    instance.delete
  end

  test 'test_get_db' do
    user1 = User.new(id:333333, email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег' )
    user1.save
    user2 = User.new(id:222222, email: 'test2@mail.ru', password: '123456', first_name: 'Олегин', last_name: 'Милох' )
    user2.save
    instance = UserCommunication.new(liker: user1.id, like: user2.id )
    assert instance.save
    assert_equal  333333, UserCommunication.find_by_like(222222).liker
    id = instance.id
    assert_equal  222222, UserCommunication.find_by_id(id).like
  end
end
