class EntreAzulYVerde::GaleriasController < EntreAzulYVerde::EntreAzulYVerdeController

  def index
    @dibujos = {}
    @dibujos[:menores_a_9] = UsuarioAyv.dibujos_ganadores.menores_a_9
    @dibujos[:de_9_a_11] = UsuarioAyv.dibujos_ganadores.de_9_a_11
    @dibujos[:de_12_a_14] = UsuarioAyv.dibujos_ganadores.de_12_a_14
    @dibujos[:mayores_a_14] = UsuarioAyv.dibujos_ganadores.mayores_a_14
  end
end
