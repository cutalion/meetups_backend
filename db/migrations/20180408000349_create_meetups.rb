Hanami::Model.migration do
  change do
    create_table :meetups do
      primary_key :id

      column :date, Date, null: false
      column :start, String, null: false
      column :end, String, null: true
      column :description, String, null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
