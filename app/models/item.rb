class Item < ApplicationRecord
  belongs_to :category
  belongs_to :celebrity
  has_many :order_items
  has_many :orders, through: :order_items
  has_attached_file :upload_image, default_url: 'http://i.imgur.com/5p6sEsX.jpg'
  validates :title, presence: true, uniqueness: { scope: :celebrity_id }
  validates :price, presence: true
  validates :category, presence: true
  validates :celebrity, presence: true
  validates_attachment_content_type :upload_image, :content_type => /\Aimage\/.*\Z/

  after_create :set_image_path

  enum status: %w(available unavailable)

  after_create :set_image_path

  def celebrity_name
    celebrity.name
  end

  def sold_out?
    status == 'unavailable'
  end

  def update_image_path
    unless upload_image.url == 'http://i.imgur.com/5p6sEsX.jpg'
      update_image
    end
  end

  def set_image_path
    update_image unless image_path
  end

  private

  def update_image
    update(image_path: upload_image.url)
  end
end
