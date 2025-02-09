class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  has_many :notifications, dependent: :destroy
end
