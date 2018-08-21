// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//
//= require jquery
//= require turbolinks
//= require bootstrap-sprockets
//= require activestorage
//= require_tree .



/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb



import 'bootstrap';

function order_by_occurrence(arr) {
  var counts = {};
  arr.forEach(function(value){
      if(!counts[value]) {
          counts[value] = 0;
      }
      counts[value]++;
  });

  return Object.keys(counts).sort(function(curKey,nextKey) {
      return counts[curKey] < counts[nextKey];
  });
}

function load_quagga(){
  if ($('#barcode-scanner').length > 0 && navigator.mediaDevices && typeof navigator.mediaDevices.getUserMedia === 'function') {

    var last_result = [];
    if (Quagga.initialized == undefined) {
      // registers a callback function which is triggered whenever a barcode pattern has been located and decoded successfully
      // the data object contins info about the decoding process including the detected code.
      // which is obtained by calling data.codeResult.code
      Quagga.onDetected(function(result) {
        var last_code = result.codeResult.code;
        last_result.push(last_code);
        if (last_result.length > 20) {
          code = order_by_occurrence(last_result)[0];
          last_result = [];
          // if the decoder is running after calling stop the decoder does not process any more images.
          // if the camerstream was requested on initialization this disconnects the camera.
          Quagga.stop();
          $.ajax({
            type: "POST",
            url: '/scans/new',
            data: { upc: code }
          });
        }
      });
    }

    // This method initialises the library fro our given config
    // It invokes the function err when Quagga has finsihed its bootstrapping phase
    // I t also requests camera access if real-time detection is is configured
    // Note: if the inputSteam.type is set to LiveStream bu tthe browser doesn't support
    // the API this wuld cause an exception to be thrown. Likewise
    // the user denying access to the camera.
    Quagga.init({
      // defines sources of images within QuaggaJS
      inputStream : {
        name : "Live",
        type : "LiveStream",
        numOfWorkers: navigator.hardwareConcurrency,
        // target can be a string e.g. a css selector matching a DOM node or a DOM node

        target: document.querySelector('#barcode-scanner')
      },
      decoder: {
          readers : ['ean_reader','ean_8_reader','code_39_reader','code_39_vin_reader','codabar_reader','upc_reader','upc_e_reader']
      }
    },function(err) {
        if (err) { console.log(err); return }
        Quagga.initialized = true;
        // The start method starts the video stream and begins locating and deconding images.
        Quagga.start();
    });

  }
};
$(document).on('turbolinks:load', load_quagga);
