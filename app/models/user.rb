class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_one :home
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

  def host?
    roles.exists?(name: "host")
  end

  def registered_user?
    roles.exists?(name: "registered_user")
  end

  def platform_admin?
    roles.exist?(name: "platform_admin")
  end

end
