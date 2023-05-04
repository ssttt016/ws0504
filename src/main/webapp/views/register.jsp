<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    let register_form = {
        init:function(){
            $('#register_btn').addClass('disabled');
            $("#register_btn").click(function(){
                register_form.send();
            });
            $('#lev').keyup(function(){
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var lev = $('#lev').val();
                if(id != '' && pwd != '' && lev != ''){
                    $('#register_btn').removeClass('disabled');
                }
            })

            $('#id').keyup(function(){

                var txt_id = $('#id').val();
                if(txt_id.length <= 3){
                    return;
                }
                $.ajax({
                    url:'/checkid',
                    data:{'id':txt_id},
                    success:function(result){
                        if(result == 0){
                            $('#check_id').text('사용가능합니다.')
                        }else{
                            $('#check_id').text('사용불가능합니다.');
                        }
                    }
                });
            });
        },
        send:function(){
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if(id.length <= 3){
                $('#check_id').text('4자리 이상이어야합니다.');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(lev == ''){
                $('#pwd').focus();
                return;
            }
            $("#register_form").attr({
                'action':'/registerimpl',
                'method':'post'
            });
            $("#register_form").submit();
        }
    };

    $(function(){
        register_form.init();
    });
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Register</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Register</h6>
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
                                        <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                    </div>
                                    <form class="user" id="register_form">
                                        <div class="form-group">
                                                <input type="text" class="form-control form-control-user" id="id" name="id"
                                                       placeholder="ID">
                                        </div>
                                        <div class="form-group">
<%--                                        <div class="col-sm-10">--%>
                                            <span id="check_id" class="bg-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" id="pwd" name="pwd"
                                                   placeholder="PWD">
                                        </div>
                                        <div class="form-group">
                                                <input type="text" class="form-control form-control-user"
                                                       id="lev" name="lev" placeholder="Level">
                                        </div>
                                        <button id="register_btn" class="btn btn-primary btn-user btn-block">Register</button>
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


