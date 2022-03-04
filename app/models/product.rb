# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  code       :string
#  stock      :integer          default(0)
#  price      :decimal(10, 2)   default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  # Un modelo es la representacion de una tabla en la base de datos.
  # El modelo se represesenta a traves de una clase. (En este caso Product)
end
