require "watir"

browser = Watir::Browser.new :firefox
browser.goto "http://amazon.co.uk"
(browser.text_field id: "twotabsearchtextbox").set "Eloquent ruby book"
(browser.button value: "Go").click
puts browser.element(css: "#result_0 .s-price").text
