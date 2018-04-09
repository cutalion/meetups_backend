Hanami::Model.migration do
  change do
    create_table :speakers do
      primary_key :id

      column :name, String, null: false
      column :avatar, String, null: true
      column :bio, String, null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
