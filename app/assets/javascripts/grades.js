

function actionFormatter(value, row, index) {
    return [
        '<a class="edit btn btn-primary"  href="javascript:void(0)"  title="Edit">',
        '<i class="glyphicon glyphicon-pencil"></i>',
        '</a>',
        '<a class="remove btn btn-primary" href="javascript:void(0)" title="Remove">',
        '<i class="glyphicon glyphicon-trash"></i>',
        '</a>'
    ].join('');
}

window.actionEvents = {
    'click .edit': function (e, value, row, index) {
      var url_to_edit = '/grades/' + row.id + '/edit';
      $(window.location).attr('href', url_to_edit);
    },
    'click .remove': function (e, value, row, index) {
      var url_to_delete = '/grades/' + row.id;
      $.ajax({
            url: url_to_delete,
            type: 'delete',
            dataType: "json",
            success: function(result){
               $('#grades_table').bootstrapTable('removeByUniqueId', row.id);
             },
             error: function () {
               console.log("error");
             }
      });
    }
};
