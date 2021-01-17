class Reply < ApplicationRecord
  belongs_to :post
  validates :name, :body, presence: true
end
