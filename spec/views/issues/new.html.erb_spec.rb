require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/issues/new.html.erb" do
  include IssuesHelper
  
  before(:each) do
    assigns[:issue] = stub_model(Issue,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description"
    )
  end

  it "renders new issue form" do
    render
    
    response.should have_tag("form[action=?][method=post]", issues_path) do
      with_tag("input#issue_title[name=?]", "issue[title]")
      with_tag("textarea#issue_description[name=?]", "issue[description]")
    end
  end
end


