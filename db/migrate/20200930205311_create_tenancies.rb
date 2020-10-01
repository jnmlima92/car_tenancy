class CreateTenancies < ActiveRecord::Migration[5.0]
  def change
    create_table :tenancies do |t|
      t.datetime :checkin
      t.datetime :checkout
      t.string :tenant_cpf
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
