require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IssuesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "issues", :action => "index").should == "/issues"
    end
  
    it "maps #new" do
      route_for(:controller => "issues", :action => "new").should == "/issues/new"
    end
  
    it "maps #show" do
      route_for(:controller => "issues", :action => "show", :id => "1").should == "/issues/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "issues", :action => "edit", :id => "1").should == "/issues/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "issues", :action => "create").should == {:path => "/issues", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "issues", :action => "update", :id => "1").should == {:path =>"/issues/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "issues", :action => "destroy", :id => "1").should == {:path =>"/issues/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/issues").should == {:controller => "issues", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/issues/new").should == {:controller => "issues", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/issues").should == {:controller => "issues", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/issues/1").should == {:controller => "issues", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/issues/1/edit").should == {:controller => "issues", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/issues/1").should == {:controller => "issues", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/issues/1").should == {:controller => "issues", :action => "destroy", :id => "1"}
    end
  end
end
