<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/cmfzms_xxx/js/datagrid-detailview.js"></script> 
<script type="text/javascript">
	$(function(){
		$("#tab1").datagrid({
			url:"xxxxx",
			loadMsg:"加载中！",
			pagination:true,
			striped:true,
			fitColumns:true,
			fit:true,
			singleSelect:true,
			pageSize:15,
			pageList:[15,30,45],
			columns:[[
				{field:'carouselId',title:'标识编号',width:105},
				{field:'carouselOriginalName',title:'文件名',width:100},
				{field:'carouselMessage',title:'描述信息',width:90},
				{field:'carouselShowStatus',title:'轮播图状态',width:100,
					formatter: function(value,row,index){
						if(row.carouselShowStatus == 'y')
						return "<font color=\"red\">展示中</font>";
						else 
						return "未展示";
					}
					
				},
				{field:'carouselCreateTime',title:'轮播图创建时间',width:100},
				{field:'aa',title:'操作',width:50,
					formatter: function(value,row,index){
						return "<a class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>";
					}
				},
			]],
			toolbar:[{
				iconCls:"icon-image_edit",
				text:"新增轮播图",
				handler:function(){
					//alert("新增");
					$("#addCarousel").dialog({    
					    title: "新增轮播图",
					    iconCls:"icon-image_edit",    
					    width: 400,    
					    height: 240,
					    //border:"thin",
					    collapsible:true,
					    minimizable:true,
					    maximizable:true,
					    resizable:true,    
					    closed: false,    
					    cache: false,    
					    href: "${pageContext.request.contextPath}/carousel/add.jsp",    
					    modal: true   
					});  
				}
			},{
				iconCls:"icon-help",
				text:"帮助",
				handler:function(){
					alert("帮助");
				}
			}],
			onLoadSuccess:function(){
				$.parser.parse(); 
			},
			view: detailview,
			detailFormatter:function(index,row){
				return "<img src=\""+row.carouselUrl+"\">";
			}
		});
	});
	
	function test(){
		alert(11);
	}
</script>

<table id="tab1"></table>
<div id="addCarousel"></div>
