class Country < ApplicationRecord
    has_many :reviews, dependent: :destroy
    accepts_nested_attributes_for :reviews
    validates_uniqueness_of :name, :case_sensitive => false
    validates :name, presence: true
    validates :continent, presence: true
end
