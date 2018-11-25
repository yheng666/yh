<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2018/10/22
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/datatables/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap-datetimepicker.min.css">
</head>
<body>
<button class="btn btn-success" onclick="addBook();">新增</button>

<div class="panel panel-primary" style="width: 700px;">
    <div class="panel-heading">条件查询</div>
    <div class="panel-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">图书名称：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="bookNameSearch"/>
            </div>
        </div>
        <button class="btn btn-info" onclick="search();">查询</button>
    </div>
</div>


<div class="panel panel-primary">
    <div class="panel-heading">图书列表</div>
    <div class="panel-body">
        <table id="bookDateTable" class="table table-striped table-bordered table-hover" width="100%">
            <thead>
            <tr>
                <th>编号</th>
                <th>图书名称</th>
                <th>图书价格</th>
                <th>操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>


<div class="panel panel-default" id="editBookDiv" style="display: none;">
    <div class="panel-heading">修改图书</div>
    <div class="panel-body">
        <form class="form-horizontal" >
            <div class="form-group">
                <label class="col-sm-2 control-label">图书名称：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="bookName" >
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">图书价格：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="bookPrice" >
                </div>
            </div>
        </form>
    </div>
</div>

<div class="panel panel-default" id="addBookDiv" style="display: none;">
    <div class="panel-heading">新增图书</div>
    <div class="panel-body">
        <form class="form-horizontal" >
            <div class="form-group">
                <label class="col-sm-2 control-label">图书名称：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="bookAddName" >
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">图书价格：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="bookAddPrice" >
                </div>
            </div>
        </form>
    </div>
</div>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/datatables/js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootbox.min.js"></script>
<script type="text/javascript">

    $(function(){
        initBookTable();
    })

    function deleteBook(id){
        bootbox.confirm({
            title:"提示信息",
            message:"你确定要删除该图书吗?",
            callback:function(result){
                if(result) {
                    $.ajax({
                        url:"<%=request.getContextPath()%>/book/deleteBook.jhtml",
                        type:"post",
                        data:{"id":id},
                        success:function(result){
                            if(result.status=="ok"){
                                bootbox.alert({
                                    title:"提示信息",
                                    message:"删除成功！！！"
                                })
                                search();
                            } else{
                                bootbox.alert({
                                    title:"提示信息",
                                    message:"删除失败！！！"
                                })
                            }
                        }
                    })
                }
            }
        })
    }

    function addBook() {
        var bookAddDlg = bootbox.dialog({
            title:"添加图书",
            message:$("#addBookDiv form").clone(),
            size:"large",
            buttons:{
                ok:{
                    label:"添加",
                    className:"btn btn-success",
                    callback:function(){
                        var param={};
                        param.bookName= $("#bookAddName",bookAddDlg).val();
                        param.bookPrice=$("#bookAddPrice",bookAddDlg).val();
                        $.ajax({
                            url:"<%=request.getContextPath()%>/book/add.jhtml",
                            type:"post",
                            data:param,
                            success:function (result) {
                                if(result.status=="ok") {
                                    search();
                                }else {
                                    bootbox.alert({
                                        title:"提示信息",
                                        message:"添加失败！！！"
                                    })
                                }
                            }
                        })
                    }
                },
                cancel:{
                    label:"取消",
                    className:"btn btn-warning",
                }
            }
        })
    }

    function updateBook(id){

        var bookEditDlg = bootbox.dialog({
            title:"修改图书",
            message:$("#editBookDiv form").clone(),
            size:"large",
            buttons:{
                ok:{
                    label:"修改",
                    className:"btn btn-success",
                    callback:function(){
                        var param={};
                        param.id= id;
                        param.bookName= $("#bookName",bookEditDlg).val();
                        param.bookPrice=$("#bookPrice",bookEditDlg).val();
                        $.ajax({
                            url:"<%=request.getContextPath()%>/book/updateBook.jhtml",
                            type:"post",
                            data:param,
                            success:function (result) {
                                if(result.status=="ok") {
                                    search();

                                }else {
                                    bootbox.alert({
                                        title:"提示信息",
                                        message:"修改失败！！！"
                                    })
                                }
                            }
                        })
                    }
                },
                cancel:{
                    label:"取消",
                    className:"btn btn-warning",
                }
            }
        })
        $.ajax({
            url:"<%=request.getContextPath()%>/book/findBookById.jhtml",
            type:"post",
            data:{"id":id},
            success:function (result) {
                if(result.status=="ok") {
                    $("#bookName",bookEditDlg).val(result.data.bookName);
                    $("#bookPrice",bookEditDlg).val(result.data.bookPrice);
                }
            }
        })
    }

    function initBookTable(){
        $('#bookDateTable').DataTable({
            language: {
                url:"<%=request.getContextPath()%>/js/datatables/Chinese.json"
            },
            "processing": true,
            "searching": false,
            ajax:{
                url:"<%=request.getContextPath()%>/book/list.jhtml",
                type:"post",
                data:function(d){
                    d.bookName=$("#bookNameSearch").val();
                }
            },
            columns : [
                { data : 'id'},
                { data : 'bookName'},
                { data : 'bookPrice'},
                { data : 'id',
                    'render':function(data){
                        return '<button  class="btn btn-danger" onclick="deleteBook('+data+');">' +
                            '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>   ' +
                            '<button  class="btn btn-warning" onclick="updateBook('+data+');">' +
                            '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改</button>'
                    }
                }
            ]
        });
    }

    function  search() {
        $('#bookDateTable').dataTable().fnDestroy();
        initBookTable();
    }


</script>
</body>
</html>
