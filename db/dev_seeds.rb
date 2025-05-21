require_relative 'seed_helpers/seed_logger'
require_relative 'seed_helpers/dev_helpers/drop_helper'
require_relative 'seed_helpers/dev_helpers/test_data'

include SeedLogger
include DropHelper

# RUN ONLY IN DEV - Production seed script
log_info("[FOR TESTING] RUNNING DEV SEED SCRIPT")

# Drop existing records from the database (if any exist)
drop_records_if_exists(Admin)
drop_records_if_exists(Category)

# Notes:
# .create! is shorthand for
# admin = Admin.new(attrs)
# admin.save! ← this triggers validations

sample_admins.each do |attrs|
  Admin.create!(attrs)
end
log_success("RECORD(S) CREATED: #{Admin.count} ADMIN(S)")

sample_categories.each do |attrs|
  Category.create!(attrs)
end
log_success("RECORD(S) CREATED: #{Category.count} CATEGORY(S)")
