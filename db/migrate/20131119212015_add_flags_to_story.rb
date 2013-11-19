class AddFlagsToStory < ActiveRecord::Migration
  def change
    add_column :stories, :following, :boolean
    add_column :stories, :public, :boolean
  end
end
