class CreateMilestoneReports < ActiveRecord::Migration[5.2]
  def change
    create_table :milestone_reports, id: :bigserial do |t|
      t.bigint :milestone_id, null: false, default: 0
      t.column :report_at, :timestamptz, null: false
      t.text :status_cd, null: false, default: ''

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end
