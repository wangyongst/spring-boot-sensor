
var setting = {
        view: {
            selectedMulti: false
        },
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        edit: {
            enable: false
        }
    };
var setting2 = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		
	};
//组织机构树的初始化
var zNodes =[
    {id:1, pId:0, name:"办公楼", open:true},
    {id:101, pId:1, name:"总经办"},
    {id:102, pId:1, name:"项目部"},
    {id:103, pId:1, name:"质监部"},
    {id:2, pId:0, name:"技术部", open:false},
    {id:201, pId:2, name:"设备维护部"},
    {id:206, pId:2, name:"数据分析中心"},
    {id:3, pId:0, name:"安全保障部", open:false},
    {id:4, pId:0, name:"设备维护部", open:false},
];


//功能权限树的初始化

var zNodes2 =[
    {id:1, pId:0, name:"用户管理", open:false},
	{id:11, pId:1, name:"用户管理"},
	{id:111, pId:11, name:"新建"},
	{id:112, pId:11, name:"编辑"},
	{id:112, pId:11, name:"删除"},
	{id:112, pId:11, name:"查询"},
	{id:12, pId:1, name:"组织架构管理"},
	{id:121, pId:12, name:"查看"},
	{id:122, pId:12, name:"操作"},
	{id:2, pId:0, name:"传感器管理", open:false},
	{id:21, pId:2, name:"传感器信息管理"},
	{id:22, pId:2, name:"传感器数据管理"},
	{id:221, pId:22, name:"查看"},
	{id:222, pId:22, name:"操作"},
	{id:23, pId:2, name:"传感器事件"},
	{id:231, pId:23, name:"查看"},
	{id:232, pId:23, name:"操作"},
	{id:3, pId:0, name:"系统管理", open:false},
];

//上级菜单树
var zNodes6 =[
    {id:1, pId:0, name:"用户管理", open:true},
    {id:11, pId:1, name:"用户管理"},
    {id:12, pId:1, name:"组织架构管理"},
    {id:13, pId:1, name:"角色权限"},
    {id:2, pId:0, name:"传感器管理", open:false},
    {id:3, pId:0, name:"系统管理", open:false},
  ];    

//功能树
var zNodes7 =[
    {id:1, pId:0, name:"用户管理", open:true},
    {id:11, pId:1, name:"用户管理"},
	{id:111, pId:11, name:"新建"},
	{id:112, pId:11, name:"删除"},
	{id:113, pId:11, name:"修改"},
	 {id:114, pId:11, name:"查询"},
    {id:12, pId:1, name:"组织架构管理"},
    {id:13, pId:1, name:"角色权限"},
    {id:2, pId:0, name:"传感器管理", open:false},
    {id:3, pId:0, name:"系统管理", open:false},
  ];    

$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo1"), setting2, zNodes);
	$.fn.zTree.init($("#treeDemo2"), setting, zNodes2);
	$.fn.zTree.init($("#treeDemo6"), setting, zNodes6);
    $.fn.zTree.init($("#treeDemo7"), setting, zNodes7);
});