class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.references :issue
      t.references :user
      t.string :type
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
