//= require jquery.form

$(function(){
    $.fn.ajaxSubmit.debug = true;


    $('#new_file_upload_form').ajaxForm({
        // target: "#upload_file_form_output",
        dataType: 'json',
        // other available options:
        //url:       url         // override for form's 'action' attribute
        //type:      type        // 'get' or 'post', override for form's 'method' attribute
        //dataType:  null        // 'xml', 'script', or 'json' (expected server response type)
        //clearForm: true        // clear all form fields after successful submit
        //resetForm: true        // reset the form after successful submit

        // $.ajax options can be used here too, for example:
        //timeout:   3000

        beforeSubmit: function(formData, jqForm, options) {
            var queryString = $.param(formData);

            console.log('About to submit: ' + queryString);
        },

        success: function(response, status, xhr, $form) {
            console.log('status=' + status + ';' + ' response=' + response);


            $('#upload_file_form_output').append('<pre>' + response.content + '</pre>')
        }
    });
});