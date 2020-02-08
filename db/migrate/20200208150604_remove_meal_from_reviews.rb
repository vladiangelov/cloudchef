class RemoveMealFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :meal, foreign_key: true
  end
end
