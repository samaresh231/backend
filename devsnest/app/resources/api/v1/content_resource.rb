# frozen_string_literal: true

module Api
  module V1
    class ContentResource < JSONAPI::Resource
      attributes :unique_id, :parent_id, :name, :data_type, :link, :priority, :extra_link1, :extra_link2

      filter :parent_id, default: 'algo'

      def self.default_sort
        [{ field: 'priority', direction: :asc }]
      end
    end
  end
end
