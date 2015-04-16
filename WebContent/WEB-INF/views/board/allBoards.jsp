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
                <div class="row">
                    <div class="col-lg-12">

                        <!--page-header for project-->
                        <h3 class="page-header">
                            <i class="fa fa-tachometer fa-1x"></i> All Boards
                        </h3>
                        <!--/#page-header for project-->

                        <!--main_content-->

                    <div class="row">
                        <h4 class="page-header">
                            <i class="fa fa-graduation-cap fa-1x"> 学校及所在单位项目</i>
                        </h4>
                        <c:forEach items="${ listBoardModel }" var="item">
                        <div class="col-lg-2 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-th-large fa-3x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">${ item.projectNumber }</div>
                                            <div>个项目!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="index.html">
                                    <div class="panel-footer">
                                        <span class="pull-left">${ item.boardName }</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    
                    <div class="row">
                        <h4 class="page-header">
                            <i class="fa fa-coffee fa-1x">学校及个人单位</i>
                        </h4>
                        <div class="col-lg-2 col-md-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-th-large fa-3x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">5</div>
                                            <div>个项目！</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">学校及个人单位</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row">
                        <h4 class="page-header">
                            <i class="fa fa-leaf fa-1x">私人项目</i>
                        </h4>
                        <div class="col-lg-2 col-md-6">
                            <div class="panel panel-red">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-th-large fa-3x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">3</div>
                                            <div>个任务！</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="#">
                                    <div class="panel-footer">
                                        <span class="pull-left">私人项目</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        
                    </div>
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
   <script src="<c:url value='/plugins/gritter/js/jquery.gritter.js'/>" type="text/javascript"></script>
   <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
   <script src="<c:url value='/plugins/fullcalendar/fullcalendar/fullcalendar.min.js'/>" type="text/javascript"></script>
   <script src="<c:url value='/plugins/jquery.sparkline.min.js'/>" type="text/javascript"></script>  
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script src="<c:url value='/js/app.js'/>" type="text/javascript"></script>
   <script src="<c:url value='/js/index.js'/>" type="text/javascript"></script>  
   <!-- END PAGE LEVEL SCRIPTS -->
  
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

   <!-- END JAVASCRIPTS -->
</html>
