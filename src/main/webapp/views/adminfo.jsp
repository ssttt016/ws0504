<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let adminfo_form = {
        init:function(){
            $("#adminfo_btn").click(function(){
                adminfo_form.send();
            });

        },
        send:function(){

            $("#adminfo_form").attr({
                'action':'/adminfoimpl',
                'method':'post'
            });
            $("#adminfo_form").submit();
        }
    };

    $(function(){
        adminfo_form.init();
    });
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Adm Info</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Adm Info</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Adm Info</h1>
                                    </div>
                                    <form class="user" id="adminfo_form">
                                        <div class="form-group">
                                                <input type="text" class="form-control form-control-user" id="id" name="id"
                                                       value="${adminfo.id}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" id="pwd" name="pwd">
                                        </div>
                                        <div class="form-group">
                                                <input type="text" class="form-control form-control-user"
                                                       id="lev" name="lev" value="${adminfo.lev}">
                                        </div>
                                        <button id="adminfo_btn" class="btn btn-primary btn-user btn-block">Update</button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/login">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
