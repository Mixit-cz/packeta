module Packeta
  class Label < Entity
    attribute :packet_id, Types::Coercible::String
    attribute :courier_number, Types::Integer
    attribute? :dpi, Types::Integer.optional
  end
end
