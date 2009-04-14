require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolutionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "solutions", :action => "index").should == "/solutions"
    end
  
    it "maps #new" do
      route_for(:controller => "solutions", :action => "new").should == "/solutions/new"
    end
  
    it "maps #show" do
      route_for(:controller => "solutions", :action => "show", :id => "1").should == "/solutions/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "solutions", :action => "edit", :id => "1").should == "/solutions/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "solutions", :action => "create").should == {:path => "/solutions", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "solutions", :action => "update", :id => "1").should == {:path =>"/solutions/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "solutions", :action => "destroy", :id => "1").should == {:path =>"/solutions/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/solutions").should == {:controller => "solutions", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/solutions/new").should == {:controller => "solutions", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/solutions").should == {:controller => "solutions", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/solutions/1").should == {:controller => "solutions", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/solutions/1/edit").should == {:controller => "solutions", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/solutions/1").should == {:controller => "solutions", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/solutions/1").should == {:controller => "solutions", :action => "destroy", :id => "1"}
    end
  end
end
