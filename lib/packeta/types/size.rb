module Packeta
  module Types
    class Size < Dry::Struct
      attribute :length, Types::Integer
      attribute :width, Types::Integer
      attribute :height, Types::Integer
    end
  end
end
