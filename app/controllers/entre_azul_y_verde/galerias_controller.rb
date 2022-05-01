class EntreAzulYVerde::GaleriasController < EntreAzulYVerde::EntreAzulYVerdeController

  def index
    @dibujos = {}
    @dibujos[:de_6_a_8] = UsuarioAyv.dibujos_ganadores.menores_a_9
    @dibujos[:de_9_a_11] = UsuarioAyv.dibujos_ganadores.de_9_a_11
    @dibujos[:de_12_a_14] = UsuarioAyv.dibujos_ganadores.de_12_a_14
    @dibujos[:de_15_a_17] = UsuarioAyv.dibujos_ganadores.mayores_a_14
  end
end
