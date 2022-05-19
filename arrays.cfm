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

      superheroes=[
           {"name":"Iron Man","member":"Avengers"},
           {"name":"Wonder Woman","member":"Justice League"},
           {"name":"Hulk","member":"Avengers"},
           {"name":"Thor","member":"Avengers"},
           {"name":"Aquaman","member":"Justice League"}
     ];

     for (i=1;i<=arrayLen(superheroes);i++){
           if (superheroes[i].member=="Avengers"){
                avengers[i]=superheroes[i];
           }
     }
     writeDump(avengers);
     superheroes=[
           {"name":"Iron Man","member":"Avengers"},
           {"name":"Wonder Woman","member":"Justice League"},
           {"name":"Hulk","member":"Avengers"},
           {"name":"Thor","member":"Avengers"},
           {"name":"Aquaman","member":"Justice League"}
     ];

     avengers=superheroes.filter(function(item){
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
     message="";
     for (i=1;i<=arrayLen(wordarray);i++){
           message&=wordarray[i];
     }
     writeoutput(message);
         data = [1,2,3,4,5,6];
       sum=data.reduce(function(previous,next) {
       return previous+next;
       },0);
       writeOutput(sum);
       complexData = [ {a: 4}, {a: 18}, {a: 51} ];
newArray = arrayMap( complexData, function(item){
   return item.a;
});
writeDump(newArray);
</cfscript>