$(function() {
    $('#change_host').click()(function(e) {
        host = $(this).data('host');
        $
    });
    $('#add_contact_form input[type=submit]').click(function(e){
        formData = $('#add_contact_form').serializeArray();

        contacts = _.reduce(formData, function(memo, field) {
            key = field['name'];
            value = field['value'];
            memo[key] = value;
            return memo
        }, {});
        contacts = JSON.stringify([ contacts ]);
        console.log("contacts=" + contacts);


        var url = $('#add_contact_form').attr("action");
        $.ajax({
            type: "POST",
            url: url,
            data: { contacts: contacts}
        })
            .done(function(data, textStatus, jqXHR){
                console.log("Ajax completed: " + data);
            })
            .fail(function(jqXHR, textStatus, errorThrown){
                console.log("Ajax problem: " + textStatus + ". " + errorThrown);
            });
        e.preventDefault();
        e.stopPropagation();
        return false;
    });
});

