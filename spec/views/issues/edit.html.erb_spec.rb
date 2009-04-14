require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/issues/edit.html.erb" do
  include IssuesHelper
  
  before(:each) do
    assigns[:issue] = @issue = stub_model(Issue,
      :new_record? => false,
      :title => "value for title",
      :description => "value for description"
    )
  end

  it "renders the edit issue form" do
    render
    
    response.should have_tag("form[action=#{issue_path(@issue)}][method=post]") do
      with_tag('input#issue_title[name=?]', "issue[title]")
      with_tag('textarea#issue_description[name=?]', "issue[description]")
    end
  end
end


