$(document).ready(function(){
		$('#modalConcurso').on('show.bs.modal', function (event) {
				var button = $(event.relatedTarget) // Button that triggered the modal
				var seccion = button.data('seccion') // Extract info from data-* attributes
				
				$(this).find('#modalConcursoLabel').text(button.data('title'))
				$(this).find('.modal-content').addClass(seccion)
				$(this).find('.modal-body').load('/entre_azul_y_verde/'+seccion, function (data) {
				
				});
		});
		$('[data-toggle="tooltip"]').tooltip();
		$('.toast').toast('show');
		
		//Coloca los nested-fields despues de los botones (.links)
		$("#medias a.add_fields").data("association-insertion-method", 'after');
		

		// limits the number of categories
		check_to_hide_or_show_add_link();
		
		$('#medias').on('cocoon:after-insert', function() {
				check_to_hide_or_show_add_link();
		});
		
		$('#medias').on('cocoon:after-remove', function() {
				check_to_hide_or_show_add_link();
		});
		
		function check_to_hide_or_show_add_link() {
				$("#medias a.add_fields").each(function () {
						link = $(this);
						nestedClass = $('.nested-fields-for-'+link.data('categoria')+':visible');
						link.attr('data-after',link.data('maximos') - nestedClass.length);
						if (nestedClass.length == link.data('maximos')) {
								link.removeClass('d-inline-flex').addClass('d-none');
						} else {
								link.addClass('d-inline-flex').removeClass('d-none');
						}
				});
		}
});

