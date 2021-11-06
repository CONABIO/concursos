class Direccion < ApplicationRecord

	belongs_to :usuario
	ESTADOS = [["Aguascalientes", "aguascalientes"], ["Baja California", "baja-california"], ["Baja California Sur", "baja-california-sur"], ["Campeche", "campeche"], ["Coahuila", "coahuila"], ["Colima", "colima"], ["Chiapas", "chiapas"], ["Chihuahua", "chihuahua"], ["Ciudad de México", "ciudad-de-mexico"], ["Durango", "durango"], ["Guanajuato", "guanajuato"], ["Guerrero", "guerrero"], ["Hidalgo", "hidalgo"], ["Jalisco", "jalisco"], ["Estado de México", "estado-de-mexico"], ["Michoacán", "michoacan"], ["Morelos", "morelos"], ["Nayarit", "nayarit"], ["Nuevo León", "nuevo-leon"], ["Oaxaca", "oaxaca"], ["Puebla", "puebla"], ["Querétaro", "queretaro"], ["Quintana Roo", "quintana-roo"], ["San Luis Potosí", "san-luis-potosi"], ["Sinaloa", "sinaloa"], ["Sonora", "sonora"], ["Tabasco", "tabasco"], ["Tamaulipas", "tamaulipas"], ["Tlaxcala", "tlaxcala"], ["Veracruz", "veracruz"], ["Yucatán", "yucatan"], ["Zacatecas", "zacatecas"]]

end
