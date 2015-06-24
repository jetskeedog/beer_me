class Beer < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  
  has_attached_file :beer_pic, :styles => {:medium => "300x300>", :thumb => '100x100>' }
  validates_attachment_content_type :beer_pic, :content_type => /\Aimage\/.*\Z/
end
