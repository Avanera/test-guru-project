class AddGithubIdToGists < ActiveRecord::Migration[6.0]
  def change
    add_column :gists, :github_id, :string
  end
end
