class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :shortened_url

      t.timestamps
    end
    add_index :urls, :shortened_url, unique: true
  end
end
