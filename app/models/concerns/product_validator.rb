class ProductValidator < ActiveModel::Validator

  # Record hace referencia al objeto que deseamos validar
  def validate(record)
    self.validate_stock(record)
  end

  def validate_stock(record)
    if record.stock < 0
      record.errors.add(:stock, "El stock no puede ser un valor negativo")
    end
  end
end