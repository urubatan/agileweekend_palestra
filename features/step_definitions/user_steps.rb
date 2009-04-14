Given /^os seguintes usuários:$/ do |users|
  User.create!(users.hashes)
end
Given /^as seguintes ligações:$/ do |issues|
  Issue.create!(issues.hashes)
end
Given /^que existe um usuário padrão$/ do
  User.create!(:name=>"user1", :password=>"Password1", :email => "user1@domain.com")
end
Given /^que ele ja esta autenticado$/ do
  visit new_session_path 
  fill_in("Name", :with => "user1") 
  fill_in("Password", :with => 'Password1') 
  click_button("Login")
  response.body.should_not =~ /inválidos/m  

end

When /^eu deleto o usuário número (\d+)$/ do |pos|
  visit users_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^eu devo ver os seguintes usuários:$/ do |users|
  users.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end
