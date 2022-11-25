class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user

  default_scope { order(created_at: :desc)}

  def username
    return self.email.split('@')[0].capitalize
  end

end
