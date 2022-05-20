<cfcomponent>
     <cfset this.name = "GetMyTicketApp">
     <cfset this.clientStorage="Cookie"/>
     <cfset this.Sessionmanagement = TRUE>
     <cfset this.sessionTimeout = CreateTimeSpan(0, 0, 20, 0)/>
     <cfset this.clientManagement = true>
     <cfset this.setClientCookies = true /> 
     <cfset this.datasource="testdbdsn" />
     <cfset this.restsettings.cfclocation = "./" />
     <cffunction name="onApplicationStart" returntype="boolean">
      <cfset restInitApplication(GetDirectoryFromPath(getCurrentTemplatePath())&'cfcdir','restexample')/>
      <cfreturn true>
     </cffunction>
    
</cfcomponent>