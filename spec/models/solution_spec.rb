require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Solution do
  before(:each) do
    @valid_attributes = {
      :issue => ,
      :user => ,
      :type => "value for type"
    }
  end

  it "should create a new instance given valid attributes" do
    Solution.create!(@valid_attributes)
  end
end
