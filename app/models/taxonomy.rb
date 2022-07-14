class Taxonomy < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :type }, length: { maximum: 16 }
end
