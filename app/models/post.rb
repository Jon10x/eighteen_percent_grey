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
 has_many :taggings
 has_many :tags, through: :taggings
 
 validates :caption, length: { minimum: 3, maximum: 300 }, :allow_blank => true
 #for followed user view
 scope :of_followed_users, -> (following_users) { where user_id: following_users }
 
 def all_tags=(names)
  self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
  end
 end

 def all_tags
   self.tags.map(&:name).join(", ")
 end
 
 def self.tagged_with(name)
   Tag.find_by_name!(name).posts
 end
 
end
