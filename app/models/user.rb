class User < ActiveRecord::Base
  has_attached_file :certificate
  validates_attachment_content_type :certificate, :content_type => "application/pdf"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts
  has_many :email_recipients
  has_many :orders
end
