
 $('#example-shuxing').DataTable({
"paging": false,
 "lengthChange": false,
    "searching": false,
     "ordering": false,
         "info": false,
     "autoWidth": false,
     "autoHeight": false
        });
$('#example-shuxing1').DataTable({
"paging": false,
 "lengthChange": false,
    "searching": false,
     "ordering": false,
         "info": false,
     "autoWidth": false,
     "autoHeight": false
        });
$('#example-shuxing2').DataTable({
"paging": false,
 "lengthChange": false,
    "searching": false,
     "ordering": false,
         "info": false,
     "autoWidth": false,
     "autoHeight": false
    });
//第一个
$(document).ready(function() {
    var table = $('#example-shuxing').DataTable();
 	$('#example-shuxing tbody').on( 'click', 'tr', function () {
 		if ( $(this).hasClass('selected') ) {
    		$(this).removeClass('selected');
 		}
		else {
     		table.$('tr.selected').removeClass('selected');
     		$(this).addClass('selected');
    	}
    } );
 	$('#removeRow').click( function () {
 		table.row('.selected').remove().draw( false );
    } );
} );
$(document).ready(function() {
    var t = $('#example-shuxing').DataTable();
    var counter = 1;
 	$('#addRow').on( 'click', function () {
    	t.row.add( [
          	'<input type="text" class="form-control" value="" style="width:100%">',
         	'<input type="text" class="form-control" value="" style="width:100%">',
		] ).draw();
    	 counter++;
    } );
   $('#addRow').click();
} );
//第二个
$(document).ready(function() {
    var table = $('#example-shuxing1').DataTable();
 	$('#example-shuxing1 tbody').on( 'click', 'tr', function () {
 		if ( $(this).hasClass('selected') ) {
    	$(this).removeClass('selected');
 	  }
	 else {
    	 table.$('tr.selected').removeClass('selected');
     	$(this).addClass('selected');
     }
    } );
  $('#removeRow1').click( function () {
 	table.row('.selected').remove().draw( false );
    } );
} );
$(document).ready(function() {
    var t = $('#example-shuxing1').DataTable();
     var counter = 1;
    $('#addRow1').on( 'click', function () {
       t.row.add( [
          '<input type="text" class="form-control" value="" style="width:100%">',
         '<input type="text" class="form-control" value="" style="width:100%">',
         '<input type="text" class="form-control" value="" style="width:100%">',
           '<select class="form-control " style="width: 100%;"><option value="0">注意值</option><option value="1">告警值</option></select>',
         '<select class="form-control " style="width: 100%;"><option value="0">上限</option><option value="1">下限</option><option value="1">上下限区间</option></select>',
          '<input type="text" class="form-control" value="" style="width:100%">',
    ] ).draw();
      counter++;
} );
  $('#addRow1').click();
    } );
$(document).ready(function() {
    var table = $('#example-shuxing2').DataTable();
 $('#example-shuxing2 tbody').on( 'click', 'tr', function () {
 if ( $(this).hasClass('selected') ) {
    $(this).removeClass('selected');
 }
else {
     table.$('tr.selected').removeClass('selected');
     $(this).addClass('selected');
     }
  } );
  $('#removeRow2').click( function () {
 table.row('.selected').remove().draw( false );
    } );
} );
$(document).ready(function() {
    var t = $('#example-shuxing2').DataTable();
     var counter = 1;
    $('#addRow2').on( 'click', function () {
      t.row.add( [
          '<input type="text" class="form-control" value="" style="width:100%">',
         '<select class="form-control " style="width: 100%;"><option value="0">等于</option></select>',
         '<input type="text" class="form-control" value="" style="width:100%">',
         ] ).draw();
         counter++;
     } );
  $('#addRow2').click();
 } );
     
