# https://www.sitepoint.com/tagging-scratch-rails/

class Tagging < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
end
