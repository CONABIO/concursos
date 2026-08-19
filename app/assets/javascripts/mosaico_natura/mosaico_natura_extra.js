$(document).ready(function(){

    $('[data-toggle="tooltip"]').tooltip();
    $('.toast').toast('show');

    // Coloca los nested-fields después de los botones
    $("#medias a.add_fields").data(
        "association-insertion-method",
        "after"
    );

    updateCategoryCounters();

    $('#medias').on('cocoon:after-insert', function(e, insertedItem) {

        updateCategoryCounters();

        // Lleva al usuario al formulario recién agregado
        insertedItem[0].scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });

    });

    $('#medias').on('cocoon:after-remove', function() {

        updateCategoryCounters();

    });

    function updateCategoryCounters() {

        $("#medias a.add_fields").each(function() {

            let link = $(this);

            let categoria = link.data('categoria');

            let maximos = parseInt(link.data('maximos'));

            let nestedClass =
                $('.nested-fields-for-' + categoria + ':visible');

            let total = nestedClass.length;

            let nombreCategoria = categoria
                .replace(/_/g, ' ')
                .replace(/\b\w/g, function(l) {
                    return l.toUpperCase();
                });

            link.text(
                'Agregar foto a ' +
                nombreCategoria +
                ' (' + total + '/' + maximos + ')'
            );

            if (total >= maximos) {

                link
                    .removeClass('btn-outline-info')
                    .addClass('btn-success disabled');

            } else {

                link
                    .removeClass('btn-success disabled')
                    .addClass('btn-outline-info');

            }

        });

    }

    $("#medias").on('change', '.file-to-upload', function() {

        if (!this.files.length) {
            return;
        }

        let file = this.files[0];

        let container =
            $(this)
            .closest('.nested-fields')
            .find('.preview-container');

        container.empty();

        // Vista previa de video
        if (file.type.indexOf('video') === 0) {

            let videoUrl = URL.createObjectURL(file);

            container.html(
                '<video controls class="img-fluid rounded mb-3">' +
                    '<source src="' + videoUrl + '">' +
                '</video>'
            );

            return true;
        }

        let reader = new FileReader();

        reader.readAsDataURL(file);

        reader.onload = function(e) {

            // Vista previa inmediata
            container.html(
                '<img src="' +
                e.target.result +
                '" class="img-fluid rounded shadow mb-3" alt="Vista previa">'
            );

            let image = new Image();

            image.src = e.target.result;

            image.onload = function() {

                let h = this.height;
                let w = this.width;

                let largerSide = h > w ? h : w;

                if (largerSide > 3000 && largerSide < 4500) {

                    container.prepend(
                        '<div class="alert alert-success py-2">' +
                        '✓ Imagen válida (' +
                        w + ' × ' + h +
                        ' px)' +
                        '</div>'
                    );

                } else {

                    container.prepend(
                        '<div class="alert alert-danger py-2">' +
                        '⚠ La imagen no cumple con las dimensiones recomendadas.' +
                        '</div>'
                    );

                    alert(
                        "Cambia tu foto, no cumple con las medidas mínimas/máximas especificadas en las bases del concurso:\n\n" +
                        "Tamaño mínimo: 3,000 pixeles por lado más grande\n" +
                        "Tamaño máximo: 4,500 pixeles por lado más grande\n\n" +
                        "De subirla será descalificada."
                    );

                }

            };

        };

    });

});
$(document).on('click', '.editar-media', function() {

    $(this)
      .closest('.card')
      .find('.edit-form')
      .toggleClass('d-none');

});