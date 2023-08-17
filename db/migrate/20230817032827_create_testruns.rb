class CreateTestruns < ActiveRecord::Migration[7.0]
  def change
    create_table :testruns do |t|
      t.string :firstopt
      t.string :secondopt

      t.timestamps
    end
  end
end
