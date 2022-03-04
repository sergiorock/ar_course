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
end


# Product.new -> Crea el objeto en memoria  
# Product.new_record? -> Devuelve true si el objeto no ha sido persistido
# Product.persisted? -> Devuelve true si el objeto ha sido persistido
# Product.save -> Persiste el objeto en la base de datos

# Product.create -> Crea el objeto y lo persiste en la base de datos // Este metodo está disponible para todas las clases
# hereden de ApplicationRecord
