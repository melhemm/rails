class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  def gist_hash
    self.gist_url.split('/')[-1]
  end
end