class Gif < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates :has_content
  validates_format_of :url, :with => /\.gif\z/, :message => "must have a .gif extension", :allow_blank => true
  has_many :votes
  attachment :gif_image

  def specific_image_url
    if url.blank?
      gif_image
    else
      url
    end
  end

  def has_content
    if [self.gif_image, self.url].reject(&:blank?).size == 0
    errors[:base] << ("Please upload either an image or url.")
    end
  end

end
