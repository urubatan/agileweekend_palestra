require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolutionsController do

  def mock_solution(stubs={})
    @mock_solution ||= mock_model(Solution, stubs)
  end
  
  describe "GET index" do

    it "exposes all solutions as @solutions" do
      Solution.should_receive(:find).with(:all).and_return([mock_solution])
      get :index
      assigns[:solutions].should == [mock_solution]
    end

    describe "with mime type of xml" do
  
      it "renders all solutions as xml" do
        Solution.should_receive(:find).with(:all).and_return(solutions = mock("Array of Solutions"))
        solutions.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested solution as @solution" do
      Solution.should_receive(:find).with("37").and_return(mock_solution)
      get :show, :id => "37"
      assigns[:solution].should equal(mock_solution)
    end
    
    describe "with mime type of xml" do

      it "renders the requested solution as xml" do
        Solution.should_receive(:find).with("37").and_return(mock_solution)
        mock_solution.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new solution as @solution" do
      Solution.should_receive(:new).and_return(mock_solution)
      get :new
      assigns[:solution].should equal(mock_solution)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested solution as @solution" do
      Solution.should_receive(:find).with("37").and_return(mock_solution)
      get :edit, :id => "37"
      assigns[:solution].should equal(mock_solution)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created solution as @solution" do
        Solution.should_receive(:new).with({'these' => 'params'}).and_return(mock_solution(:save => true))
        post :create, :solution => {:these => 'params'}
        assigns(:solution).should equal(mock_solution)
      end

      it "redirects to the created solution" do
        Solution.stub!(:new).and_return(mock_solution(:save => true))
        post :create, :solution => {}
        response.should redirect_to(solution_url(mock_solution))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved solution as @solution" do
        Solution.stub!(:new).with({'these' => 'params'}).and_return(mock_solution(:save => false))
        post :create, :solution => {:these => 'params'}
        assigns(:solution).should equal(mock_solution)
      end

      it "re-renders the 'new' template" do
        Solution.stub!(:new).and_return(mock_solution(:save => false))
        post :create, :solution => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested solution" do
        Solution.should_receive(:find).with("37").and_return(mock_solution)
        mock_solution.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :solution => {:these => 'params'}
      end

      it "exposes the requested solution as @solution" do
        Solution.stub!(:find).and_return(mock_solution(:update_attributes => true))
        put :update, :id => "1"
        assigns(:solution).should equal(mock_solution)
      end

      it "redirects to the solution" do
        Solution.stub!(:find).and_return(mock_solution(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(solution_url(mock_solution))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested solution" do
        Solution.should_receive(:find).with("37").and_return(mock_solution)
        mock_solution.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :solution => {:these => 'params'}
      end

      it "exposes the solution as @solution" do
        Solution.stub!(:find).and_return(mock_solution(:update_attributes => false))
        put :update, :id => "1"
        assigns(:solution).should equal(mock_solution)
      end

      it "re-renders the 'edit' template" do
        Solution.stub!(:find).and_return(mock_solution(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested solution" do
      Solution.should_receive(:find).with("37").and_return(mock_solution)
      mock_solution.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the solutions list" do
      Solution.stub!(:find).and_return(mock_solution(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(solutions_url)
    end

  end

end
