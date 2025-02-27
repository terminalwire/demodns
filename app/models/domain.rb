class Domain < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :dns_records, dependent: :destroy
end
