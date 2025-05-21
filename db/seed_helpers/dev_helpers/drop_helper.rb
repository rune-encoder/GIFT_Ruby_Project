# FILE: db/seed_helpers/drop_helper.rb

require_relative '../dev_helpers/drop_helper'
include SeedLogger

module DropHelper
  def drop_records_if_exists(model, label = nil)
    label ||= model.name.upcase

    begin
      if model.exists?
        model.delete_all
        log_warning("RECORD(S) DROPPED: #{label}")
      end
    rescue StandardError => e
      warn "Error dropping records: #{label} (#{e.class}: #{e.message})"
    end
  end
end
