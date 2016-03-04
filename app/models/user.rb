class User < ActiveRecord::Base
  acts_as_paranoid

  has_many :posts
  has_many :comments
  has_many :likes

  def full_name
    '#{first_name} #{last_name}'
  end

end
