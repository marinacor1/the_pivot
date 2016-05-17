class User < ActiveRecord::Base
  belongs_to :home
  has_many :trips
  has_many :user_roles, :dependent => :destroy
  has_many :roles, through: :user_roles
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
    roles.exists?(name: "platform_admin")
  end

end
