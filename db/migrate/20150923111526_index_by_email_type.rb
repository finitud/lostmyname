class IndexByEmailType < ActiveRecord::Migration
  def change
    add_index(:email_data, :email_type)
  end
end
