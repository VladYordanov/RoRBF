class Prize < ActiveRecord::Base
  has_attached_file :thumbnail
  do_not_validate_attachment_file_type :thumbnail
  belongs_to :user
  has_many :deliveries
end
