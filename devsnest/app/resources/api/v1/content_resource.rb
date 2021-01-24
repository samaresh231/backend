# frozen_string_literal: true

module Api
  module V1
    class ContentResource < JSONAPI::Resource
      attributes :unique_id, :parent_id, :name, :data_type, :link, :priority, :score

      filter :parent_id, default: 'algo'
      filter :unique_id
      def self.default_sort
        [{ field: 'priority', direction: :asc }]
      end
    end
  end
end
