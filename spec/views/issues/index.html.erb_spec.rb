require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/issues/index.html.erb" do
  include IssuesHelper
  
  before(:each) do
    assigns[:issues] = [
      stub_model(Issue,
        :title => "value for title",
        :description => "value for description"
      ),
      stub_model(Issue,
        :title => "value for title",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of issues" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

