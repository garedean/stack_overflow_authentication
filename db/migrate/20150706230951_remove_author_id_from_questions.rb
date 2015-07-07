class RemoveAuthorIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :author_id, :integer
  end
end
