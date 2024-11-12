# this is our pen blueprint
# like a specification sheet for what makes a pen a pen in our gallery
class Pen < ApplicationRecord
  # each pen can have one photo
  # because one glamour shot is all we need
  has_one_attached :image

  # making sure we have the essential details
  # no pen left behind without a title or price!
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  # price has to be a real number
  # no accepting "many dollars" as a price!
  validates :price, numericality: true
end
