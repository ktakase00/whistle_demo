class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones, id: :bigserial do |t|
      t.bigint :project_id, null: false, default: 0
      t.text :milestone_nm, null: false, default: ''
      t.column :schedule_at, :timestamptz, null: false
      t.column :completed_at, :timestamptz

      t.column :created_at, :timestamptz, null: false
      t.column :updated_at, :timestamptz, null: false
    end
  end
end
