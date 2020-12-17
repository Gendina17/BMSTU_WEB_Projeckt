# frozen_string_literal: true

require 'test_helper'

class WallTest < ActiveSupport::TestCase
  test 'test_save_db' do
    user1 = User.new(email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег' )
    user1.save
    instance = Wall.new(title: 'Всем привет!', body: 'Да, да всем!', author: user1.id)
    assert instance.save
    instance.delete
  end

  test 'test_get_db' do
    user1 = User.new(id: 333_333, email: 'test@mail.ru', password: '123456', first_name: 'Милохин', last_name: 'Олег' )
    user1.save
    instance = Wall.new(title: 'Всем привет!', body: 'Да, да всем!', author: user1.id)
    assert instance.save
    assert_equal 'Всем привет!', Wall.find_by_author(333_333).title
    id = instance.id
    assert_equal 333_333, UserCommunication.find_by_id(id).author
  end
end
