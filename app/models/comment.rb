# https://www.devwalks.com/lets-build-instagram-with-rails-like-me-and-tell-me-im-beautiful/

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
