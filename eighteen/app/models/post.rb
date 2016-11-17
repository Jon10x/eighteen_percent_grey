class Post < ActiveRecord::Base
 
 validates :user_id, presence: true
 belongs_to :user
 validates :image, presence: true
 has_attached_file :image, styles: { :medium => "640x" }
 validates_attachment_content_type :image, :content_type =>
/\Aimage\/.*\Z/
 has_many :comments, dependent: :destroy
 validates_length_of :caption, :minimum => 2, :maximum => 40, :allow_blank => true
end
