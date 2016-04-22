$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        url: '../../transfer',
        done: function (e, data) {
			console.log(data);
        	//$("tr:has(td)").remove();
            $.each(data.result, function (index, file) {
            	            	
                $("#uploaded-files").append(
                		$('<tr fileid='+ file.fileId +'/>')
                		.append($('<td/>').text(file.fileName))
                		.append($('<td/>').text(file.readableFileSize))
                		.append($('<td/>').text(file.fileType))
                		.append($('<td/>').html("<a>Click</a>"))
                		);//end $("#uploaded-files").append()
						
				$("#uploaded-files").find("tr[fileid="+file.fileId+"] a").bind('click',_f_BindDelete);
            }); 
        },
        
        progressall: function (e, data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $('#progress .bar').css(
	            'width',
	            progress + '%'
	        );
   		},
   		
		dropZone: $('#dropzone')
    });
	
	var _f_BindDelete = function(event){
		var _fileId = $(event.target).closest("tr").attr("fileid");
		$.ajax({
		   type: "get",
		   url: "../../filetransfer/remove",
		   data: {fileid:_fileId},
		   success: function(msg){
				$("#uploaded-files").find("tr[fileid="+_fileId+"]").remove();
		   }
		});
	};
});