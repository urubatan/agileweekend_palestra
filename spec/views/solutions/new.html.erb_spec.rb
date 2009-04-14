require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solutions/new.html.erb" do
  include SolutionsHelper
  
  before(:each) do
    assigns[:solution] = stub_model(Solution,
      :new_record? => true,
      :issue => ,
      :user => ,
      :type => "value for type"
    )
  end

  it "renders new solution form" do
    render
    
    response.should have_tag("form[action=?][method=post]", solutions_path) do
      with_tag("input#solution_issue[name=?]", "solution[issue]")
      with_tag("input#solution_user[name=?]", "solution[user]")
      with_tag("input#solution_type[name=?]", "solution[type]")
    end
  end
end


