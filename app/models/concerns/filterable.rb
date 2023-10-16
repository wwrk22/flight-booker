module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filter_params)
      records = self.all

      filter_params.each do |key, value|
        records = records.send("with_#{key}", value)
      end

      records
    end
  end
end
