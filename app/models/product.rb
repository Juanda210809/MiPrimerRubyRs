class Product < ApplicationRecord
  has_one_attached :foto
  
  validates :titulo,presence: true
  validates :descripcion,presence: true
  validates :precio,presence: true
end
