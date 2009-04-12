require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

Given /^eu estou na (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^eu vou para (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^eu presciono "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^eu clico "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^eu preencho "([^\"]*)" com "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value) 
end

When /^eu seleciono "([^\"]*)" de "([^\"]*)"$/ do |value, field|
  select(value, :from => field) 
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time 
When /^eu seleciono "([^\"]*)" como data e hora$/ do |time|
  select_datetime(time)
end

# Use this step when using multiple datetime_select helpers on a page or 
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" data and time
# And I select "November 25, 2004 10:30" as the "Alternative" data and time
When /^eu seleciono "([^\"]*)" como a data e hora "([^\"]*)"$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it. 
When /^eu seleciono "([^\"]*)" como a hora$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
When /^eu seleciono "([^\"]*)" como a hora "([^\"]*)"$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
When /^eu seleciono "([^\"]*)" como a data$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
When /^eu seleciono "([^\"]*)" como a data "([^\"]*)"$/ do |date, date_label|
  select_date(date, :from => date_label)
end

When /^eu marco "([^\"]*)"$/ do |field|
  check(field) 
end

When /^eu desmarco "([^\"]*)"$/ do |field|
  uncheck(field) 
end

When /^eu escolho "([^\"]*)"$/ do |field|
  choose(field)
end

When /^eu anexo o arquivo em "([^\"]*)" para "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Then /^eu devo ver "([^\"]*)"$/ do |text|
  response.should contain(text)
end

Then /^eu não devo ver "([^\"]*)"$/ do |text|
  response.should_not contain(text)
end

Then /^o checkbox "([^\"]*)" deve estar marcado$/ do |label|
  field_labeled(label).should be_checked
end

Then /^eu devo estar na página (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end
