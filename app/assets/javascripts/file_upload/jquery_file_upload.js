//= require jquery.fileupload

function successFunction(event, data) {
    console.log('success: status=' + event + ';' + ' response=' + data.result);

    if(data.jqXHR) {
        $('#upload_file_output').append('<pre>' + JSON.stringify(data.result) + '</pre>');
    }
}

function failFunction(event, data) {
    console.log('failed: status=' + event + ';' + ' response=' + data.result);

    if(data.jqXHR) {
        $('#upload_file_output').append('failed');
    }
}


$(function(){
    // remove no file chosen
    var form = $("#jquery_file_upload-id");

    // no file chosen solution does not work with jquery out of the box
/*
    form.find(".file_input .button")
        .click(function(e) {
            e.stopPropagation();
            e.preventDefault();

            form.find("input:file").trigger('click');
        });
*/
    var dataType = 'json',
        forceIframeTransport = false;

    var file_api_support = $("<input type='file'/>").get(0).files !== undefined;

    file_api_support = false;
    if(! file_api_support) {
        dataType = 'text';
        forceIframeTransport = true;
    }

    form.fileupload({
        dataType: dataType,
        autoUpload: false,

        // force iframe transport for testing
        forceIframeTransport: forceIframeTransport,
        done: successFunction,

        accepts: {
            text: 'text/html',
            json: 'application/json'
        },

        fail: failFunction,
        add: function(e, data) {
            var self = this;

            console.log("data.files=" + data.files);

            // update the file name
            form.find(".selected_file").text(data.files[0].name);

            form.find("input:submit")
                .off('click')
                .one('click', function(e) {
                    e.stopPropagation();
                    e.preventDefault();

                    data.context = $('<p/>').text('Uploading...').replaceAll($(this));
                    data.submit();
                });

            $.blueimp.fileupload.prototype
                .options.add.call(self, e, data);
        }

    });

    /*
    var redirect_url = window.location.host + '/file_upload/result.json?%s';
    form.fileupload(
        'option',
        'redirect',
        redirect_url
    );
    */


});