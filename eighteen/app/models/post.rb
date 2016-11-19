class Post < ActiveRecord::Base
 acts_as_votable
 belongs_to :user
 validates :user_id, presence: true
 validates :image, presence: true
 has_attached_file :image, styles: { :medium => "640x" }
 validates_attachment_content_type :image, :content_type =>
/\Aimage\/.*\Z/
 has_many :comments, dependent: :destroy
 has_many :notifications, dependent: :destroy
 validates :caption, length: { minimum: 3, maximum: 300 }, :allow_blank => true
end
