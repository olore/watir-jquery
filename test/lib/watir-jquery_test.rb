require 'test/unit'
require 'watir-webdriver'
require File.expand_path('../../../lib/watir-jquery.rb', __FILE__)

class WatirJqueryTest < Test::Unit::TestCase

  FIXTURES_DIR = "#{File.expand_path(File.dirname(__FILE__))}/../fixtures"

  def teardown
    @browser.close
  end

  def test_selecting_by_jquery_returns_same_selector_info_as_by_div
    open_test_file
    by_div    = @browser.div(:id => 'div1')
    by_jquery = @browser.jq('#div1')

    assert_equal by_div.instance_variable_get(:@selector), by_jquery.instance_variable_get(:@selector)
  end

  def test_matching_element_by_class
    open_test_file
    by_div    = @browser.div(:class => 'one')
    by_jquery = @browser.jq('.one')

    assert_equal by_div.instance_variable_get(:@selector), by_jquery.instance_variable_get(:@selector)
  end

  # multiples works differently in that instead of returning
  # a DivCollection, it returns a Div[]
  def test_matching_multiple_elements_by_class
    open_test_file
    by_div    = @browser.divs(:class => 'four')
    by_jquery = @browser.jq('.four')

    assert_equal by_div.count, by_jquery.count, "Didn't get the same counts!"
    assert_equal by_div.map{|d| d.class_name}, by_jquery.map{|d| d.class_name}, "Class names of selected elements are different!"
  end

  def test_jquery_defined
    open_test_file
    assert_equal true, @browser.send(:jquery_defined?)
  end

  def test_jquery_is_not_defined
    open_test_file("no-jquery.html")
    assert_equal false, @browser.send(:jquery_defined?)
  end

  private

  def open_test_file(file = "test.html")
    @browser = Watir::Browser.new
    #@browser.goto "file://#{File.expand_path(File.dirname(__FILE__))}/#{file}"
    @browser.goto "file://#{FIXTURES_DIR}/#{file}"
    @browser.wait
  end

end
