# Packeta

Gem for interacting with [Packeta](https://packeta.com) delivery service.

## Current status

- Creating Packets
- Generating PDF labels
- Downloading carrier's pickup points in JSON (with shortcut for Paczkomat at the moment)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'packeta'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install packeta

## Usage

### Create a packet

```ruby
packet = Packeta::Packet.new(
  number: "123",
  name: "Michal",
  surname: "Gritzbach",
  email: "michal@example.com",
  address_id: 102,
  eshop: "Mixit.cz",
  value: 100,
  currency: "CZK"
)
created_packet = Packeta::CreatePacket.new(packet).call
created_packet.barcode
#=> "Z1234567890"
```

### Create PDF label

```ruby
label = Packeta::LabelPdf.new(packet_id: "Z1234567890", format: "A7 on A4")
created_label = Packeta::PacketLabelPdf.new(label).call
created_label.pdf
#=> ""%PDF-1.7\n%\xE2\xE3\xCF\xD3\n7 0 obj\n<< /Type /Page /Parent 1 0 R…"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Mixit-cz/packeta.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
