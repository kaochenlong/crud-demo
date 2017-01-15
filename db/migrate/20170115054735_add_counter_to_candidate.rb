class AddCounterToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :votes_count, :integer, default: 0
  end
end
