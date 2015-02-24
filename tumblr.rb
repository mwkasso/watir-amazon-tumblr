require "watir"

browser = Watir::Browser.new :firefox
browser.goto "https://www.tumblr.com"
browser.link(:href, "https://www.tumblr.com/login").click
browser.text_field(id: "signup_email").set "larry.jonesmrfakeffakelarry-jones2015@hotmail.com"
browser.text_field(id: "signup_password").set "BzZsjXjUTpIcq0w"
browser.button(id: "signup_forms_submit").click
browser.link(href: "/new/text?redirect_to=%2Fdashboard").click
browser.div(class: "editor-plaintext").send_keys "This is a test"
browser.div(class: "editor-richtext").send_keys "This is a test"
browser.button(class:"create_post_button").click
browser.button(class:"create_post_button").wait_while_present
browser.div(class:"post_title").wait_until_present
browser.goto "http://thebitchybelievergentlemenworld.tumblr.com/"
if browser.h2(class:"title").text == "This is a test"
  puts "Successful made post"
else
  puts "Failed to make post"
end
