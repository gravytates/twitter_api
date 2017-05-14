class AddColumnRetweetToTweets < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :retweet, :integer
  end
end
