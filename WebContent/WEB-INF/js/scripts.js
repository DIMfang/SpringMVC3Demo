
var listNum = 0;
/*创建新的列表*/
function addList(listAjaxName){
  listNum++;
  var newDiv = document.createElement('div');
  //var listName = $('#list_name').find('input[id="listName"]').val();
  var listContent="";
  listContent =  "<div class='list_inner_layer' id='list_inner_layer" + listNum + "'>";
  listContent += "<div class='list_header'>";
  listContent += "<a href='#' data-name='field" + listNum + "'  data-type='text' id='big_task_card'>" + listAjaxName + "</a>";
  listContent += "<button type='button' class='btn btn-primary' rel='popover' data-toggle='popover' id='new_task_card" + listNum + "' onclick='addTaskCard(" + listNum + ")'>新建任务卡</button>";
  listContent += "</div><div id='task_cards" + listNum + "' class='task_cards'></div></div>";
  newDiv.innerHTML = listContent;
  newDiv.setAttribute("class", "list");
  $("#main_content_row").append(newDiv);      
  sortableInitialize();
  cardSortableInitialize();
};


/*创建新的列表出现的弹出框*/
var addListPopOverSettings = {
  html: true,
  content: function() {
        return $('#addListHiddenContent').html();
      },
  title: function() {
        return $('#addListHiddentitle').html();
      }
};

$('#add_list').popover(addListPopOverSettings).on('shown.bs.popover', function () {
  var $popup = $(this);
  $(this).next('.popover').find('button.cancel').click(function (e) {
      $popup.popover('hide');
  });
  $(this).next('.popover').find('button.close').click(function (e) {
      $popup.popover('hide');
  });
  $(this).next('.popover').find('button.create').click(function (e) {
	  document.getElementById("newListForm").submit();
//	  var postdata = '{"projectName":"' + $('#projectName').val() + '"}';   
//
//	  //alert(postdata);
//	 // alert(json);
//	$.ajax({   
//		type : 'POST',  
//        contentType : 'application/json',  
//        url : 'projectCreate',  
//        processData : false,  
//        dataType : 'json',  
//        data : postdata,  
//        success : function(data) {  
//            alert(data.id); 
//            addList(data.projectName);
//     },  
//     error : function() {  
//    	 alert('err');
//    	
//     }  
//	});
      $popup.popover('hide');
  });
});

/*列表popover点击别处hide*/
$('body').on('click', function (e) {
  $('[data-toggle="popover"]').each(function () {
      //the 'is' for buttons that trigger popups
      //the 'has' for icons within a button that triggers a popup
      if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
          $(this).popover('hide');
      };
      var $popup = $(this);
          $(this).next('.popover').find('button.cancel').click(function (e) {
              $popup.popover('hide');
          });
          $(this).next('.popover').find('button.close').click(function (e) {
              $popup.popover('hide');
          });
          $(this).next('.popover').find('button.create').click(function (e) {
              $popup.popover('hide');
          });

  });
});


/*新建list div的sortable初始化*/
function sortableInitialize (){

  $( "#main_content_row" ).sortable({
    
    connectWith: ".list",
    handle: ".list_header",
    cancel: ".task_cards",
    placeholder: "list_placeholder",
    start: function (event, ui) {
      ui.item.addClass('tilt');
      // 检测tilt的方向
      tilt_direction(ui.item);
      ui.placeholder.width(ui.item.width());
      ui.placeholder.height(ui.item.height());
    },
    stop: function (event, ui) {
      ui.item.removeClass("tilt");
      // 解开临时处理程序和多余的数据
      $("html").unbind('mousemove', ui.item.data("move_handler"));
      ui.item.removeData("move_handler");
    }/*,
    
    update: function (data) {
    var sortData = $(this).sortable("serialize");
    $.post(sortListsUrl, sortData, function (resortedLists) {
    board.get("lists").reset(resortedLists);
    });
    }*/
  });
};
/*新建task div的sortable初始化*/
function cardSortableInitialize (){
      
  $(".task_cards").sortable({

    connectWith: ".task_cards",
    item:"task_card",
    placeholder: "card_placeholder",
    start: function (event, ui) {
      ui.item.addClass('tilt');
      // 检测tilt的方向
      tilt_direction(ui.item);
      ui.placeholder.width(ui.item.width());
      ui.placeholder.height(ui.item.height());
    },
    stop: function (event, ui) {
      ui.item.removeClass("tilt");
      // 解开临时处理程序和多余的数据
      $("html").unbind('mousemove', ui.item.data("move_handler"));
      ui.item.removeData("move_handler");
    }/*,
     receive: function(event, ui) {  
      var sortCardPopover = { 
        html : true,
        placement: 'bottom',
        title : function() {
          return $("#addCardHiddentitle").html();
          },
        content: function() {
          return $("#addCardHiddenContent").html();
          }
      };
       $(this).data().sortable.currentItem.popover(sortCardPopover).on('shown.bs.popover', function () {
        var $popup = $(this);
        $(this).next('.popover').find('button.cancel').click(function (e) {
            $popup.popover('hide');
        });
        $(this).next('.popover').find('button.close').click(function (e) {
            $popup.popover('hide');
        });
        $(this).next('.popover').find('button.create').click(function (e) {
            $popup.popover('hide');
        });
    });
    }/*,
    update: function (event, ui) {
    var sortData = $(this).sortable("serialize");

    if (sortData) {
      // add list_id to sortData
      var listId = parseInt($(this).data("listId"));
      sortData += '&list_id=' + listId;

      // console.log("listId:")
      // console.log(listId);

      $.post(sortCardsUrl, sortData, function (resortedCards) {
        var cards = list.get("cards");
        cards.reset(resortedCards.cards);

        // console.log("cards post-sort");
        // console.log(cards);
      });
    };
  }*/
  });
      
};
/*创建新的任务卡*/
var cardNum = 0;
function addTaskCard(taskCardNum){
  cardNum++;
  var newCard = document.createElement('div');
  var str1 ="<div class='task_card' id='task_card'><a href='#' data-name='field" + cardNum + "' data-type='text' id='task_name'>任务" + cardNum + "</a></div>";
  newCard.innerHTML = str1;
  $("#task_cards" + taskCardNum).append(newCard);
  bootbox.alert("你已经创建了任务" + cardNum + " , 点击任务名称能更改任务名称，如果你有多个任务，可以拖动任务卡进行拖拽（有点温馨点的提示：“一定要将重要任务放首位噢!” 还有下面的任务卡也能拖进你的列表里~ ");
};

// 监控倾斜方向和相应的类之间的切换*/
function tilt_direction(item) {
  var left_pos = item.position().left,
      move_handler = function (e) {
          if (e.pageX >= left_pos) {
              item.addClass("right");
              item.removeClass("left");
          } else {
              item.addClass("left");
              item.removeClass("right");
          }
          left_pos = e.pageX;
      };
  $("html").bind("mousemove", move_handler);
  item.data("move_handler", move_handler);
} 

function delItem(i) {  
$("#div" + i).remove();  
};

$(document).ready(function() {
	  sortableInitialize();
	  cardSortableInitialize();
  /*创建项目或者活动 模块儿*/
  $('#list_create_project').click(function(project){
    $("#project_create").show();
      $("#main_create").hide();
      project.stopPropagation();

  });

  $('#list_create_group').click(function(group){
    $("#group_create").show();
      $("#main_create").hide();
      group.stopPropagation();

    });

    $('.close').click(function(close){
    $("#main_create").hide();
    $("#project_create").hide();
    $("#group_create").hide();
      close.stopPropagation();

  });

  $('#create_new').click(function(main){
      if($("#project_create").is(":visible")){

        $("#project_create").hide();
      }
      else if($("#group_create").is(":visible")){
          $("#group_create").hide();
      }
      else if($("#main_create").is(":visible")){
          $("#main_create").hide();
      }
      else{
      $("#main_create").show();
      
      }
      main.stopPropagation();

  });    
});



$(document).ready(function() {
    //toggle `popup` / `inline` mode
    $.fn.editable.defaults.mode = 'inline';     
    
    //make 大项目名字 editable
    $('#project_name').editable({
    type: 'text',
  
    //url: '/post',
    title: '输入项目名：'
    });
    //小任务名字
    $('#main_content_row').editable({
      selector: '#task_name',
      position: 'top',
     // url: '/post',
    
    });  
    //大任务名字
    $('#main_content_row').editable({
    	validate: function(value) {
            if($.trim(value) == '') return '列表名不能为空';
        },
      selector: '#big_task_card',
      position: 'top',
      ajaxOptions: {contentType: 'application/json', dataType: 'json' },
      params: function(params) {
    	  var data = {};
    	  data['projectName'] = params.value;
    	  data['id'] = params.pk;
    	  return JSON.stringify(data); 
    	  },
      
   
    });  
});

/* Drag and drop definition*/
$( function() {
  // handles drag
  $('#sidebar .question-constructor').draggable({
    connectToSortable:'.task_cards',
    scroll: false,
    helper : 'clone',
    cursorAt: { top: 56, left: 200 },
    start: function( event, ui ) {
      $(ui.helper).addClass('on-drag');
      
    }
  });
});