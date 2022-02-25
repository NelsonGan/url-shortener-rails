class CreateVisitHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_histories do |t|
      t.belongs_to :link
      t.text :geolocation

      t.timestamps
    end
  end
end
