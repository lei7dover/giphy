class Gif < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :url
  validates_format_of :url, :with => /\.gif\z/, :message => "must have a .gif extension"
  #validates_format_of :url, :with => %r{\.(gif)}, :message => "must have an gif extension"
end
