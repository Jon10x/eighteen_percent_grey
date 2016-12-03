# https://www.sitepoint.com/tagging-scratch-rails/

class Tagging < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :tag, counter_cache: true
end
