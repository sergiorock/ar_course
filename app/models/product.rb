# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  code       :string
#  stock      :integer          default(0)
#  price      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  # Un modelo es la representacion de una tabla en la base de datos.
  # El modelo se represesenta a traves de una clase. (En este caso Product)

  # Callbacks

  # Un callback es un metodo que se ejecuta cuando un evento para nuestro objeto de tipo model ocurre.
  # Podemos ejecutar callbacks antes o despues de ciertas acciones (crear, validar, actualizar, eliminar, etc)

  # Callbacks sobre el Método save
  before_save :validate_product
  after_save :send_notification
  after_save :push_notification, if: :discount?


  # Validaciones
  validates :title, presence: { message: "El título no puede estar vacío" }
  validates :code, presence: { message: "El código no puede estar vacío" }
  validates :code, uniqueness: { message: "El código: %{value} ya existe" }
  # validates :price, length: { minimum: 3, maximum: 10, message: "El precio no puede ser 0" }
  validates :price, length: { in: 3..10, message: "El precio se encuentra fuera de rango (Min: 3, Max: 10" }, if: :has_price?

  # Custom validations
  validate :code_validate

  # Validando desde una clase
  # Son ideales cuando implementamos modelos que hereden de otros, asi no repetimos codigo
  validates_with ProductValidator





  def total
    self.price / 100
  end

  def discount?
    self.total < 5
  end

  def has_price?
    !self.price.nil? && self.price > 0
  end

  private

  def code_validate
    if self.code.nil? || self.code.length < 3
      self.errors.add(:code, "El código debe tener al menos 3 caracteres")
    end
  end

  def validate_product
    puts "\n\n\n>>> Un nuevo producto será añadido a almacén!"
  end

  # Método de instancia
  # Detro de este metodo podemos acceder a los atributos o metodos del objeto.
  def send_notification
    puts "\n\n\n>>> Un nuevo producto fue añadido a almacén #{self.title} - $#{self.total} USD"
  end

  # Precio > 5 
  def push_notification
    puts "\n\n\n>>> Un nuevo producto en descuento ya se encuentra disponible #{self.title}"
  end


end


# Product.new -> Crea el objeto en memoria  
# Product.new_record? -> Devuelve true si el objeto no ha sido persistido
# Product.persisted? -> Devuelve true si el objeto ha sido persistido
# Product.save -> Persiste el objeto en la base de datos

# Product.create -> Crea el objeto y lo persiste en la base de datos // Este metodo está disponible para todas las clases
# hereden de ApplicationRecord
