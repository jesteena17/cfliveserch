  <cfoutput>
      

   <cfset animals=["cat","dog","horse","lion","tiger"]/>
 
 <cfloop array="#animals#" index="itm">
    #itm#<br>
 </cfloop>
   
 <cfset  h=animals.map(function(k,v){
          return k.Reverse(); 
     })/>

<cfdump var=#h#>

     </cfoutput>
     <cfscript>
   animals=["cat","dog","horse","lion","tiger"];
   function getSize(word){
   return len(word);
}
   writeDump(animals.map(getSize));

      supheros=[
           {"name":"Iron Man","member":"Avengers"},
           {"name":"Wonder Woman","member":"Justice League"},
           {"name":"Hulk","member":"Avengers"},
           {"name":"Thor","member":"Avengers"},
           {"name":"Aquaman","member":"Justice League"}
     ];

     for (i=1;i<=arrayLen(supheros);i++){
           if (supheros[i].member=="Avengers"){
                avengers[i]=supheros[i];
           }
     }
     writeDump(avengers);
     supheros=[
           {"name":"Iron Man","member":"Avengers"},
           {"name":"Wonder Woman","member":"Justice League"},
           {"name":"Hulk","member":"Avengers"},
           {"name":"Thor","member":"Avengers"},
           {"name":"Aquaman","member":"Justice League"}
     ];

     avengers=supheros.filter(function(item){
           return item.member=="Avengers";
     });
     writeDump(avengers);
       
     numarray=[1,2,3,4,5];
     sum=0;
     for (i=1;i<=arrayLen(numarray);i++){
           sum+=numarray[i];
     }
     writeoutput(sum);
       wordarray=["I","love","ColdFusion"];
     msg="";
     for (i=1;i<=arrayLen(wordarray);i++){
           msg&=wordarray[i];
     }
     writeoutput(msg);
         data = [1,2,3,4,5,6];
       sum=data.reduce(function(previous,next) {
       return previous+next;
       },0);
       writeOutput(sum);
       mydta = [ {a: 4}, {a: 18}, {a: 51} ];
newArray = arrayMap( mydta, function(item){
   return item.a;
});
writeDump(newArray);
</cfscript>