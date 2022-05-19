<cfcomponent>
      <cffunction name="displayallPersons"  datasource="testdbdsn" access="remote" returnType="any"  output="true">   
          <cfargument name="sdata" required="false" default="all" >
          <cfif sdata eq 'all'>
               <cfquery name="getmovies"   result="tmpResult">
                   SELECT * FROM persons;
               </cfquery>
          <cfelse>
               <cfquery name="getmovies"   result="tmpResult">
                    SELECT * FROM persons where  firstname like '%#arguments.sdata#%' or lastname like '%#arguments.sdata#%';
               </cfquery>
          </cfif>
          <cfif getmovies.recordcount() GTE 1>
            <cfset variables.res=""/>
               <cfloop QUERY='#getmovies#'>
                    <cfset variables.res=variables.res&
                    "
                 <ul><li>firstname</li></ul>
                    "/>
               </cfloop>
          <cfelse>
               <cfset variables.res=variables.res&" <ul><li>no data</li></ul>"/>
          </cfif>
          <cfoutput>#variables.res#</cfoutput>
     </cffunction>  
     <cffunction name="displayPersonsforAutoSearch"   datasource="testdbdsn"  access="remote" returnType="any" returnFormat="JSON" output="true">   
          <cfargument name="term" required="true" >
          <cfquery name="getmovies"   result="tmpResult">
               SELECT * FROM persons where  (CONCAT(firstName, ' ', lastName) LIKE <cfqueryparam value="%#url.term#%" cfsqltype="cf_sql_varchar" />);
          </cfquery>
          <cfset variables.skillData = ArrayNew(1) />
          <cfloop query = "getmovies">
                <cfset data['id']=id/>
               <cfset data['value']=firstName/>
               <cfset ArrayAppend(skillData, data)/>
          </cfloop>
          <cfset variables.serializedStr = serializeJSON(variables.skillData)/>
          <cfreturn  variables.serializedStr>
     </cffunction>  
</cfcomponent>