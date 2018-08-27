 import Quagga from 'quagga';
// const Quagga = require('quagga').default;

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
    if (Quagga.initialized == undefined || !Quagga.initialized) {
      // registers a callback function which is triggered whenever a barcode pattern has been located and decoded successfully
      // the data object contins info about the decoding process including the detected code.
      // which is obtained by calling data.codeResult.code
      Quagga.onDetected(function(result) {
        var last_code = result.codeResult.code;
        var code;
        last_result.push(last_code);
        if (last_result.length > 5) {
          code = order_by_occurrence(last_result)[0];
          console.log("Got code", code)
          console.log("Results", last_result)
          console.log("Last result", result.codeResult)
          last_result = [];
          // if the decoder is running after calling stop the decoder does not process any more images.
          // if the camerstream was requested on initialization this disconnects the camera.

          // this is to prevent problem with authenticity token
          //like when gmail and facebook prevent scripting,
          //they only allow if in the header you have the csrf token
          //the csrf is generated in the site itself - so it can't be faked
          Quagga.stop();
          Quagga.initialized = false;
          $.ajaxSetup({
            headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
          });

          //const token = $('meta[name="csrf-token"]').attr('content');
          $.ajax({
            type: "POST",
            //beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', token)},
            url: '/scans/get_product',
            data: { upc: code }
          });
        }
      });

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
            readers : ['ean_reader','upc_reader']
        }
      },function(err) {
          if (err) { console.log(err); return }
          Quagga.initialized = true;
          // The start method starts the video stream and begins locating and deconding images.
          Quagga.start();
      });
    }
  }
};
// $(document).on('turbolinks:load', load_quagga);


// print
$(document).on('turbolinks:load', load_quagga);
