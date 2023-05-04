<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .marker_img{
        width:80px;
    }

    .modal_img{
        width:300px;
    }
</style>
<script>
    let marker_search = {
        init:function(){
            $('#search_btn').click(function(){
                $('#search_form').attr({
                    method:'post',
                    action:'/marker/search'
                });
                $('#search_form').submit();
            });
        }
    };

    $(function(){
       marker_search.init();
    });
</script>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker All</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker All</h6>
            <form id="search_form" class="form-inline well">
                <div class="form-group">
                    <label class="control-label col-sm-5" for="loc">Location: </label>
                    <div class="col-sm-4">
                        <select name="loc" class="form-control" id="loc">
                            <option value="S" <c:if test="${ms.loc=='S'}">selected</c:if>>서울</option>
                            <option value="B" <c:if test="${ms.loc=='B'}">selected</c:if>>부산</option>
                            <option value="J" <c:if test="${ms.loc=='J'}">selected</c:if>>제주</option>
                            <option value="" <c:if test="${ms.loc==''}">selected</c:if>>전체</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title:</label>
                    <div class="col-sm-4">
                        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title"
                        value="${ms.title}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-4">
                        <button id="search_btn" type="button" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Image</th>
                        <th>ID</th>
                        <th>Title</th>
                        <th>LAT</th>
                        <th>LNG</th>
                        <th>Loc</th>
                        <th>Target</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Image</th>
                        <th>ID</th>
                        <th>Title</th>
                        <th>LAT</th>
                        <th>LNG</th>
                        <th>Loc</th>
                        <th>Target</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${list}">
                        <tr>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                    <img src="/uimg/${obj.img}" class="marker_img"/>
                                </a>
                            </td>
                            <td><a href="/marker/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.title}</td>
                            <td>${obj.lat}</td>
                            <td>${obj.lng}</td>
                            <td>${obj.loc}</td>
                            <td>${obj.target}</td>
                        </tr>

                        <!-- Modal -->
                        <div id="target${obj.id}" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Detail Image</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.title}</p>
                                        <img src="/uimg/${obj.img}" class="modal_img"/>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/marker/detail?id=${obj.id}" class="btn btn-info" role="button">Detail</a>
                                        <a href="#" class="btn btn-info" data-dismiss="modal" role="button">Close</a>
                                    </div>
                                </div>
                                <%--modal content end--%>
                            </div>
                        </div>
                        <%--modal end--%>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

