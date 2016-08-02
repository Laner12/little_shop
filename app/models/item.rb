class Item < ApplicationRecord
  belongs_to :category
  belongs_to :celebrity
  has_many :order_items
  has_many :orders, through: :order_items
  validates :title, presence: true, uniqueness: { scope: :celebrity_id }
  validates :price, presence: true
  validates :image_path, presence: true
  validates :category, presence: true
  validates :celebrity, presence: true

  enum status: %w(available unavailable)

  def celebrity_name
    celebrity.name
  end

  def sold_out?
    status == 'unavailable'
  end
end
