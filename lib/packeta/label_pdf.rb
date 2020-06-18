module Packeta
  class LabelPdf < Entity
    attribute :packet_id, Types::Coercible::String
    attribute :format, Types::String.enum("A6 on A6", "A7 on A7", "A6 on A4", "A7 on A4", "105x32mm on A4", "A8 on A8")
    attribute :offset, Types::Integer
  end
end
