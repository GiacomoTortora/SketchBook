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

$(document).ready(function(){
       $('#qntSelect').change(function()
       { 
          var qty=$('#qntSelect :selected').text();
          var id=$('#id').val();
          $.ajax({
               type: "POST",
               url:"CartController?action=setQuant&id="+id+"&qty="+qty,
               data:{"qty":qty, "id":id},
               success: function () {
	                  location.reload();
               },
             });                           
           });
         });



function focus(){
	document.getElementById("searchInput").focus;
}

function getQty(){
	var qty=document.getElementById("qntSelect").value;
    document.getElementById("demo").innerHTML = "You selected: " + qty;
}

function updateDiv()
{ 
    $( "#update" ).load(window.location.href + " #update" );
}
