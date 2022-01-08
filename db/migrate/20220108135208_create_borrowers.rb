class CreateBorrowers < ActiveRecord::Migration[6.0]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.text :description
      t.text :list
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
