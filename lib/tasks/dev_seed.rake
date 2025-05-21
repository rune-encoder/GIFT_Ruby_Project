namespace :dev do
  desc "Seed development data only"
  task seed: :environment do
    load Rails.root.join("db/dev_seeds.rb")
  end
end
