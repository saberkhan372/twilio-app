class CreateItemTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :message
      t.string :gif_search
      t.string :gif_url
      t.timestamps
    end
  end
end
