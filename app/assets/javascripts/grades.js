
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



function create_chart(data_grades) {
  var labels = [], data=[];
  data_grades.forEach(function(d) {
    labels.push(d.date);
    // Using date or subject ?
    //labels.push(d.subject.name);
    data.push(parseFloat(d.grade));
  });
   var ctx = $("#chart_grades")
   var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels, 
            datasets: [{  
              label: "Grades Chart",
              fill: false,
              backgroundColor: "rgba(75,192,192,0.4)",
              borderColor: "rgba(75,192,192,1)",
              pointBorderColor: "rgba(75,192,192,1)",
              pointBackgroundColor: "#fff",
              pointHoverBackgroundColor: "rgba(75,192,192,1)",
              pointHoverBorderColor: "rgba(220,220,220,1)",
              pointRadius: 5,
              data: data
            }]
        }
    }); 
}

$.ajax({url:"grades.json",dataType:"json"})
.fail(function(){alert("Fail")})
.done(function(data){
  if(data.length != 0)
     create_chart(data);
  console.log(data);
});
