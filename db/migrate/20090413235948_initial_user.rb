class InitialUser < ActiveRecord::Migration
  def self.up
    User.create(:name => "urubatan", :password => "urubatan", :email => "rodrigo@urubatan.com.br")
  end

  def self.down
    User.find_by_name("urubatan").destroy
  end
end
