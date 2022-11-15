class Destination < ApplicationRecord

    has_many :post, dependent: :destroy

    validates :name, presence: :true
    validates :country, presence: :true

    scope :list, -> { order(:name) }
    scope :recent, lambda { |destination| Post.where("destination_id == ?", destination).order("created_at asc").limit(5) }
    scope :featured, lambda { |destination| Post.where("destination_id == ?", destination).order("likes desc").limit(1) }
end
