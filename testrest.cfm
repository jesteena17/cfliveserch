<cfhttp
url="http://localhost:8500/livesearch/cfcdir/restexample/restService/myfirstrestfn"
method="get"
port="8500"
result="res">
</cfhttp>
<cfoutput><cfdump var=#res#/></cfoutput>