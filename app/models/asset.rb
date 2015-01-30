class Asset < ActiveRecord::Base
  belongs_to :post

  has_attached_file :image, :styles => { :medium => "640x480>", 
                                         :thumb => "100x100#"}
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
                                         
end
