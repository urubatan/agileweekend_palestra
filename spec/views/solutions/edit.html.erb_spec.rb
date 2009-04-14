require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solutions/edit.html.erb" do
  include SolutionsHelper
  
  before(:each) do
    assigns[:solution] = @solution = stub_model(Solution,
      :new_record? => false,
      :issue => ,
      :user => ,
      :type => "value for type"
    )
  end

  it "renders the edit solution form" do
    render
    
    response.should have_tag("form[action=#{solution_path(@solution)}][method=post]") do
      with_tag('input#solution_issue[name=?]', "solution[issue]")
      with_tag('input#solution_user[name=?]', "solution[user]")
      with_tag('input#solution_type[name=?]', "solution[type]")
    end
  end
end


