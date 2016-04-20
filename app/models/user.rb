class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true

  validates :username, presence: true,
                       uniqueness: true

  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }

  validates :password_digest, presence: true,
                              length: {minimum: 5,
                                       allow_blank: true }

  validates :password_confirmation, presence: true,
                                    allow_blank: true
end
