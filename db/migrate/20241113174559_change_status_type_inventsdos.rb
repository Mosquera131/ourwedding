class ChangeStatusTypeInventsdos < ActiveRecord::Migration[7.2]
  def up
    # Agregar una nueva columna de tipo string para status temporalmente
    add_column :events, :new_status, :string

    # Migrar los valores de `status` integer a `new_status` string
    Event.reset_column_information
    Event.find_each do |event|
      case event.status
      when 1
        event.update_column(:new_status, "active")
      when 2
        event.update_column(:new_status, "completed")
      when 3
        event.update_column(:new_status, "cancelled")
      end
    end

    # Eliminar la columna `status` original
    remove_column :events, :status

    # Renombrar `new_status` a `status`
    rename_column :events, :new_status, :status
  end

  def down
    # Revertir el cambio si es necesario
    add_column :events, :old_status, :integer

    Event.reset_column_information
    Event.find_each do |event|
      case event.status
      when "active"
        event.update_column(:old_status, 1)
      when "completed"
        event.update_column(:old_status, 2)
      when "cancelled"
        event.update_column(:old_status, 3)
      end
    end

    remove_column :events, :status
    rename_column :events, :old_status, :status
  end
end
