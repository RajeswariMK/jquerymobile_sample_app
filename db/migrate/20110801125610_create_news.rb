class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.text :description
      t.datetime :published_on
      t.boolean :show

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
