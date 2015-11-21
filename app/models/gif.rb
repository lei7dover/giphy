class Gif < ActiveRecord::Base
  #validates_format_of :url, :with => /.gif/
  #validates_format_of :url, :with => %r{\.(gif)}, :message => "must have an gif extension"
end
