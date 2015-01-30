class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts
  
  has_attached_file :profilephoto, :styles => { :small => "150x150>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :profilephoto
  validates_attachment_size :profilephoto, :less_than => 5.megabytes
  validates_attachment_content_type :profilephoto, :content_type => ['image/jpeg', 'image/png']

end
