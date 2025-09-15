module Packeta
  class CourierLabelPdf < Entity
    attribute :packet_id, Types::Coercible::String
    attribute :courier_number, Types::Coercible::String
    attribute :format, Types::String.enum(*LABEL_FORMATS)
    attribute? :offset, Types::Integer.default(0)
  end
end
