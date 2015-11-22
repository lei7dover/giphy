class Vote < ActiveRecord::Base
  belongs_to :gif, :counter_cache => true
end
