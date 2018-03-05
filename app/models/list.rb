class List < ApplicationRecord

   mount_uploader :url, ImageUploader

   has_many :user_lists
   has_many :lists, through: :user_lists 
end
