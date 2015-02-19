require "watir-jquery/version"

module WatirJquery
  PATH_TO_JQUERY = 'https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'

  def jquery(selector, param=nil)
    define_jquery unless jquery_defined?
    script = "var a=jQuery($('#{selector}')#{param}); var b=[];for(var i =0; i< a.length; i++){b[i] = a[i]}return b;"
    elements = browser.execute_script(script)
    return elements[0] unless elements.count > 1

    # This would be nice, but can't figure out how to instantiate
    # see watir-webdriver/element_collection.rb
    # Watir::DivCollection.new(elements)

    elements
  end

  alias jq jquery

  private

  def jquery_defined?
    browser.execute_script("return typeof jQuery;") != "undefined"
  end

  def define_jquery
    script = "var scr = document.createElement('script'); scr.src='#{PATH_TO_JQUERY}'; document.getElementsByTagName('body')[0].appendChild(scr);"
    browser.execute_script(script)
  end

end

module Watir
  class Browser
    include WatirJquery

    private

    # override Watir::Browser#wrap_element
    def wrap_element(element)
#     if (element.tag_name == "input" && element.attribute("type") == "submit")
#       Watir.element_class_for("button").new(self, :element => element)
#     else
        attrs = {}
        attrs[:id]       = element.attribute(:id) unless element.attribute(:id) == ""
        attrs[:class]    = element.attribute(:class) unless element.attribute(:class) == ""
        attrs[:tag_name] = element.tag_name
        Watir.element_class_for(element.tag_name.downcase).new(self, attrs)
#     end
    end

  end
end
