class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings
  
 def self.counts
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.name")
 end
 
  # def self.counts
  #  self.select("tags.id, tags.name,count(taggings.tag_id) as count")Taggins.includes(:tag).select("taggings.tag_id, count(taggings.tag_id) as count").group("taggings.tag_id")
  # end 

end


