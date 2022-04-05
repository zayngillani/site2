class CreateJoinTableClientProfession < ActiveRecord::Migration[7.0]
  def change
    create_join_table :clients, :professions do |t|
      t.index [:client_id, :profession_id]
      t.index [:profession_id, :client_id]
    end
  end
end
