class CreateAccountTypes < ActiveRecord::Migration
  def self.up
    create_table :account_types do |t|
      t.string :name

      t.timestamps
    end
    AccountType.create :name => "Saving"
    AccountType.create :name => "Credit"
    AccountType.create :name => "Cheque"
    AccountType.create :name => "Mortgage"
  end

  def self.down
    drop_table :account_types
  end
end
