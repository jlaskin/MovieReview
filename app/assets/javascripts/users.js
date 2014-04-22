
$(document).on("page:load", function(){
	$(".hide-btn").click(function(){
		if ($(".dash-review").hasClass("hide")){
				$(".dash-review").removeClass("hide");
				$(".hide-btn").text("Hide Recommendations");
		}
		else{
				$(".dash-review").addClass("hide");
				$(".hide-btn").text("Show Recommendations");
		}
	});

	$(".hide-btn").click(function(){
		$(".square").css({width: 75, height: 75});
	});
});