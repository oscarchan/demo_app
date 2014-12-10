//= require jquery.fileupload

function successFunction(event, data) {
    console.log('success: status=' + event + ';' + ' response=' + data.result);

    if(data.jqXHR) {
        $('#upload_file_output').append('<pre>' + JSON.stringify(data.result) + '</pre>');
    }
}

$(function(){
    $('#jquery_file_upload-id').fileupload({
        dataType: 'json',
        autoUpload: false,
        done: successFunction,
        add: function(e, data) {
            var self = this;

            $('#jquery_file_upload-id input[type=submit]')
                .click(function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    data.context = $('<p/>').text('Uploading...').replaceAll($(this));
                    data.submit();
                });

            $.blueimp.fileupload.prototype
                .options.add.call(self, e, data);
        }
    });

});