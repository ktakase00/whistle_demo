class CreateProjectReports < ActiveRecord::Migration[5.2]
  def change
    create_table :project_reports, id: :bigserial do |t|
      t.bigint :project_id, null: false, default: 0
      t.column :report_at, :timestamptz, null: false
      t.text :status_cd, null: false, default: ''

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end
