$(document).ready(function() {
    $('#identicalForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            }
        }
    });
    $("#create-form #brand,#create-form #extension,#create-form #language").change(function() {
      var brands = $("#brand").val().split(',');
      var brand_id = brands[0];
      var brand_code = brands[1];
      var brand_prefix = brands[2]; 
      var brand_number = brands[3];
      var brand = brand_prefix + brand_number; 
      var brand_name = $("#brand option:selected").text();
      var extension = $("#extension").val();              
      var language = $("#language").val();
      var item_number = brand + extension + language;   
      console.log(brand_name);            
      $("#code").val(item_number);
      $("#ncode").val(brand);
      $("#brand_code").val(brand_code);
      $("#brand_prefix").val(brand_prefix);
      $("#brand_name").val(brand_name);

      $("#brand_id").val(brand_id);
      $("#new_number").val(parseInt(brand_number) + 1);
    });

    $("#copy-form #extension,#copy-form #language").change(function() {      
      var ncode = $("#ncode").val();
      var extension = $("#extension").val();              
      var language = $("#language").val();
      var item_number = ncode + extension + language;   
      console.log(item_number);            
      $("#code").val(item_number);       
    });    

    if($("#item-table").length){
      setInterval(function(){
        if($('#page-number').length == 0){
          $("ul.pagination").prepend('<li><input type="text" id="page-number" /><button id="page-number-bt" class="btn btn-primary">Go</button><li>');
          $("#page-number-bt").click(function(){  
            var newPage = $('#page-number').val();  
            var lastPage = $('.page-last a').text();  
            if (/^\d+$/.test(newPage)) {
              $(".page-number:not('.active'):first a").text(newPage).click(); 
            }        
                    
          });
        }
        
      }, 500);
    }           
});
function queryParams() {
    return {
        type: 'owner',
        sort: 'updated',
        direction: 'desc',
        per_page: 100,
        page: 1
    };
}    
