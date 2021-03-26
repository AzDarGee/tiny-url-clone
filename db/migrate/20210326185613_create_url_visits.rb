class CreateUrlVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :url_visits do |t|
      t.string :ip_address
      t.references :url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
