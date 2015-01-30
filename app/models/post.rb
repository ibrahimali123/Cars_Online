class Post < ActiveRecord::Base
  belongs_to :user

  #attr_accessible :model, :price, :brand, :assets_attributes
  
  has_many :assets
  has_many :comments
  accepts_nested_attributes_for :assets, :allow_destroy => true
end
