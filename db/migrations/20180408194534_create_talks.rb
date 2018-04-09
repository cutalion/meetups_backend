Hanami::Model.migration do
  change do
    create_table :talks do
      primary_key :id
      foreign_key :meetup_id, :meetups, on_delete: :cascade, null: false
      foreign_key :speaker_id, :speakers, on_delete: :cascade, null: false

      column :title, String, null: false
      column :description, String, null: true
      column :presentation, String, null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
