class CreateJobApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :job_applications do |t|
      t.string :company_name
      t.string :position
      t.date :application_date
      t.string :status
      t.string :resume
      t.string :cover_letter

      t.timestamps
    end
  end
end
