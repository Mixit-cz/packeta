module Packeta
  class LabelsPdf < Entity
    require "packeta/types"

    attribute :packet_ids, Packeta::Types::PacketIds
    attribute :format, Types::String.enum(*LABEL_FORMATS)
    attribute? :offset, Types::Integer.default(0)
  end
end
