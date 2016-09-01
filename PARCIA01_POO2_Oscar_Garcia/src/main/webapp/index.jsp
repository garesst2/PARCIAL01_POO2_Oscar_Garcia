
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.sv.udb.controlador.AlumnosCtrl"%>
<%@page import="com.sv.udb.controlador.GruposCtrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Guia 3 POO2</title>
        <link rel="stylesheet" href="css/foundation.css">
        <link rel="stylesheet" href="css/app.css">
    </head>
    <body>
        <div class="row">
            <div class="large-12 column">
                <h1>Guia 3 POO2</h1>
            </div>
        </div>
        <div class="row">
            <div class="medium-centered columns">
                <ul class="tabs" data-tabs id="example-tabs">
                    <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Guardar Alumno</a></li>
                    <li class="tabs-title"><a href="#panel2">Guardar Datos Grupos-Alumnos</a></li>
                    <li class="tabs-title"><a href="#panel3">Ver alumnos</a></li>
                </ul>
                <div class="tabs-content" data-tabs-content="example-tabs">
                    <div class="tabs-panel is-active" id="panel1">
                        <div class="row">
                            <div class="large-9 columns align-right">
                                <form name="form1" method="post" action="AlumnosServ">
                                    <input style="display: none" type="text" id="txtlugarid" name="txtlugarid" placeholder="Lugar Acceso">
                                    <h6>Nuevo Registro</h6>
                                    <div class="medium-12 columns">
                                        <label>Alumno
                                            <input type="text" id="txtnombrealumno" name="txtnombrealumno" placeholder="Nombre Alumno">
                                            <input type="text" id="txtapellidoalumno" name="txtapellidoalumno" placeholder="Apellido Alumno">
                                            <input type="email" id="txtemailalumno" name="txtemailalumno" placeholder="E-mail Alumno">
                                            <input type="text" id="txttelefonooalumno" name="txttelefonooalumno" placeholder="Telefono Alumno">
                                            <input type="text" id="txtdireccionoalumno" name="txtdireccionoalumno" placeholder="Dirección Alumno">
                                            <select name="txtgen">
                                                <option value="M">Masculino</option>
                                                <option value="f">Femenino</option>
                                            </select>
                                        </label>
                                    </div>
                                    <div class="medium-7 columns">
                                        <label style="color:white">d</label>
                                        <input type="submit" id="btnlugar" class="success button" value="Guardar" name="frmalumno">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="tabs-panel" id="panel2">
                        <div class="row">
                            <div class="large-9 columns align-right">
                                <form name="form2" method="post" action="GruposServ">
                                    <input style="display: none" type="text" id="txtdocumentoid" name="txtdocumentoid" placeholder="Lugar Acceso">
                                    <h6>Nuevo Registro</h6>
                                    <jsp:useBean id="bean2feCtrl" class="com.sv.udb.controlador.GruposCtrl" scope="page"/>
                                    <div class="medium-6 columns">
                                        <label>Grupos
                                            <select name="txtgrupo">
                                                <c:forEach items="${bean2feCtrl.consTodo()}" var="fila2">
                                                    <option value="<c:out value="${fila2.codiGrup}"></c:out>">${fila2.nombGrup}</option>
                                                    </c:forEach> 
                                            </select>
                                        </label>
                                    </div>
                                    <jsp:useBean id="bean1feCtrl" class="com.sv.udb.controlador.AlumnosCtrl" scope="page"/>
                                    <div class="medium-6 columns">
                                        <label>Grupos
                                            <select name="txtalumno">
                                                <c:forEach items="${bean1feCtrl.consTodo()}" var="fila1">
                                                    <option value="<c:out value="${fila1.codiAlum}"></c:out>">${fila1.nombAlum}</option>
                                                    </c:forEach> 
                                            </select>
                                        </label>
                                    </div>
                                    <div class="medium-6 columns">
                                        <label style="color:white">d</label>
                                        <input type="submit" class="success button" id="btndocumento" value="Guardar" name="frmDocu">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="tabs-panel" id="panel3">
                        <jsp:useBean id="beantipogafeCtrl" class="com.sv.udb.controlador.AlumnosCtrl" scope="page"/>
                        <table class="hover">              
                            <thead>
                            <th width="200">Código</th>
                            <th width="200">Tipo Gafete</th>
                            <th width="200">Accion</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${beantipogafeCtrl.consTodo()}" var="fila3">
                                    <tr>
                                        <td id="tr31-<c:out value="${fila3.apelAlum}"></c:out>">${fila3.apelAlum}</td>
                                        <td id="tr32-<c:out value="${fila3.apelAlum}"></c:out>">${fila3.apelAlum}</td>
                                        <td><h><button type="button" class="success button" onclick="lugarselect3(<c:out value="${fila3.apelAlum}" ></c:out>)" >Seleccionar</button></td>
                                        </tr>
                                </c:forEach> 
                                </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/vendor/jquery.js"></script>
        <script src="js/vendor/what-input.js"></script>
        <script src="js/vendor/foundation.js"></script>
        <script src="js/vendor/jquery-dateFormat.js"></script>
        <script src="js/app.js"></script>
        <script type="text/javascript">
                                            function lugarselect(id)
                                            {
                                                $("#btnlugar").hide();
                                                $("#btnlugar1").show();
                                                $("#btnlugar2").show();
                                                $campo0 = $("" + id).text();
                                                $campo1 = $("#tr2-" + id).text();
                                                $("#txtlugarid").val(id);
                                                $("#txtlugar").val($campo1);
                                            }
                                            function lugarselect2(id)
                                            {
                                                $("#btndocumento").hide();
                                                $("#btndocumento1").show();
                                                $("#btndocumento2").show();
                                                $campo0 = $("" + id).text();
                                                $campo1 = $("#tr22-" + id).text();
                                                $("#txtdocumentoid").val(id);
                                                $("#txtdocumento").val($campo1);
                                            }
                                            function lugarselect3(id)
                                            {
                                                $("#btngafe").hide();
                                                $("#btngafe1").show();
                                                $("#btngafe2").show();
                                                $campo0 = $("" + id).text();
                                                $campo1 = $("#tr32-" + id).text();
                                                $("#txtgafeid").val(id);
                                                $("#txtgafe").val($campo1);
                                            }
        </script>
    </body>
</html>
