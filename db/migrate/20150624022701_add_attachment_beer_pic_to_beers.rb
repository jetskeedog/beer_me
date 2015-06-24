class AddAttachmentBeerPicToBeers < ActiveRecord::Migration
  def self.up
    change_table :beers do |t|
      t.attachment :beer_pic
    end
  end

  def self.down
    remove_attachment :beers, :beer_pic
  end
end
