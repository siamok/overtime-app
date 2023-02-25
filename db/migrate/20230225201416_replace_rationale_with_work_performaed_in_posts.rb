class ReplaceRationaleWithWorkPerformaedInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :rationale, :work_performed
  end
end
