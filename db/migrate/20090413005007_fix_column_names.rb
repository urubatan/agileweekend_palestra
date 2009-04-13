class FixColumnNames < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.rename :pasword, :password
    end
  end

  def self.down
    change_table :users do |t|
      t.rename :password, :pasword
    end
  end
end
