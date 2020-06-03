module Packeta
  class Packet < Entity
    attribute? :id, Types::Integer.optional
    attribute :number, Types::Coercible::String
    attribute :name, Types::String
    attribute :surname, Types::String
    attribute? :company, Types::String.optional
    attribute :email, Types::String
    attribute? :phone, Types::String.optional
    attribute :address_id, Types::Integer
    attribute? :currency, Types::String.optional
    attribute? :cod, Types::Decimal.optional
    attribute :value, Types::Coercible::Decimal
    attribute? :weight, Types::Decimal.optional
    attribute :deliver_on, Types::Date
    attribute :eshop, Types::String
    attribute? :adult_content, Types::Bool.optional
    attribute? :note, Types::String.optional
    attribute? :street, Types::String.optional
    attribute? :house_number, Types::String.optional
    attribute? :city, Types::String.optional
    attribute? :province, Types::String.optional
    attribute? :zip, Types::String.optional
    attribute? :carrier_service, Types::String.optional
    attribute? :customer_barcode, Types::String.optional
    attribute? :carrier_pickup_point, Types::String.optional

    # TODO: Custom types
    attribute? :size, Packeta::Types::Size.optional
    attribute? :other_attributes, Types::String.optional
    attribute? :items, Types::String.optional

    def xml
      doc = LibXML::XML::Node.new("packetAttributes")
      attributes.each do |k, v|
        doc << create_node(k, v)
      end
      doc
    end
  end
end
