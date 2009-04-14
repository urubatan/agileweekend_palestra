require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/solutions/show.html.erb" do
  include SolutionsHelper
  before(:each) do
    assigns[:solution] = @solution = stub_model(Solution,
      :issue => ,
      :user => ,
      :type => "value for type"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(/value\ for\ type/)
  end
end

