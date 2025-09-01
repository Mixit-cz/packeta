module Packeta
  class LabelPdf < Entity
    attribute :packet_id, Types::Coercible::String
    attribute :format, Types::String.enum(*LABEL_FORMATS)
    attribute? :offset, Types::Integer.default(0)
  end
end
