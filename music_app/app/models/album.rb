class Album < ApplicationRecord
  validates :title, :year, :live, :band_id, presence: true
  
end
