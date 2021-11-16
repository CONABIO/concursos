class Categoria < ApplicationRecord
	
	belongs_to :media
	
	#Momentaneamente las pondre aquí ya luego las paso  a la base con el crud listo
	
	CategoriasMN = [{pequeños_gigantes: "(Macro) Fotografías macro de especies o detalles que comúnmente no son percibidos a simple vista. Incluyen imágenes tomadas con microscopio.",
	                 fauna: "Incluye animales nativos de México en vida silvestre; desde pequeños insectos hasta grandes mamíferos, siempre que éstos, no estén en cautiverio o sean animales domésticos y/o mascotas.",
	                 plantas_y_hongos: "Incluye toda clase de especies vegetales y hongos nativos de México, en vida silvestre. No se aceptarán fotografías de plantas cultivadas, de maceta o jardín.",
	                 naturaleza_y_ser_humano: "Refiere a usos y costumbres relacionadas con el entorno natural (actividades agrícolas, artesanales, gastronómicas, medicinales, espirituales, recreativas, ceremoniales), manejo sustentable, conservación y/o restauración, también se considera en esta categoría, actividades que impacten de manera negativa, directa o indirectamente la biodiversidad."},
	                {paisajes_con_ecosistemas: "Imágenes de ecosistemas no perturbados de México, desde las costas hasta las altas montañas.",
	                 fotografía_aérea: "Imágenes de animales, plantas, ecosistemas o paisajes desde el aire.",
	                 fotografía_subacuática:"Imágenes de animales, plantas o hábitats subacuáticos, ya sea en un entorno marino o dulceacuícola. No se aceptarán fotografías de acuario.",
	                 cineminuto: "(Video) Breves historias de nuestra naturaleza, su uso, conservación o deterioro."},
	                {tema_libre: "(Jóvenes) Incluye cualquier fotografía relacionada con la riqueza natural de México, es decir, animales o plantas en su ambiente natural, paisajes naturales, actividades relacionadas con el hombre y la naturaleza. No se aceptarán fotografías de plantas cultivadas, animales en cautiverio o cualquier otro ambiente controlado."}].freeze

end
