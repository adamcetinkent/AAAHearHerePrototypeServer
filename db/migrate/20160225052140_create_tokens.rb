class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.datetime :expires
      t.string   :token
      t.string   :applicationId
      t.string   :userId

      t.timestamps null: false
    end
  end
end
