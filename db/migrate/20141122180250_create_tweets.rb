class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet #makes a string called tweet
      t.timestamps
    end
  end
end
