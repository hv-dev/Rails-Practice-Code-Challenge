class Blogger < ApplicationRecord

    has_many :post, dependent: :destroy

    validates :name, presence: :true, uniqueness: :true
    validates :bio, presence: :true, length: { minimum: 30 }
    validates :age, presence: :true, numericality: { greater_then: 0 }

    scope :list, => { order(:name) }

end
