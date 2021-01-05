
module Api
    module V1
      class GbuResource < JSONAPI::Resource
    attributes :description

    def fetchable_fields
        # byebug()
        super
    end

    def self.records(options = {})
        # byebug()
        super(options)
    end
end
end
end
