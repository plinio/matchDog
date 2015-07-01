// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require owl.carousel
//= require_tree .

  function handleFileSelect(evt) {
    var files;
    var output = [];
    if(evt.type=='drop'){
      evt.stopPropagation();
      evt.preventDefault();
      files = evt.dataTransfer.files
    }else{
     files  = evt.target.files; // FileList object
    }
    
    document.getElementById(evt.target.dataset.outputImage).innerHTML = '';
    document.getElementById(evt.target.dataset.outputImage).style.display = 'none';
    document.getElementById(evt.target.dataset.initialImage).style.display = 'block';
    
    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }
     
      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          /*
          var span = document.createElement('span');
          span.innerHTML = ['<img class="thumb" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
          document.getElementById(evt.target.dataset.outputImage).insertBefore(span, null);
          */
          var div = document.createElement('div');
          div.className = 'thumbnail';
          div.innerHTML = ['<img src="', e.target.result,'" />'].join('');
          document.getElementById(evt.target.dataset.outputImage).insertBefore(div, null);
          document.getElementById(evt.target.dataset.outputImage).style.display = 'block';
          document.getElementById(evt.target.dataset.initialImage).style.display = 'none';
          
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
      
  }
  
    function handleDragOver(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
  }

function getJSONimages(){
var dataObj = [];

$( "#list img" ).each(function(i,o) {
  dataObj.push({
          nome: o.title,
          url: o.src
          });
});

$( "#list" ).append("<pre>"+JSON.stringify( dataObj )+"</pre>" );

}