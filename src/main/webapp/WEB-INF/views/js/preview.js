	$('#imageFile').change(function() {

		var imageFile = $('#imageFile')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#imageDemo').attr('src', e.target.result);
		};
		reader.readAsDataURL(imageFile);
	});
	
		$('#videoFile').change(function() {
		
		console.log("video file change");
		
		
	});