$(document).ready(function(){
		$('#modalConcurso').on('show.bs.modal', function (event) {
				var button = $(event.relatedTarget) // Button that triggered the modal
				var seccion = button.data('seccion') // Extract info from data-* attributes
				
				$(this).find('#modalConcursoLabel').text(button.data('title'))
				$(this).find('.modal-content').addClass(seccion)
				$(this).find('.modal-body').load('/entre_azul_y_verde/'+seccion, function (data) {
				
				});
		});
});

