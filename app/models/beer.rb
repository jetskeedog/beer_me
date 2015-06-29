class Beer < ActiveRecord::Base
  belongs_to :user

  validates :title, :name, :beer_pic, :user_id, presence: true
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  has_attached_file :beer_pic, :styles => {:medium => "300x300>", :thumb => '100x100>' }
  validates_attachment_content_type :beer_pic, :content_type => /\Aimage\/.*\Z/
end