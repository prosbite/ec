<html lang="en" class="no-js"><!--<![endif]--><!-- BEGIN HEAD --><head>
<meta charset="utf-8">
<title>E-Class | Attendance</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/plugins/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/plugins/simple-line-icons/simple-line-icons.min.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/plugins/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/plugins/uniform/css/uniform.default.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css')}}" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="{{asset('assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/plugins/fullcalendar/fullcalendar.min.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/plugins/jqvmap/jqvmap/jqvmap.css')}}" rel="stylesheet" type="text/css">
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE STYLES -->
<link href="{{asset('assets/admin/pages/css/tasks.css')}}" rel="stylesheet" type="text/css">
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css')}}' stylesheet instead of 'components.css')}}' in the below style tag -->
<link href="{{asset('assets/global/css/components.css')}}" id="style_components" rel="stylesheet" type="text/css">
<link href="{{asset('assets/global/css/plugins.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/admin/layout2/css/layout.css')}}" rel="stylesheet" type="text/css">
<link href="{{asset('assets/admin/layout2/css/themes/grey.css')}}" rel="stylesheet" type="text/css" id="style_color">
<link href="{{asset('assets/admin/layout2/css/custom.css')}}" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<!-- <link rel="shortcut icon" href="favicon.ico"> -->
<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>
<link href="{{asset('css/app.css')}}" rel="stylesheet" type="text/css">
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
<body class="page-sidebar-closed-hide-logo page-container-bg-solid page-sidebar-closed-hide-logo page-header-fixed">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="{{route('attendance.today')}}">
			<img src="{{asset('img/eclass_logo2.png')}}" style="width:110px;height:auto;" alt="logo" class="logo-default">
			</a>
			<div class="menu-toggler sidebar-toggler">
				<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN PAGE ACTIONS -->
	
		<!-- BEGIN PAGE TOP -->
		<div class="page-top">
		
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
				
					<li class="dropdown dropdown-user">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<img alt="" class="img-circle" src="{{asset('assets/admin/layout2/img/avatar3_small.jpg')}}">
						<span class="username username-hide-on-mobile">
						{{Auth::user()->employee->employee_fname}} </span>
						<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-default">
							
							<li>
								<a href="{{ url('/logout') }}">
								<i class="icon-key"></i> Log Out </a>
							</li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div><div class="page-container" id="app">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<div class="page-sidebar navbar-collapse collapse">
				<!-- BEGIN SIDEBAR MENU -->
				<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
				<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
				<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
				<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
				<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
				<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
				<ul class="page-sidebar-menu page-sidebar-menu-hover-submenu" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
					<li class="{{navigate('attendance',$nav[0])}} start">
						<a href="javascript:;">
						<i class="icon-check" style="margin-bottom:5px;"></i>
						<span class="title">Attendance</span>
						<span class="arrow "></span>
						</a>
						<ul class="sub-menu">
							<li class="{{navigate('today',$nav[1])}}">
								<a href="{{route('attendance.today', ['sched'=>$sched_id])}}">
								Check Attendance</a>
							</li>
							<li class="{{navigate('matrix',$nav[1])}}">
								<a href="{{route('attendance.matrix', ['sched'=>$sched_id, 'month'=>isset($month)?$month:null])}}">
								Matrix</a>
							</li>
						</ul>
					</li>
					
					<li class="{{navigate('classrecord',$nav[0])}}">
						<a href="javascript:;">
						<i class="icon-book-open" style="margin-bottom:5px;"></i>
						<span class="title">Class Record</span>
						<span class="arrow "></span>
						</a>
						<ul class="sub-menu">
							<li class="{{navigate('activities',$nav[1])}}">
								<a href="{{route('activities', ['sched'=>$sched_id])}}">
								Activities</a>
							</li>
							<li>
								<a href="ecommerce_orders.html">
								Grading</a>
							</li>
						</ul>
                    </li>
                    
                    <li>
						<a href="javascript:;">
						<i class="icon-rocket" style="margin-bottom:5px;"></i>
						<span class="title">Learning Materials</span>
						<span class="arrow "></span>
						</a>
						<ul class="sub-menu">
							<li>
								<a href="ecommerce_index.html">
								My Uploads</a>
							</li>
							<li>
								<a href="ecommerce_orders.html">
								Assign Materials</a>
							</li>
						</ul>
					</li>
				</ul>
				<!-- END SIDEBAR MENU -->
			</div>
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content" style="min-height:1269px">
				<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			
				<!-- <h3 class="page-title">
				Attendance</h3> -->
				<!-- <div class="page-bar">
					<ul class="page-breadcrumb">
						<li>
							<i class="fa fa-check"></i>
							<span>Attendance</span>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">Today</a>
						</li>
					</ul>
					
				</div> -->
				<!-- END PAGE HEADER-->
			@if(1 == 1)

			@yield('content')
			
			@endif
			
            </div>
            
		</div>
		<!-- END CONTENT -->
		<!-- BEGIN QUICK SIDEBAR -->
		<!--Cooming Soon...-->
		<!-- END QUICK SIDEBAR -->
		
	</div><div class="page-footer">
		<div class="page-footer-inner">
			 {{date('Y')}} © E-Class by Engtech Global Solutions Inc.
		</div>
		
	</div><div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
<!-- BEGIN CONTAINER -->

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="{{asset('assets/global/plugins/respond.min.js')}}"></script>
<script src="{{asset('assets/global/plugins/excanvas.min.js')}}"></script> 
<![endif]-->

<script src="{{asset('assets/global/plugins/jquery.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/jquery-migrate.min.js')}}" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js')}} before bootstrap.min.js')}} to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="{{asset('assets/global/plugins/jquery-ui/jquery-ui.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/bootstrap/js/bootstrap.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/jquery.blockui.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/jquery.cokie.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/uniform/jquery.uniform.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js')}}" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="{{asset('assets/global/plugins/flot/jquery.flot.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/flot/jquery.flot.resize.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/flot/jquery.flot.categories.min.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/global/plugins/jquery.pulsate.min.js')}}" type="text/javascript"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="{{asset('assets/global/plugins/bootstrap-growl/jquery.bootstrap-growl.min.js')}}"></script>
<script src="{{asset('assets/admin/pages/scripts/ui-bootstrap-growl.js')}}"></script>
<script src="{{asset('assets/global/scripts/metronic.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/admin/layout2/scripts/layout.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/admin/layout2/scripts/demo.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/admin/pages/scripts/index.js')}}" type="text/javascript"></script>
<script src="{{asset('assets/admin/pages/scripts/tasks.js')}}" type="text/javascript"></script>


<!-- END PAGE LEVEL SCRIPTS -->

<script type="application/javascript" src="{{asset('js/app.js')}}"></script>
<script> $.noConflict(); </script>
<script>
	
jQuery(document).ready(function() {    
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
   Demo.init(); // init demo features 
   Index.init();  
   UIBootstrapGrowl.init();
});


	@if(Session::has('success'))
		$.bootstrapGrowl("{{Session::get('success')}}", {type:'success'});
	@endif
	@if(Session::has('error'))
		$.bootstrapGrowl("{{Session::get('error')}}", {type:'danger'});
	@endif
</script>

@yield('script')
<!-- END JAVASCRIPTS -->

<!-- END BODY -->
<div class="daterangepicker dropdown-menu opensleft show-calendar" style="top: 175px; right: 74.9688px; left: auto;"><div class="calendar left"><div class="calendar-date"><table class="table-condensed"><thead><tr><th></th><th class="prev available"><i class="fa fa-angle-left"></i></th><th colspan="5" class="month">November 2020</th><th></th></tr><tr><th class="week">W</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th><th>Su</th></tr></thead><tbody><tr><td class="week">44</td><td class="off disabled" data-title="r0c0">26</td><td class="off disabled" data-title="r0c1">27</td><td class="off disabled" data-title="r0c2">28</td><td class="off disabled" data-title="r0c3">29</td><td class="off disabled" data-title="r0c4">30</td><td class="off disabled" data-title="r0c5">31</td><td class="off disabled" data-title="r0c6">1</td></tr><tr><td class="week">45</td><td class="off disabled" data-title="r1c0">2</td><td class="off disabled" data-title="r1c1">3</td><td class="off disabled" data-title="r1c2">4</td><td class="off disabled" data-title="r1c3">5</td><td class="off disabled" data-title="r1c4">6</td><td class="off disabled" data-title="r1c5">7</td><td class="off disabled" data-title="r1c6">8</td></tr><tr><td class="week">46</td><td class="off disabled" data-title="r2c0">9</td><td class="off disabled" data-title="r2c1">10</td><td class="off disabled" data-title="r2c2">11</td><td class="off disabled" data-title="r2c3">12</td><td class="off disabled" data-title="r2c4">13</td><td class="off disabled" data-title="r2c5">14</td><td class="off disabled" data-title="r2c6">15</td></tr><tr><td class="week">47</td><td class="off disabled" data-title="r3c0">16</td><td class="off disabled" data-title="r3c1">17</td><td class="off disabled" data-title="r3c2">18</td><td class="off disabled" data-title="r3c3">19</td><td class="off disabled" data-title="r3c4">20</td><td class="off disabled" data-title="r3c5">21</td><td class="off disabled" data-title="r3c6">22</td></tr><tr><td class="week">48</td><td class="off disabled" data-title="r4c0">23</td><td class="off disabled" data-title="r4c1">24</td><td class="off disabled" data-title="r4c2">25</td><td class="off disabled" data-title="r4c3">26</td><td class="off disabled" data-title="r4c4">27</td><td class="off disabled" data-title="r4c5">28</td><td class="off disabled" data-title="r4c6">29</td></tr><tr><td class="week">49</td><td class="off disabled" data-title="r5c0">30</td><td class="off disabled" data-title="r5c1">1</td><td class="off disabled" data-title="r5c2">2</td><td class="off disabled" data-title="r5c3">3</td><td class="off disabled" data-title="r5c4">4</td><td class="off disabled" data-title="r5c5">5</td><td class="off disabled" data-title="r5c6">6</td></tr></tbody></table></div></div><div class="calendar right"><div class="calendar-date"><table class="table-condensed"><thead><tr><th></th><th class="prev available"><i class="fa fa-angle-left"></i></th><th colspan="5" class="month">December 2020</th><th></th></tr><tr><th class="week">W</th><th>Mo</th><th>Tu</th><th>We</th><th>Th</th><th>Fr</th><th>Sa</th><th>Su</th></tr></thead><tbody><tr><td class="week">49</td><td class="off disabled" data-title="r0c0">30</td><td class="off disabled" data-title="r0c1">1</td><td class="off disabled" data-title="r0c2">2</td><td class="off disabled" data-title="r0c3">3</td><td class="off disabled" data-title="r0c4">4</td><td class="off disabled" data-title="r0c5">5</td><td class="off disabled" data-title="r0c6">6</td></tr><tr><td class="week">50</td><td class="off disabled" data-title="r1c0">7</td><td class="off disabled" data-title="r1c1">8</td><td class="off disabled" data-title="r1c2">9</td><td class="off disabled" data-title="r1c3">10</td><td class="off disabled" data-title="r1c4">11</td><td class="off disabled" data-title="r1c5">12</td><td class="off disabled" data-title="r1c6">13</td></tr><tr><td class="week">51</td><td class="off disabled" data-title="r2c0">14</td><td class="off disabled" data-title="r2c1">15</td><td class="off disabled" data-title="r2c2">16</td><td class="off disabled" data-title="r2c3">17</td><td class="off disabled" data-title="r2c4">18</td><td class="off disabled" data-title="r2c5">19</td><td class="off disabled" data-title="r2c6">20</td></tr><tr><td class="week">52</td><td class="off disabled" data-title="r3c0">21</td><td class="off disabled" data-title="r3c1">22</td><td class="off disabled" data-title="r3c2">23</td><td class="off disabled" data-title="r3c3">24</td><td class="off disabled" data-title="r3c4">25</td><td class="off disabled" data-title="r3c5">26</td><td class="off disabled" data-title="r3c6">27</td></tr><tr><td class="week">1</td><td class="off disabled" data-title="r4c0">28</td><td class="off disabled" data-title="r4c1">29</td><td class="off disabled" data-title="r4c2">30</td><td class="off disabled" data-title="r4c3">31</td><td class="off disabled" data-title="r4c4">1</td><td class="off disabled" data-title="r4c5">2</td><td class="off disabled" data-title="r4c6">3</td></tr><tr><td class="week">2</td><td class="off disabled" data-title="r5c0">4</td><td class="off disabled" data-title="r5c1">5</td><td class="off disabled" data-title="r5c2">6</td><td class="off disabled" data-title="r5c3">7</td><td class="off disabled" data-title="r5c4">8</td><td class="off disabled" data-title="r5c5">9</td><td class="off disabled" data-title="r5c6">10</td></tr></tbody></table></div></div><div class="ranges"><ul><li class="active">Custom Range</li></ul><div class="range_inputs"><div class="daterangepicker_start_input"><label for="daterangepicker_start">From</label><input class="input-mini" type="text" name="daterangepicker_start" value=""></div><div class="daterangepicker_end_input"><label for="daterangepicker_end">To</label><input class="input-mini" type="text" name="daterangepicker_end" value=""></div><button class="applyBtn btn btn-sm blue">Apply</button>&nbsp;<button class="cancelBtn btn btn-sm default">Cancel</button></div></div></div><div class="jqvmap-label"></div><div class="jqvmap-label"></div><div class="jqvmap-label"></div><div class="jqvmap-label"></div><div class="jqvmap-label"></div></body></html>
