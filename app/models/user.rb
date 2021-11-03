class User < ApplicationRecord
  def user_level(level)
    Test.where(level: level)
  end
end
