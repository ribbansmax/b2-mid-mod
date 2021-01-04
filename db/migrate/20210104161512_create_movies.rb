class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.references :studio, foreign_key: true
      t.string :creation_year
      t.string :genre

      t.timestamps
    end
  end
end
