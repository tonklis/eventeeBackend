$(document).on("ready", initialize);

function initialize(){
	$(".revoke_access").on("click", revokeAccess);
	$(".approve_access").on("click", approveAccess);
	$(".picture_delete").on("click", pictureDelete);
}

function denetialize(){
	$(".revoke_access").off("click", revokeAccess);
	$(".approve_access").off("click", approveAccess);
	$(".picture_delete").off("click", pictureDelete);
}

function revokeAccess(){
	var original_id = this.id;
	var id = original_id.split("_")[1];
	$.ajax({
      url: "/requests/revoke?id=" + id + ".json",
			type: "post",
			success: function(){
				denetialize();
				$("#"+original_id+"")[0].innerHTML = "Approve";
				$("#"+original_id+"").attr("class", "approve_access btn btn-accept");
				initialize();
			},
			error:function(error){ alert("error approving access"); }   
    });
}

function approveAccess(){
	var original_id = this.id;
	var id = original_id.split("_")[1];
	$.ajax({
      url: "/requests/approve?id=" + id + ".json",
			type: "post",
			data: {
				id: id
			},
			success: function(){
				denetialize();
				$("#"+original_id+"")[0].innerHTML = "Revoke";
				$("#"+original_id+"").attr("class", "revoke_access btn btn-accept");
				initialize();
			},
			error:function(error){ alert("error approving access"); }   
    }); 
}

function pictureDelete(){
	var original_id = this.id;
	var id = original_id.split("_")[1];

	var is_confirmed = confirm("Do you really want to delete the picture?");

	if (is_confirmed)
	{
		$.ajax({
    	  url: "custom_remove?id=" + id + ".json",
				type: "post",
				success: function(){
					$("#picture_div_"+id+"").remove();
				},
				error:function(error){ 
					$("#picture_div_"+id+"").remove();
				}   
  	  });
	}
}
