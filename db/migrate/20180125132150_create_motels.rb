class CreateMotels < ActiveRecord::Migration[5.1]
  def change
    create_table :motels do |t|

      t.timestamps
    end
  end
end
