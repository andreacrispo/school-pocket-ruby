function rowStyle(row, index) {
	if (row.completed) {
	    return {
	        classes: 'success tr-completed'
	    };
	}
	return {}; 	
}
 function priorityFormatter(value) {
    switch(value) {
      case 0:
        return '<span class="label label-danger">High</span>'
      case 1:
        return '<span class="label label-success">Normal</span>' 
      case 2 :
        return '<span class="label label-default">Low</span>' 
    }
 }

 function actionFormatter(value, row, index) {
 	var completed = row.completed ? 'remove-circle' : 'ok-circle';
    return [
        '<a class="toggle btn btn-primary"  href="javascript:void(0)"  title="Toggle complete">',
        '<i class="glyphicon glyphicon-'+completed +'"></i>',
        '</a>',
        '<a class="edit btn btn-primary"  href="javascript:void(0)"  title="Edit">',
        '<i class="glyphicon glyphicon-pencil"></i>',
        '</a>',
        '<a class="remove btn btn-primary" href="javascript:void(0)" title="Remove">',
        '<i class="glyphicon glyphicon-trash"></i>',
        '</a>'
    ].join('');
}

window.actionEvents = {
    'click .toggle': function (e, value, row, index) {
      var url_to_toggle = '/homeworks/' + row.id + '/toggle_complete';
      $.ajax({
            url: url_to_toggle,
            type: 'patch',
            dataType: "json",
            success: function(result){
               $('#homeworks_table').bootstrapTable('refresh');
             },
             error: function () {
               alert("error");
             }
      });
    },
    'click .edit': function (e, value, row, index) {
      var url_to_edit = '/homeworks/' + row.id + '/edit';
      $(window.location).attr('href', url_to_edit);
    },
    'click .remove': function (e, value, row, index) {
      var url_to_delete = '/homeworks/' + row.id;
      $.ajax({
            url: url_to_delete,
            type: 'delete',
            dataType: "json",
            success: function(result){
               $('#homeworks_table').bootstrapTable('removeByUniqueId', row.id);
             },
             error: function () {
               console.log("error");
             }
      });
    }
};

