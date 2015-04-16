<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../shared/taglib.jsp"%>

<html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
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

    <title>奔跑吧，任务！</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
   
   <%@ include file="../shared/pageHeader.jsp"%>
   
   <div class="clearfix"></div>
   <!-- BEGIN CONTAINER -->
   <div class="page-container">
      
      <%@ include file="../shared/sidebarMenu.jsp"%>
         <!--sidebar right-->
        
        <div id="wrapper-right" class="active">
              <!-- Sidebar -->
            <div id="sidebar-wrapper-right">
                <div id="right-sidebar-header">
                    <a id="menu-right" href="#"><i id="right_sidebar_icon" class="fa fa-angle-double-right fa-3x"></i></a>
            <!-- Page content -->
                </div>
                <div id="page-content-wrapper-right">
                    <!-- Keep all page content within the page-content inset div! -->
                    <ul class="nav navbar-nav side-nav right-sidebar-menu" id="right-sidebar-menu">
                    <li class="active">
                        <a href="index.html"><i class="fa fa-fw fa-th-list fa-2x" title="任务"></i> 任务</a>
                    </li>
                    <li>
                        <a href="projectFiles.html"><i class="fa fa-fw fa-file-o fa-2x" title="项目文档"></i> 项目文档</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-bar-chart-o fa-2x" title="数据表"></i> 数据表</a>
                    </li>
                    <!--
                    <li>
                        <a href="#"><i class="fa fa-fw fa-folder-open-o fa-2x" title="项目文件"></i> 项目文件</a>
                    </li>
                    -->
                    </ul>
                </div>
            <!-- /#wrapper-right -->

            </div>
        </div>
        <!--/#sidebar right-->
      <!-- BEGIN PAGE -->
      <div class="page-content">
         
         
         
         <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
              
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     ${requestScope.permissionMenu.rootName}
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>${requestScope.permissionMenu.subName}</li>
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
                            <a href="#" id="project_name" name="project_name" data-placement="right" >奔跑吧任务</a>
                            <button type="button" class="btn btn-danger" id="add_list" data-toggle="popover">新建列表</button>
                            <%@ include file="../shared/styleSet.jsp"%>
                            <div class="head hide" id="addListHiddentitle">新建列表<button class="close" id="close_list_popover">&times;</button></div>
                            
                            <div class="content hide" id="addListHiddenContent">
                            	<div class="form-group" id="list_name" >
                                <form:form id="newListForm" modelAttribute="listModel"  >
                                <form:input path="projectName" type="text" class="form-control" placeholder="输入任务列表名称"/>
                                	<button type="button" id="listSubmit" class="btn btn-primary create">创建</button>
                                    <button type="button" class="btn btn-default cancel">取消</button>
                            	</form:form>
                            	
                            	</div>
                            </div>
                            
                        </h3>
                        <!--/#page-header for project-->

                        <!--main_content-->
                        <div class="container" id="main_content">
							
                            <div class="row" id="main_content_row">
                            <c:forEach items="${listContentModel}" var="item">
                              <div class="list">
                                <div class="list_inner_layer" id="list_inner_layer1">
                                  <div class="list_header">
                                    <a href="#" data-name="列表${item.id}"  data-pk="${item.id}" data-url="projectedit/${item.id}" id="big_task_card">${ item.projectName }</a>
                                    <button type="button" class="btn btn-primary" rel="popover" data-toggle="popover" id="new_task_card1" onclick="addTaskCard(${ item.id })">新建任务卡</button>
                                  </div>
                                  <div id="task_cards${ item.id }" class="task_cards ui-sortable">
                                  </div>
                                </div>
                              </div>
                             </c:forEach>
                            </div>
							
                        </div>
                        <!--/#main_content-->
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->


    </div>
    <!-- /#wrapper -->
            
            
         </div>
         
            <%-- <label>${requestScope['javax.servlet.forward.request_uri']}</label><br/>
			<label>${pageContext.request.queryString}</label><br/>
			<label>${PageContract.DEFAULT_PAGE_SIZE}</label><br/>
			
			<label>getScheme <%=request.getScheme() %></label><br/>
			<label>getServerName <%=request.getServerName() %></label><br/>
			<label>getRequestURI <%=request.getRequestURI() %></label><br/>
			
			<label>getContextPath <%=request.getContextPath() %></label><br/>
			<label>getServletPath <%=request.getServletPath() %></label><br/>
			
			<label>getQueryString <%=request.getQueryString() %></label><br/> --%>
    
      </div>
      <!-- END PAGE -->
   </div>
   <!-- END CONTAINER -->
   <!-- BEGIN FOOTER -->
   <div class="footer">
      <div class="footer-inner">
         2013 &copy; Conquer by keenthemes.
      </div>
      <div class="footer-tools">
         <span class="go-top">
         <i class="icon-angle-up"></i>
         </span>
      </div>
   </div>
   <!-- END FOOTER -->
   
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
</body>
</html>