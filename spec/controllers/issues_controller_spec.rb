require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IssuesController do

  def mock_issue(stubs={})
    @mock_issue ||= mock_model(Issue, stubs)
  end
  
  describe "GET index" do

    it "exposes all issues as @issues" do
      Issue.should_receive(:find).with(:all).and_return([mock_issue])
      get :index
      assigns[:issues].should == [mock_issue]
    end

    describe "with mime type of xml" do
  
      it "renders all issues as xml" do
        Issue.should_receive(:find).with(:all).and_return(issues = mock("Array of Issues"))
        issues.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested issue as @issue" do
      Issue.should_receive(:find).with("37").and_return(mock_issue)
      get :show, :id => "37"
      assigns[:issue].should equal(mock_issue)
    end
    
    describe "with mime type of xml" do

      it "renders the requested issue as xml" do
        Issue.should_receive(:find).with("37").and_return(mock_issue)
        mock_issue.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new issue as @issue" do
      Issue.should_receive(:new).and_return(mock_issue)
      get :new
      assigns[:issue].should equal(mock_issue)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested issue as @issue" do
      Issue.should_receive(:find).with("37").and_return(mock_issue)
      get :edit, :id => "37"
      assigns[:issue].should equal(mock_issue)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created issue as @issue" do
        Issue.should_receive(:new).with({'these' => 'params'}).and_return(mock_issue(:save => true))
        post :create, :issue => {:these => 'params'}
        assigns(:issue).should equal(mock_issue)
      end

      it "redirects to the created issue" do
        Issue.stub!(:new).and_return(mock_issue(:save => true))
        post :create, :issue => {}
        response.should redirect_to(issue_url(mock_issue))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved issue as @issue" do
        Issue.stub!(:new).with({'these' => 'params'}).and_return(mock_issue(:save => false))
        post :create, :issue => {:these => 'params'}
        assigns(:issue).should equal(mock_issue)
      end

      it "re-renders the 'new' template" do
        Issue.stub!(:new).and_return(mock_issue(:save => false))
        post :create, :issue => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested issue" do
        Issue.should_receive(:find).with("37").and_return(mock_issue)
        mock_issue.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :issue => {:these => 'params'}
      end

      it "exposes the requested issue as @issue" do
        Issue.stub!(:find).and_return(mock_issue(:update_attributes => true))
        put :update, :id => "1"
        assigns(:issue).should equal(mock_issue)
      end

      it "redirects to the issue" do
        Issue.stub!(:find).and_return(mock_issue(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(issue_url(mock_issue))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested issue" do
        Issue.should_receive(:find).with("37").and_return(mock_issue)
        mock_issue.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :issue => {:these => 'params'}
      end

      it "exposes the issue as @issue" do
        Issue.stub!(:find).and_return(mock_issue(:update_attributes => false))
        put :update, :id => "1"
        assigns(:issue).should equal(mock_issue)
      end

      it "re-renders the 'edit' template" do
        Issue.stub!(:find).and_return(mock_issue(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested issue" do
      Issue.should_receive(:find).with("37").and_return(mock_issue)
      mock_issue.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the issues list" do
      Issue.stub!(:find).and_return(mock_issue(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(issues_url)
    end

  end

end
