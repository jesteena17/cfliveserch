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
                 <ul><li></li></ul>
                    "/>
               </cfloop>
              
          <cfelse>
               <cfset variables.res=variables.res&"<div class='item'>
               <div class='d-flex justify-content-center'>
                    <center><span class='fwhite'>No Movies Found</span> </center>
               </div>
               </div>"/>
                <cfset variables.res=""/>
          </cfif>
           
          <cfoutput>#variables.res#</cfoutput>
     </cffunction>  
</cfcomponent>