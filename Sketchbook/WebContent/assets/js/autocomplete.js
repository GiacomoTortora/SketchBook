/**
 * 
 */
/**
 * 
 */
$(document).ready(function() {
    $('#searchInput').autocomplete({
	    //FINESTRA SUGGERIMENTI
        width: 300,
        max: 10,
        delay: 100,
        minLength: 1,
        autoFocus: false,
        cacheLength: 1,
        scroll: true,
        highlight: false,
        
        source: function(request, response) {
            $.ajax({
                url: "SearchController",
                dataType: "json",
                data: request,
                success: function( data) {
                    var items = data;  
                    response(items);  
                },
            });
        }
 
    });
});

function focus(){
	document.getElementById("searchInput").focus;
}

function getQty(){
	var qty=document.getElementName("qty").value;
    return qty;
}



function updateDiv()
{ 
    $( "#update" ).load(window.location.href + " #update" );
}
