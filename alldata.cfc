<cfcomponent>
      <cffunction name="displayallPersons"   access="remote" returnType="any"  output="true" >   
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
           <cfset variables.res=""/>
          <cfif getmovies.recordcount() GTE 1>
          
               <cfloop QUERY='#getmovies#'>
                    <cfset variables.res=variables.res&firstname&"<br>"/>
               </cfloop>
            
          <cfelse>
               <cfset variables.res=variables.res&" <ul><li>no data</li></ul>"/>
          </cfif>
          <cfoutput>#variables.res#</cfoutput>
     </cffunction>  
     <cffunction name="displayPersonsforAutoSearch"    access="remote" returnType="any" returnFormat="JSON" output="true">   
          <cfargument name="term" required="true" >
          <cfquery name="getmovies"   result="tmpResult">
               SELECT * FROM persons where  (CONCAT(firstName, ' ', lastName) LIKE <cfqueryparam value="%#url.term#%" cfsqltype="cf_sql_varchar" />);
          </cfquery>
       
          <cfset variables.skillData = ArrayNew(1) />
    <cfif getmovies.recordcount() GTE 1>
          <cfloop query = "#getmovies#">
               <cfset ArrayAppend(variables.skillData, [id,firstName],"true")/>
          </cfloop>
          <cfelse>
              <cfset ArrayAppend(variables.skillData, "no such record","true")/>
          </cfif>
          <cfset variables.serializedStr = serializeJSON(variables.skillData)/>
          <cfreturn  variables.serializedStr>
     </cffunction>  
</cfcomponent>