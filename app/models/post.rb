class Post < ApplicationRecord
    
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: :true
    validates :content, presence: :true, length: { minimum: 100 }

    scope :recent, lambda { |limit=15| all.limit(limit) }
    scope :popular, -> { order("likes desc") }

    scope :bloggers_featured_post, lambda { |blogger| where("blogger_id == ?", blogger).order("likes desc").limit(1) }
    scope :bloggers_total_likes, lambda { |blogger| where("blogger_id == ?", blogger).count("likes") }
end