class Comment < ApplicationRecord
  belongs_to :task
  acts_as_list scope: :task
  default_scope { order(position: :asc) }
end
