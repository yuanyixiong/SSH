<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#selectIconPanel a.icon-item{
	margin:5px;
	font-size:30px;
	cursor:pointer
}
</style>
<script type="text/javascript">
	$(function() {
		$('a.icon-item','#selectIconPanel').click(function(e){
			$('#menuIconForm .close').click();
			var iconName = $(this).children('i:first').attr('class');
			// 如果是确定选择操作
			if(typeof doConfirmSelectIcon == 'function'){
				// 选择图标后的操作
				doConfirmSelectIcon(iconName);
			}else{
			}
		});
	});
</script>
<div class="modal-header" >
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
		<h4 class="modal-title">选择图标</h4>
	</div>
<div id="selectIconPanel" class="modal-body" style="height: 300px;">
	<div class="col-md-12">
			<a  class="icon-item"><i class="fa fa-cart"></i></a>
			<a  class="icon-item"><i class="fa fa-laptop"></i></a>
			<a  class="icon-item"><i class="fa fa-spinner"></i></a>
			<a  class="icon-item"><i class="fa fa-fighter-jet"></i></a>
			<a  class="icon-item"><i class="fa fa-plus-sign-alt"></i></a>
			<a  class="icon-item"><i class="fa fa-medkit"></i></a>
			<a  class="icon-item"><i class="fa fa-hospital"></i></a>
			<a  class="icon-item"><i class="fa fa-hospital"></i></a>
			<a  class="icon-item"><i class="fa fa-building"></i></a>
			<a  class="icon-item"><i class="fa fa-laptop"></i></a>
			<a  class="icon-item"><i class="fa fa-file-text-alt"></i></a>
			<a  class="icon-item"><i class="fa fa-food"></i></a>
			<a  class="icon-item"><i class="fa fa-coffee"></i></a>
			<a  class="icon-item"><i class="fa fa-random"></i></a>
			<a  class="icon-item"><i class="fa fa-photo"></i></a>
			<a  class="icon-item"><i class="fa fa-star-half-full"></i></a>
			<a  class="icon-item"><i class="fa fa-windows"></i></a>
			<a  class="icon-item"><i class="fa fa-video-camera"></i></a>
			<a  class="icon-item"><i class="fa fa-trophy"></i></a>
			<a  class="icon-item"><i class="fa fa-cogs"></i></a>
			<a  class="icon-item"><i class="fa fa-cube"></i></a>
			<a  class="icon-item"><i class="fa fa-cut"></i></a>
			<a  class="icon-item"><i class="fa fa-cloud-download"></i></a>
			<a  class="icon-item"><i class="fa fa-comment"></i></a>
			<a  class="icon-item"><i class="fa fa-dashboard"></i></a>
			<a  class="icon-item"><i class="fa fa-line-chart"></i></a>
			<a  class="icon-item"><i class="fa fa-fire"></i></a>
			<a  class="icon-item"><i class="fa fa-moon-o"></i></a>
			<a  class="icon-item"><i class="fa fa-paw"></i></a>
			<a  class="icon-item"><i class="fa fa-eye"></i></a>
			<a  class="icon-item"><i class="fa fa-key"></i></a>
			<a  class="icon-item"><i class="fa fa-flask"></i></a>
			<a  class="icon-item"><i class="fa fa-user"></i></a>
	</div>
</div>