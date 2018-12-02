class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects, id: :bigserial do |t|
      t.text :project_nm, null: false, default: ''
      t.column :start_at, :timestamptz
      t.column :release_at, :timestamptz
      t.column :completed_at, :timestamptz

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end
