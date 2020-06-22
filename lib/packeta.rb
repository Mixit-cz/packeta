require "active_support"
require "active_support/core_ext/string/inflections"

require "dry-struct"
require "dry-types"
require "http"
require "libxml"
require "oj"
require "pry"

require "packeta/configuration"
require "packeta/types"
require "packeta/types/size"
require "packeta/request"
require "packeta/create_packet"
require "packeta/create_packet_result"
require "packeta/packet_courier_label_zpl"
require "packeta/packet_label_pdf"
require "packeta/errors"
require "packeta/entity"
require "packeta/packet"
require "packeta/label"
require "packeta/label_pdf"
require "packeta/points"
require "packeta/result"
require "packeta/packet_label_pdf_result"
require "packeta/version"

module Packeta
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
