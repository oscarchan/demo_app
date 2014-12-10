//= require jquery.form

$(function(){
    document.domain = document.domain.split('.').slice(-2).join('.');

    $.fn.ajaxSubmit.debug = false;

    function beforeFunction(formData, jqForm, options) {
        var queryString = $.param(formData);

        console.log('About to submit: ' + queryString);
    }

    function errorFunction(xhr,  status, error) {
        console.log('success: status=' + status + ';' + ' error=' + error);
    }

    function successFunction(response, status, xhr, $form) {
        console.log('success: status=' + status + ';' + ' response=' + response);


        $('#upload_file_form_output').append('<pre>' + JSON.stringify(response) + '</pre>')
    }

    function completeFunction(xhr, status) {
        console.log('completed: status=' + status + ';' + ' xhr=' + xhr);
    }

    $('#ajaxForm-form').ajaxForm({
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

        beforeSubmit: beforeFunction,

        success: successFunction


    });

    $('#ajaxSubmit-form').submit(function() {
        $(this).ajaxSubmit({
            iframeTarget: $("#ajax_iframe")[0],

            dataType: 'json',
            data: {"abc": "123"},

            beforeSubmit: beforeFunction,

            success: successFunction,

            error: errorFunction,

            complete: completeFunction
        });

        return false;
    });

    var alertFallback = true;
    if (typeof console === "undefined" || typeof console.log === "undefined") {
        console = {};
        if (alertFallback) {
            console.log = function(msg) {
                alert(msg);
            };
        } else {
            console.log = function() {};
        }
    }
});