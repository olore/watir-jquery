# WatirJquery

Use jQuery selectors in your Watir tests

## Installation

Add this line to your application's Gemfile:

    gem 'watir-jquery'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install watir-jquery

## Usage
```
require 'test/unit'
require 'watir-webdriver'
require 'watir-jquery'

class MyTest < Test::Unit::TestCase

  def teardown
    @browser.close
  end

  def test_one
    @browser = Watir::Browser.new
    @browser.goto "http://yahoo.com"

    via_watir  = @browser.div(:id => 'masthead')  #OLD WAY
    via_jquery = @browser.jq('#masthead')         #COOL WAY

    p via_watir
    p via_jquery
  end

end
```

Outputs:
```
# Running tests:

#<Watir::Div:0x..fe36c3523ec07067c located=false selector={:id=>"masthead", :tag_name=>"div"}>
#<Watir::Div:0x..fc84751a76dcd874c located=false selector={:id=>"masthead", :class=>"main-col  cf", :tag_name=>"div"}>
.
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
