class Post < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags

  accepts_nested_attributes_for :tags

end
