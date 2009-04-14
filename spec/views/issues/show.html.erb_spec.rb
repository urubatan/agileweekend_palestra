require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/issues/show.html.erb" do
  include IssuesHelper
  before(:each) do
    assigns[:issue] = @issue = stub_model(Issue,
      :title => "value for title",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ description/)
  end
end

