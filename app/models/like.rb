class Like < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :post
  belongs_to :user

end
