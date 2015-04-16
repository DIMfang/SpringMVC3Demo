<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ include file="../shared/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   
   <%@ include file="../shared/importCss.jsp"%>
   <!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
   <link href="<c:url value='/plugins/fullcalendar/fullcalendar/fullcalendar.css'/>" rel="stylesheet" type="text/css"/>
   <!-- END PAGE LEVEL PLUGIN STYLES -->
   
   <link rel="shortcut icon" href="favicon.ico" />
   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Boards</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="<c:url value='/css/index.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/default.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/modal_alert.css'/>" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/modal_new_project.css'/>" rel="stylesheet" type="text/css">
<!--date picker-->
	<link href="<c:url value='/css/bootstrap-datetimepicker.min.css'/>" rel="stylesheet" media="screen">
	
	<!--slider-->
	<link rel="stylesheet" href="<c:url value='/css/jquery.nouislider.min.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/jquery.nouislider.pips.min.css'/>">
	
  </head>
  
  <body class="page-header-fixed">
<%@ include file="../shared/pageHeader.jsp"%>
   
   <div class="clearfix"></div>
   <!-- BEGIN CONTAINER -->

   <div class="page-container">
      
      <%@ include file="../shared/sidebarMenu.jsp"%>

        <div class="page-content">
       
         <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
              
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     Systems 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>Boards</li>
                  <li class="pull-right">
                     <div id="dashboard-report-range" class="dashboard-date-range tooltips" data-placement="top" data-original-title="Change dashboard date range">
                        <i class="icon-calendar"></i>
                        <span></span>
                        <i class="icon-angle-down"></i>
                     </div>
                  </li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
      <div id="page-wrapper">

         <div class="container-fluid">

                <!-- Page Heading -->
                  <div class="mid-content col-lg-10 col-lg-offset-2 col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 col-xs-12">
                 
              <form action="" class="form-horizontal"  role="form">
              <div class="panel panel-default">
                  <div class="panel-body" id="newProject">
                    <div class="box row">
                    	<div class="font-16 font-green col-xs-12 no-padding">项目名称</div>
                        <div class="col-sm-9 col-xs-12 no-padding">
                        		<input type="text" class="input-title form-control"
                        		placeholder="+请添加项目名称" maxlength="20" required autofocus />
                        </div>
                        <div class="col-sm-3 hidden-xs font-12 font-green margin-top-20">
                        		<span class="glyphicon glyphicon-list-alt"></span>
                        		<input type="checkbox" value="1" name="boardType[1]"> 公开项目
                        		<input type="checkbox" value="2" name="boardType[1]"> 学校项目
                        		<input type="checkbox" value="3" name="boardType[1]"> 私人项目
                        </div>
                    </div>
                    <div class="box row">
                    	<div><br /></div>
                    	<div class="font-16 font-green">项目描述</div>
                        
                    	<textarea maxlength="1000" id="project-description" class="form-control" placeholder="＋请添加项目简介" rows="1" onpropertychange= "this.style.Height=this.scrollHeight "></textarea>
                    </div>
                    <div class="box row">
                        <div class="box-dashed">
                             
                             <div class="row">
                                	<div class="font-14 font-666 col-sm-2 col-xs-3 ">活动时间</div>
                                <!--datepicker-->
                                	<div class="col-lg-3 col-md-4 col-xs-7 form_mid_input input-group date form_datetime"  data-date-format="yyyy-mm-dd hh:ii">
                                 	<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                		<input class="form-control" size="16" value="2015-01-07 03:30" type="text" value="" readonly>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                	</div>
                                <!--datepicker-->
                                	<div class="col-xs-12">&nbsp;</div>
                             	<div class="font-14 font-666 col-sm-2 col-xs-3 ">预演时间</div>
                             	
                                <!--datepicker-->
                                	<div class="col-lg-3 col-md-4 col-xs-7 form_mid_input input-group date form_datetime"  data-date-format="dd MM yyyy - HH:ii p" >
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                        <input class="form-control" size="16" type="text" value="" readonly>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                	</div>
                                <!--datepicker-->
                               
                                	<div class="col-xs-12">&nbsp;</div>
                                	<!--<div class="col-xs-12 font-999 font-14" id="add-event-date">添加预演时间</div>
                             	<div class="col-xs-12">&nbsp;</div>-->
                             </div>
                             
                        </div>
                        <div class="box-none">
                        		<div class="row">
                                	<div class="col-xs-12">&nbsp;</div>
                                	<div class="font-14 font-666 col-sm-2 col-xs-3 ">活动人数</div>
                             	<div class="form_mid_input input-group col-lg-3 col-md-4 col-xs-7">
                                      <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                      <input class="form-control" id="range-people-input" size="10" value="1" type="text">
                                	</div>
                                	<div class="col-xs-12">&nbsp;</div>
                                	<div class="div-slider col-xs-10 col-xs-offset-1" id="range-people"></div>
                                	<div class="col-xs-12">&nbsp;</div>
                             	<div class="font-14 font-666 col-sm-2 col-xs-3 ">预算规模</div>
                             	<div class="form_mid_input input-group col-lg-3 col-md-4 col-xs-7" >
                                      <span class="input-group-addon"><span class="glyphicon glyphicon-usd"></span></span>
                                      <input class="form-control" id="range-fonds-input" size="10" value="0.00" type="text">
                                </div>
                                <div class="col-xs-12">&nbsp;</div>
                                	<div class="div-slider col-xs-10 col-xs-offset-1" id="range-fonds"></div>
                                	<div class="col-xs-12">&nbsp;</div>
                             </div>
                             
                         </div>
                   	</div>
                    	<div><br /></div>
                    	<div class="box">
                        	<div class="font-16 font-green">项目备注</div>
                         <textarea maxlength="10000" id="project-remarks" class="form-control" placeholder="＋请添加项目备注" rows="3" onpropertychange= "this.style.Height=this.scrollHeight "></textarea>
                     	</div>
                       
                     	<div class="box-none">
                        <button class="half-button" type="submit">提&nbsp;&nbsp;交</button><button class="half-button" type="reset">取&nbsp;&nbsp;消</button>
                     	</div>
                     
                      
                     
                     	<div class="box-none">&nbsp;</div> 
                     	<div class="box-none">&nbsp;</div> 
                 </div>
                 <!--end panel panel-default end-->
                 </form>
            
              	</div>
				<!--end middle panel- end-->
               
                <!-- /.row -->
                        <!--/#main_content-->
                    </div>
                </div>
                <!-- /.row -->
              </div>
            </div>
            </div>
            <!-- /.container-fluid -->
             </div>
        <!-- /#page-wrapper -->
   </div>
   <!-- /#page-container -->
  </body>
     
   <%@ include file="../shared/importJs.jsp"%>
   <script type="text/javascript">
	</script> 
   
   <!-- BEGIN PAGE LEVEL PLUGINS -->
   
  
   <!-- END PAGE LEVEL SCRIPTS -->
  
	<script src="<c:url value='/js/tool-tips.js'/>"></script>
	<script src="<c:url value='/js/nav-collapse.js'/>"></script>
	<script src="<c:url value='/js/textarea.js'/>"></script>
	
	<!--date picker-->
   <script type="text/javascript" src="<c:url value='/js/bootstrap-datetimepicker.min.js'/>" charset="UTF-8"></script>
   <script src="<c:url value='/js/jquery.nouislider.all.min.js'/>" type="text/javascript"></script>
   <script src="<c:url value='/js/datepicker.js'/>" type="text/javascript"></script>
   <script src="<c:url value='/js/slides.js'/>" type="text/javascript"></script>
   <script src="<c:url value='/plugins/gritter/js/jquery.gritter.js'/>" type="text/javascript"></script>
   <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
   <script src="<c:url value='/plugins/fullcalendar/fullcalendar/fullcalendar.min.js'/>" type="text/javascript"></script>
   <script src="<c:url value='/plugins/jquery.sparkline.min.js'/>" type="text/javascript"></script>  
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script src="<c:url value='/js/app.js'/>" type="text/javascript"></script>
   <script src="<c:url value='/js/index.js'/>" type="text/javascript"></script>  
   <script type="text/javascript">
      jQuery(document).ready(function() {    
         App.init(); // initlayout and core plugins
         Index.init();
         Index.initCalendar(); // init index page's custom scripts
         Index.initPeityElements();
         Index.initKnowElements();
         Index.initDashboardDaterange();
      });
   </script>
      <!--sidebar right-->
    <script type="text/javascript">
    $("#menu-right").click(function(e) {
        e.preventDefault();
        $("#wrapper-right").toggleClass("active");
    });
    
    $("#right-sidebar-header a").click(function() {
        $(this).find('i').toggleClass('fa fa-angle-double-right fa-3x fa fa-angle-double-left fa-3x');
    });
    
    $("#menu-right").click(function() {
        $("#right-sidebar-menu li").find('i').toggleClass('fa-1x fa-3x');
    });
    </script>
    <script type="text/javascript">
	$("input:checkbox").click(function() {

    if ($(this).is(":checked")) {
        var group = "input:checkbox[name='" + $(this).attr("name") + "']";
        $(group).prop("disabled", true);
        $(this).prop("disabled",false)
    } else {
    	var group = "input:checkbox[name='" + $(this).attr("name") + "']";
        $(group).prop("disabled", false);
    }
	});
	</script>
   <!-- END JAVASCRIPTS -->
</html>
