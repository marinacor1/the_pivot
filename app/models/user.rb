class User < ActiveRecord::Base
  has_many :contracts
  has_secure_password

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true,
                    format: { with: /\A\S+@\S+\z/ },
                    uniqueness: { case_sensitive: false }

  validates :password_digest, presence: true,
                              length: {minimum: 5,
                                       allow_blank: true }

  validates :password_confirmation, presence: true,
                                    allow_blank: true

  enum role: %w(default admin)
end
