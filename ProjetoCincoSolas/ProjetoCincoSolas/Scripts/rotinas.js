function ModalError(mensagem) {
    if (mensagem == '') {
        mensagem = msgErroPadrao;
    }
    $('.feedback-alert').hide();
    $('.modal').modal('hide');
    $('#modal-erro .modal-body').html(mensagem);
    $('#modal-erro').modal('show');
}