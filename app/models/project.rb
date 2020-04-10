class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  has_many :introductions, dependent: :destroy
  has_many :conclusions, dependent: :destroy
end
