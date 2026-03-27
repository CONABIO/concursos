# == Schema Information
#
# Table name: direcciones
#
#  id         :bigint           not null, primary key
#  calle      :string(255)
#  colonia    :string(255)
#  cp         :string(255)
#  estado     :string(255)
#  interior   :string(255)
#  municipio  :string(255)
#  numero     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  usuario_id :integer          not null
#
class Direccion < ApplicationRecord

	belongs_to :usuario
	ESTADOS = [["Aguascalientes", "aguascalientes"], ["Baja California", "baja-california"], ["Baja California Sur", "baja-california-sur"], ["Campeche", "campeche"], ["Chiapas", "chiapas"], ["Chihuahua", "chihuahua"], ["Ciudad de México", "ciudad-de-mexico"], ["Coahuila", "coahuila"], ["Colima", "colima"], ["Durango", "durango"], ["Estado de México", "estado-de-mexico"], ["Guanajuato", "guanajuato"], ["Guerrero", "guerrero"], ["Hidalgo", "hidalgo"], ["Jalisco", "jalisco"], ["Michoacán", "michoacan"], ["Morelos", "morelos"], ["Nayarit", "nayarit"], ["Nuevo León", "nuevo-leon"], ["Oaxaca", "oaxaca"], ["Puebla", "puebla"], ["Querétaro", "queretaro"], ["Quintana Roo", "quintana-roo"], ["San Luis Potosí", "san-luis-potosi"], ["Sinaloa", "sinaloa"], ["Sonora", "sonora"], ["Tabasco", "tabasco"], ["Tamaulipas", "tamaulipas"], ["Tlaxcala", "tlaxcala"], ["Veracruz", "veracruz"], ["Yucatán", "yucatan"], ["Zacatecas", "zacatecas"]]

end
