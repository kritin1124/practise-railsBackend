class AddRelation < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :book, foreign_key: true
    remove_column :products , :name,:string
  end
end
