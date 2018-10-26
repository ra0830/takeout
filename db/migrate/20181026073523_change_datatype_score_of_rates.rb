class ChangeDatatypeScoreOfRates < ActiveRecord::Migration[5.2]
  def change
    change_column :rates, :score, :'integer USING CAST(score AS integer)'
  end
end
