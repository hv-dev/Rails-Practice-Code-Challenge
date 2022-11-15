class Destination < ApplicationRecord

    has_many :post, dependent: :destroy

    validates :name, presence: :true
    validates :country, presence: :true

    scope :list, => { order(:name) }
end
