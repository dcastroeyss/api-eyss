class AddPropertyUniqueToEmailInUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
    validates :email, uniqueness: true
  end
end
