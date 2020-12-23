class Api::V1::GbusResource < JSONAPI::Resource
    attributes :gbu
    has_one :user
end
