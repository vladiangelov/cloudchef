class RemoveUserFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :user, foreign_key: true
  end
end
