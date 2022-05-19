<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>livserch</title>


 <link href = "jquery-ui.css"
         rel = "stylesheet">
    <script src = "jquery-1.10.2.js"></script>
      <script src = "jquery-ui.js"></script>
      
      
</head>

<body>
		<form name="frmSearch" id="frmSearch" method="post">
		<input type="text" id="searchPersonText" name="searchPersonText" value="" />

		<input type="submit" name="btnSubmit" id="btnSubmit" value="Submit" />
	</form>
      <div class="disp"></div>
	<script type="text/javascript">
    var search ="all";
                   function movie_data(search)
                    {
                        $.ajax(
                        {
                            url: "alldata.cfc?method=displayallPersons",
                            type: "POST",
                            data: {'sdata':search},
                            dataType : "html",
                            cache: false,
                            success: function(response) 
                            {
                                 $('.disp').html(response);
                            }
                          
                        });
                    }
	 $(function() {
           $("#searchPersonText").keyup(function(){
                        $(function() {
                            $("#searchPersonText").autocomplete({
                                source: "alldata.cfc?method=displayPersonsforAutoSearch",
                               select: function( event, ui ) {
                                    event.preventDefault();
                                    $("#searchPersonText").val(ui.item.value);
                                      search=ui.item.value;
                                    movie_data(search);
                               }   
                            });
                        });
                    });
         });
 movie_data(search);
	</script>

</body>
</html>