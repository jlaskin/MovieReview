class Recommendation < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {maximum: 1000}
  validates :title, length: {maximum: 50}
  validates :title, uniqueness: true
end
