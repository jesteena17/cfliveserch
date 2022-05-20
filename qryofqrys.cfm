<h1>persons List</h1>

<cfset lname="Doe">
<cfquery name="master">
SELECT * from persons
</cfquery>
<cfquery dbtype="query" name="detail">
SELECT id, FirstName, LastName FROM master WHERE LastName=<cfqueryparam value="#lname#" cfsqltype="cf_sql_char" maxLength="20">
</cfquery>
<p>Output using a query of query:</p>
<cfloop query="#detail#">
#id#: #FirstName# #LastName#<br>
</cfloop>

<p>Columns in the master query:</p>

<cfoutput>

#master.columnlist#<br>

</cfoutput>

<p>Columns in the detail query:</p>

<cfoutput>

#detail.columnlist#<br>

</cfoutput>