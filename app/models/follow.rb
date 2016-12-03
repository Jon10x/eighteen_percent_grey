# https://www.devwalks.com/lets-build-instagram-with-ruby-on-rails-part-6-follow-all-the-people/

class Follow < ActiveRecord::Base
   belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
   belongs_to :following, foreign_key: 'following_id', class_name: 'User'
end
