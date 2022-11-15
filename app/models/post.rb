class Post < ApplicationRecord
    
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: :true
    validates :content, presence: :true, length: { minimum: 100 }
    validates :likes, presence: :true
end
