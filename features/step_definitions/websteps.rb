
module WithinHelpers
 def with_scope(locator)
   locator ? within(*selector_for(locator) , :match => :prefer_exact) { yield } : yield
 end
 # Rails 3.2.13 bug (json 1.7.7). Temporary, until JSON will be fixed.
 def clear_utf_symbols(string)
   string.gsub(/[»«]/, '')
 end
end
World(WithinHelpers)


When("I visit home page") do
 visit root_path
end

Then /^I click on input by value "([^\"]*)"$/ do |text_value|
  page.find("input[value=\"#{text_value}\"]").click
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(clear_utf_symbols(button), :match => :prefer_exact, :visible => true)
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
 click_link(clear_utf_symbols(link), :match => :prefer_exact, :visible => true)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
fill_in(field, :with => value, :match => :prefer_exact, :visible => true)
end

When /^(?:|I )fill in by css "([^"]*)" with "([^"]*)"$/ do |field, value|
 find("##{field}", :match => :prefer_exact, :visible => true).set(value)

end

When /^(?:|I )check "([^"]*)"$/ do |field|
 check(field, :match => :prefer_exact, :visible => true)
end

When /^(?:|I )uncheck "([^"]*)"$/ do |field|
  uncheck(field, :match => :prefer_exact, :visible => true)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text, wait: 60)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )clickicon "([^"]*)"$/ do |link|
  find(:xpath, "(//a[i[contains(@class, '#{link}')]])").click
end


Then("debugger") do
  byebug
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    assert_no_text(:visible, text)
  else
    assert_no_text(:visible, text)
  end
end

Then /^I wait for "([^\"]*)" seconds?$/ do |arg1|
  sleep arg1.to_i
end

When /^I click "([^\"]*)"$/ do |arg1|
 find(:css, arg1, :match => :first, :visible => true).click
end
