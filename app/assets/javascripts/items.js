$(document).ready(function(){
  var $items = $('.item');

  $('#item_filter_all').on('keyup', function(){
    var currentData = this.value;

    $items.each(function (index, item) {
      $item = $(item);
      if ( $item.data('all').toLowerCase().indexOf(currentData.toLowerCase()) !== -1 ) {
        $item.show();
      } else {
        $item.hide();
      }
    });
  });


});
