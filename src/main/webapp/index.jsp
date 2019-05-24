<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<%@ include file="./commonTag.jsp"%>

<script type="text/javascript" src="${ctx}/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${ctx}/js/layui/layui.all.js"></script>
<link href="${ctx}/js/layui/css/layui.css" rel="stylesheet">
</head>
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>

<!-- 头部工具栏 -->
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-sm" lay-event="addUser">增加</button> 
  </div>
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>

<!-- 编辑弹窗表单 -->
<div id="editUser1" style = "background : rgb(240,242,245); display : none;">
<br/>
	<form class="layui-form " id="editUserForm">
		<!-- <div class="layui-form" lay-filter="userInfo" id="userInfo"> -->
		    <div class="layui-form-item">
		      <label class="layui-form-label">用 &nbsp;户&nbsp;名</label>
		      <div class="layui-input-inline">
		        <input type="text" name="username" lay-verify="required" id="_inname" placeholder="请输入用户名" autocomplete="off" class="layui-input">
		      </div>
		    </div>
			<div class="layui-form-item">
		      <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
		      <div class="layui-input-inline">
		        <input type="password" name="password" lay-verify="required" id="_inpass" placeholder="请输入密码" autocomplete="off" class="layui-input">
		      </div>
		    </div>
	   <!--  </div> -->
	</form>
</div>

<!-- 表格 -->
<script>
layui.use(['form', 'laypage', 'layer', 'table','laydate','upload'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,table = layui.table //表格
	  ,laypage = layui.laypage
	  ,upload = layui.upload
	  laydate = layui.laydate;
	  table.render({
			//指定原始表格元素选择器（推荐id选择器）
			elem : '#test',
			//加入头部工具,
			toolbar : '#toolbarDemo',
			url : BASE_PATH + '/queryPage.do',
			method : 'post',
			async : false,
			contentType : 'application/json',
			page : {
				layout : ['limit', 'count', 'prev', 'page', 'next', 'skip']
			//,curr: 5 
			},
			cols : [[//设置表头
			{
				checkbox : true,fixed : true}
			, {field : 'id',width : 80,title : 'ID',sort : true}
			, {field : 'userName',width : 150,title : '用户名'}
			, {field : 'passWord',width : 150,title : '密码'}
			, {fixed : 'right',title : '操作',toolbar : '#barDemo'/* , width:150 */}
			]],
			request : {//参数对应的属性
				pageName : 'pageNow', //页码的参数名称，默认：page
				limitName : 'size' //每页数据量的参数名，默认：limit
			},
			response : {//返回值对应属性
				 statusName : 'code' //数据状态的字段名称，默认：code
				,statusCode : "01" //成功的状态码，默认：0
				,msgName : 'msg' //状态信息的字段名称，默认：msg
				,countName : 'total' //数据总数的字段名称，默认：count
				,dataName : 'resp' //数据列表的字段名称，默认：data
			}
		})

		//头工具栏事件
		table.on('toolbar(test)', function(obj) {
			var checkStatus = table.checkStatus(obj.config.id);
			switch (obj.event) {
				case 'getCheckData' :
					var data = checkStatus.data;
					//获取data的json字符串
					if(data == ''){
						layer.alert("无");
					}else{layer.alert(JSON.stringify(data));}
					
					/* layer.alert(JSON.stringify(data)); */
					//转换为
					break;
				case 'getCheckLength' :
					var data = checkStatus.data;
					layer.msg('选中了：' + data.length + ' 个');
					break;
				case 'isAll' :
					layer.msg(checkStatus.isAll ? '全选' : '未全选');
					break;
				//增加用户
				case 'addUser':
					var data = obj.data;
					//iframe窗
					layer.open({
						 type:1
						,title:'新增用户'
						,maxmin:false	//maxmin - 最大最小化(Boolean)默认：false 
						,offset: '100px'	//offset - 坐标(String/Array)默认：垂直水平居中 
				        ,area : [ '400px', '250px' ]	//area - 宽高(String/Array)默认：’auto’
				        ,content : $("#editUser1")	//content - 内容(String/DOM/Array)默认：”，括号中是iframe的url 或 (“#id”).html()这样取出的是html元素。)
				        ,btn:['保存','取消']
						//向后台传递数据
						,yes:function(index,layero){
							debugger
							var params = {};
							//获取输入框内容
							var inname = $("#_inname").val();
							var inpass = $("#_inpass").val();
							//封装为param对象
							params.userName = inname;
							params.passWord = inpass;
							var jsonStr = JSON.stringify(params)//转成json字符串对象
							$.ajax({
								url : BASE_PATH + 'insert.do',
								type : 'post',
								dataType : 'json',
								contentType : "application/json",
								data : jsonStr,//格式化为 JSON 数据
								async: false,
								success : function(value) {
									layer.close(index);
									layer.msg("新增成功！");
									$("#editUser1").hide();
								},
								error : function() {
									layer.msg("新增失败");
									obj.insert();
									layer.close(index);
								}
							});
						},
						//对表单进行提交
						btn2:function(index,layor){
							layer.close(index);
							$("#editUser1").hide();
							//清除表单内容
							$('#editUserForm')[0].reset();
							layui.form.render();
						}
						,end:function(){
							$("#editUser1").hide();
							$('#editUserForm')[0].reset();
							layui.form.render();
						}
						,success:function(index){
							
						}
					});
					
			};
		});

		//监听行工具事件
		table.on('tool(test)', function(obj) {
			var data = obj.data;
			if (obj.event === 'del') {
				debugger
				layer.confirm('真的删除行么', function(index) {
					$.ajax({
						url : BASE_PATH + 'delete.do?id=' + data.id,
						type : 'get',
						dataType : "json",
						contentType : "application/json",
						success : function(data) {
							console.log(data);
							//显示提示框删除刷新页面
							obj.del();
							layer.close(index);
							layer.msg("删除成功！");
						},
						error : function(data) {
							layer.msg("删除失败！");
						}
					});
				
				});
			} else if (obj.event === 'edit') {
				//修改的数据作为一个对象元素
 				/* var params = {
					"id" : data.id,
					"userName" : data.userName,
					"passWord" : data.passWord
				};  */
				var data = obj.data;
				//iframe窗
				layer.open({
					 type:1
					,title:'编辑用户'
					,maxmin:false	//maxmin - 最大最小化(Boolean)默认：false 
					,offset: '100px'	//offset - 坐标(String/Array)默认：垂直水平居中 
					,area : [ '400px', '250px' ]	//area - 宽高(String/Array)默认：’auto’
					,content : $("#editUser1")	//content - 内容(String/DOM/Array)默认：”，括号中是iframe的url 或 (“#id”).html()这样取出的是html元素。)
					,btn:['保存','取消']
					//向后台传递数据
					,yes:function(index,layero){
						var params = {};
						var inname = $("#_inname").val();
						var inpass = $("#_inpass").val();
						params.id = data.id;
						params.userName = inname;
						params.passWord = inpass;
						var jsonStr = JSON.stringify(params)//转成json字符串对象
						$.ajax({
							url : BASE_PATH + 'update.do',
							type : 'post',
							dataType : 'json',
							contentType : "application/json",
							data : jsonStr,//格式化为 JSON 数据
							async:false,
							success : function(value) {
								if(01 == data.code){
									//清除表单内容
									layer.msg('修改成功！');
									//$('#editUserForm')[0].reset();
									layui.form.render();
									layui.close(index);
								} 
								//修改数据
							 	obj.update({
							 		//数据名:选项框的id
							 		userName:inname,
							 		passWord:inpass
								});
							 	$('#editUserForm')[0].reset();
							 	$("#editUser1").hide();//隐藏多余弹窗
							 	layer.close(index);
								layer.msg("修改成功！");
							},
							error : function() {
								layer.msg("修改失败")
							}
						});
					},
					//对表单进行提交
					 btn2:function(index,layor){
						layer.close(index);
						//清除表单内容
						$('#editUserForm')[0].reset();
						layui.form.render();
					}
					,end:function(){
						$('#editUserForm')[0].reset();
						layui.form.render();
					},
					success:function(index){
						$("#_inname").val(data.userName);
						$("#_inpass").val(data.passWord);
					} ,
					
				});
			}
		});
	});
</script>

</html>
