# FILE: test_data.rb
# Development-only seed data

def sample_admins
  [
    {
      name: "Eivor Wolf-Kissed",
      username: "owner",
      email: "owner@admin.com",
      password: "password1234",
      password_confirmation: "password1234",
      permission_level: 1
    },
    {
      name: "Ezio Auditore",
      username: "manager",
      password: "password1234",
      password_confirmation: "password1234",
      email: "manager@admin.com",
      permission_level: 2
    },
    {
      name: "Kassandra Sparta",
      username: "editor",
      password: "password1234",
      password_confirmation: "password1234",
      email: "editor@admin.com",
      permission_level: 3
    },
    {
      name: "Bayek Siwa",
      username: "viewer",
      password: "password1234",
      password_confirmation: "password1234",
      email: "viewer@admin.com",
      permission_level: 4
    }
  ]
end

def sample_categories
  [
    { name: "Cookies" },
    { name: "Pastries" },
    { name: "Cakes" },
    { name: "Special" }
  ]
end
