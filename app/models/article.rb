class Article < ApplicationRecord
    belongs_to :user

    validates :title, length: { minimum: 9 }, uniqueness: true

end
