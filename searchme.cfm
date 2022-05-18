<cfsetting enablecfoutputonly="true" showdebugoutput="false" /><cfsilent>

<cfset local = structNew() />

<cfquery name="qryPersons" datasource="testdbdsn">
	SELECT
	p.id
	, p.firstName
	, p.lastName

	FROM persons AS p
	WHERE
	(CONCAT(p.firstName, ' ', p.lastName) LIKE <cfqueryparam value="%#url.term#%" cfsqltype="cf_sql_varchar" />)
</cfquery>


          <cfset variables.skillData = ArrayNew(1) />
          <cfloop query = "qryPersons">
               <cfset data['id']=id/>
               <cfset data['value']=firstName/>
               <cfset ArrayAppend(skillData, data)/>
          </cfloop>
          <cfset variables.serializedStr = serializeJSON(variables.skillData)/>
  

</cfsilent><cfoutput>#variables.serializedStr#</cfoutput>