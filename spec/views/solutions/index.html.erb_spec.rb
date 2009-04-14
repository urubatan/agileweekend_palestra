require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solutions/index.html.erb" do
  include SolutionsHelper
  
  before(:each) do
    assigns[:solutions] = [
      stub_model(Solution,
        :issue => ,
        :user => ,
        :type => "value for type"
      ),
      stub_model(Solution,
        :issue => ,
        :user => ,
        :type => "value for type"
      )
    ]
  end

  it "renders a list of solutions" do
    render
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", "value for type".to_s, 2)
  end
end

