<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
    #detail_img{
        width: 200px;
    }
</style>
<script>
    let item_detail = {
        init:function(){
            $('#register_btn').click(function(){
                item_detail.send();
            });
            $("#delete_btn").click(function(){
                let c = confirm("삭제 하시겠습니까?");
                if(c == true){
                    location.href='/item/deleteimpl?id=${gitem.id}';
                }
            });
        },
        send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/item/updateimpl',
                enctype:'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        item_detail.init();
    })
</script>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item Detail</h1>


    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gitem.id}</h6>
        </div>
        <div class="card-body">
            <div id="container">
<%--                form start--%>
                <form id="register_form" class="form-horizontal well">
                    <input type="hidden" name="id" value="${gitem.id}">
                    <input type="hidden" name="imgname" value="${gitem.imgname}">

                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src="/uimg/${gitem.imgname}" id="detail_img"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">NAME:</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="name" value="${gitem.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="price">Price:</label>
                        <div class="col-sm-10">
                            <input type="number" name="price" class="form-control" id="price" value="${gitem.price}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="img">Image:</label>
                        <div class="col-sm-10">
                            <input type="file" name="img" class="form-control" id="img" placeholder="Input Image">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="register_btn" type="button" class="btn btn-primary">Update</button>
                            <button id="delete_btn" type="button" class="btn btn-primary">Delete</button>
                        </div>
                    </div>
                </form>
<%--                form end--%>
            </div>
        </div>
    </div>
</div>