class AddNameColumnToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :name, :string
  end
end
