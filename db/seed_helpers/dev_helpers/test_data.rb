# FILE: test_data.rb
# Development-only seed data

# == Admins ===
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

# === Categories ===
def sample_categories
  [
    { name: "Cookies" },
    { name: "Cakes" },
    { name: "Breads" },
    { name: "Cupcakes" },
    { name: "Brownies" },
    { name: "Vegan" },
    { name: "Seasonal Specials" }
  ]
end

# === Product Name Mapping ===
PRODUCT_NAMES = {
  cookies: [ "Chocolate Chip Cookie", "Oatmeal Raisin Cookie", "Peanut Butter Cookie", "Sugar Cookie", "Snickerdoodle", "Double Chocolate Cookie", "Shortbread Cookie", "Macadamia Nut Cookie" ],
  cakes: [ "Chocolate Cake", "Vanilla Sponge Cake", "Red Velvet Cake", "Carrot Cake", "Lemon Drizzle Cake", "Cheesecake", "Black Forest Cake", "Coffee Cake" ],
  breads: [ "Sourdough Bread", "Baguette", "Whole Wheat Bread", "Rye Bread", "Ciabatta", "Focaccia", "Brioche", "Multigrain Bread" ],
  cupcakes: [ "Chocolate Cupcake", "Vanilla Cupcake", "Red Velvet Cupcake", "Lemon Cupcake", "Carrot Cupcake", "Salted Caramel Cupcake", "Strawberry Cupcake", "Cookies & Cream Cupcake" ],
  brownies: [ "Classic Brownie", "Walnut Brownie", "Fudge Brownie", "Blondie", "Peanut Butter Brownie", "Salted Caramel Brownie", "Cheesecake Brownie", "Espresso Brownie" ],
  vegan: [ "Vegan Chocolate Cake", "Vegan Cookie", "Vegan Brownie", "Vegan Banana Bread", "Vegan Muffin", "Vegan Cupcake" ],
  seasonal_specials: [ "Pumpkin Spice Muffin", "Gingerbread Cookie", "Eggnog Cupcake", "Peppermint Brownie", "Hot Cross Bun", "Stollen", "Fruitcake" ]
}.freeze

PRODUCT_DESCRIPTION = "Delicious handmade treat crafted with the finest ingredients."

# === Product Generator ===
def sample_products(categories)
  categories.flat_map do |category|
    key = normalize_category_key(category.name)
    (PRODUCT_NAMES[key] || []).map do |product_name|
      price = random_price
      {
        name: product_name,
        description: PRODUCT_DESCRIPTION,
        price: price,
        special_price: random_special_price(price),
        stock: random_stock,
        allow_backorder: random_bool(0.2),
        is_on_special: random_bool(0.15),
        is_hidden: random_bool(0.05),
        image_url: random_image_url,
        category_id: category.id
      }
    end
  end
end

# === Private Helper Methods ===
private
def normalize_category_key(name)
  name.downcase.gsub(/\s|-/, "_").to_sym
end

def random_price
  rand * (25.0 - 2.5) + 2.5 # Ensures decimal values
end

def random_special_price(price)
  rand < 0.3 ? (price - rand(0.5..5.0)).round(2) : nil
end

def random_stock
  rand(0..20)
end

def random_image_url
  [
    "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    "https://images.unsplash.com/photo-1519864600265-abb23847ef2c",
    "https://images.unsplash.com/photo-1464306076886-debca5e8a6b0"
  ].sample
end

def random_bool(chance = 0.1)
  rand < chance
end
