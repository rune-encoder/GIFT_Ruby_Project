class AdminUser < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true, uniqueness: true
    validates :permission_level, inclusion: { in: 1..4 }
end
