class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, ImageUploader
  validate :picture_size 
  
  private 
    def picture_size
        if picture.size > 5.megabytes 
            errors.add(:picture, "shoul dbe less than 5MB")
        end
    end
end
