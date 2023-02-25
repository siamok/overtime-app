class AddDailyHoursToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :daily_hours, :daily_hours
  end
end
