class Token < ApplicationRecord
  def generate_token
    SecureRandom.uuid
  end
end
