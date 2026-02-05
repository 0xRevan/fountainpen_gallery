class Ink < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validate :acceptable_image, if: -> { image.attached? }

  scope :search, ->(query) {
    where("name LIKE :q OR brand LIKE :q OR color LIKE :q OR description LIKE :q", q: "%#{sanitize_sql_like(query)}%") if query.present?
  }

  scope :recent, -> { order(created_at: :desc) }

  private

  def acceptable_image
    unless image.blob.content_type.in?(%w[image/png image/jpeg image/gif image/webp])
      errors.add(:image, "must be a PNG, JPEG, GIF, or WebP image")
    end

    if image.blob.byte_size > 10.megabytes
      errors.add(:image, "must be less than 10 MB")
    end
  end
end
