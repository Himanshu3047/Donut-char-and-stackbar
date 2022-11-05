 


<html>
  <head>
    <title>Donut Chart</title>
    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-core.min.js"></script>
    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-pie.min.js"></script>
    <style type="text/css">      
      html, body, #container { 
        width: 100%; height: 100%; margin: 0; padding: 0; 
      } 
    </style>
  
   
    <form action="home" method="post">
   <h1> Select a City:&nbsp;</h1>
    <select name="Location">
       
     <option value="Delhi">Delhi</option>
     <option value="Mumbai">Mumbai</option>
     <option value="Hyderabad">Hyderabad</option>
     <option value="Gurugram">Gurugram</option>
     <option value="Bangalore">Bangalores</option>
     <option value="Chennai">Chennai </option>  
    </select>
    <br/><br/>
    <input type="submit" value="Submit" />
</form>

  <div id="container"></div>
  
       <script>
    
anychart.onDocumentReady(function () {
  
  // add data
  var data = anychart.data.set([
   
    ['Fail',30],  
    ['Pass',70],
  ]);
  
  // create a pie chart with the data
  var chart = anychart.pie(data);
  
  // set the chart radius making a donut chart
  chart.innerRadius('55%')

  // create a color palette
  var palette = anychart.palettes.distinctColors();
 
  // set the colors according to the brands
  palette.items([
   
    { color: '#00a3da' },
    { color: '#f60000' },
   
  ]);

  // apply the donut chart color palette
  chart.palette(palette);
  
  // set the position of labels
  chart.labels().format('{%x} = {%y}%').fontSize(16);
  
  // disable the legend
  chart.legend(false);
  
  // format the donut chart tooltip
  chart.tooltip().format('data of: {%PercentValue}%');

  // create a standalone label
  var label = anychart.standalones.label();

  // configure the label settings
  label
    .useHtml(true)
    .text(
      '<span style = "color: #313136; font-size:20px;">Data of students Pass<br/>And fail According to city </span>'    
    )
    .position('center')
    .anchor('center')
    .hAlign('center')
    .vAlign('middle');
  
  // set the label as the center content
  chart.center().content(label);
  
  // set container id for the chart
  chart.container('container');
  
  // initiate chart drawing
  chart.draw();

});

</script>

  </head>
  </body>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        ['Result', 'Passed', 'Failed', { role: 'annotation' } ],
        ['Delhi', 74, 26,''],
        ['Mumbai', 72, 28,''],
        ['Hyderabad',85,15,''],
        ['Gurugram',77,23,''],
        ['Bangalore',66,24,''],
        ['Chennai',86,14,'']
      ]);

      var options = {
        width: 600,
        height: 400,
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '75%' },
        isStacked: true
      };
    
        var chart = new google.visualization.ColumnChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="donutchart" style="width: 900px; height: 500px;"></div>
  </body>
  <body>  
     
  </body>
</html>