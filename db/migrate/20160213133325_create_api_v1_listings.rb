class CreateApiV1Listings < ActiveRecord::Migration[5.0]
  def change
    create_table :api_v1_listings do |t|

      t.timestamps
    end
  end
end
