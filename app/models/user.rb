# frozen_string_literal: true

# Model for user
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true,  length: { maximum: 18 }
  validates :password, confirmation: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :status, length: { maximum: 50 }
  validates :info, length: { maximum: 500 }
  validates :city,  length: { maximum: 30 }
  validates :town,  length: { maximum: 30 }
  validates :love_status, length: { maximum: 30 }
  validates_format_of :contact, with: /(^\s*$)|(https:\/\/vk.com\/)/, message: I18n.t(:contact_message)
  validates_format_of :group, with: /(^\s*$)|(\A((ИУ)|(IU)|(СМ)|(SM)|(МТ)|(MT)|(РК)|(RK)|(СГН)|(SGN)|(БМТ)|(BMT)|(ИБМ)|(IBM)|(АК)|(AK)|(ИСОТ)|(ISOT)|(ОЭ)|(OE)|(РКТ)|(RKT)|(РТ)|(RT)|(Э)|(E)|(ЮР)|(YR)|(ФН)|(FN)|(РЛ)|(RL))((1[0-2])|[1-9])-((1[0-2])|[1-9])[1-9](А|Б|М|A|B|M)?\Z)/, message: I18n.t(:group_message)
  mount_uploader :avatar, AvatarUploader


  def self.authenticate(email, submitted_password)
    user = find_by(email: email)
    return nil if user.nil?
    return user if user.authenticate(submitted_password)
  end
end
