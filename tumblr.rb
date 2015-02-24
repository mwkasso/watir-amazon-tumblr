require "watir"

browser = Watir::Browser.new :firefox
browser.goto "https://www.tumblr.com"
l = browser.link :href, "https://www.tumblr.com/login"
l.click
email = browser.text_field id: "signup_email"
email.set "larry.jonesmrfakeffakelarry-jones2015@hotmail.com"
pass = browser.text_field id: "signup_password"
pass.set "BzZsjXjUTpIcq0w"
browser.button(id: "signup_forms_submit").click
l = browser.link href: "/new/text?redirect_to=%2Fdashboard"
l.click
titlebox = browser.div class: "editor-plaintext"
titlebox.send_keys "This is a test"
textbox = browser.div class: "editor-richtext"
textbox.send_keys "This is a test"
browser.button(class:"create_post_button").click
browser.button(class:"create_post_button").wait_while_present
browser.div(class:"post_title").wait_until_present
browser.goto "http://thebitchybelievergentlemenworld.tumblr.com/"
if browser.h2(class:"title").text == "This is a test"
  puts "Successful made post"
else
  puts "Failed to make post"
end

