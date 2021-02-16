<%-- 
    Document   : showData
    Created on : 02-feb-2021, 18:59:56
    Author     : Seruji
--%>

<%@page import="model.History"%>
<%@page import="model.SoftwareSpec"%>
<%@page import="model.Software"%>
<%@page import="model.HardwareSpec"%>
<%@page import="model.Hardware"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Team"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./exercise.css">
        <title>Show data</title>
        <style>
            table, td, tr, th {
                border: 1px solid black;
            }
        </style>
    </head> 
    <body>
        <%
            ArrayList<Team> teams = (ArrayList<Team>) request.getSession().getAttribute("teams");
            for (Team team : teams) {
        %>  
        <h2>Team</h2>
        <table>
            <thead>
                <tr>
                    <th scope="col">Director</th>
                    <th scope="col">Ubication</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=team.getDirector()%></td>
                    <td><%=team.getUbication()%></td>
                </tr>
            </tbody>
        </table>
        <h2>Users in the team</h2>
        <table>
            <thead>
                <tr>
                    <th scope="col">DNI</th>
                    <th scope="col">Email</th>
                    <th scope="col">Name</th>
                    <th scope="col">Surname</th>
                    <th scope="col">Type</th>
                </tr>
            </thead>
            <tbody>
                <% for (User user : team.getUsers()) {%>
                <tr>
                    <td><%=user.getDni()%></td>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getName()%></td>
                    <td><%=user.getSurname()%></td>
                    <td><%=user.getType()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <h2>Hardware used in the team</h2>
        <% for (Hardware hw : team.getHardware()) {%>
        <table>
            <thead>
                <tr>
                    <th scope="col">Type</th>
                    <th scope="col">Regional</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=hw.getType()%></td>
                    <td><%=hw.getRegional()%></td>
                </tr>
            </tbody>
        </table>
        <table>
            <thead>
                <tr>
                    <th scope="col">Serial</th>
                    <th scope="col">Brand</th>
                    <th scope="col">Model</th>
                    <th scope="col">Observations</th>
                </tr>
            </thead>
            <tbody>
                <% for (HardwareSpec hws : hw.getHardwareSpecs()) {%>
                <tr>
                    <td><%=hws.getSerial()%></td>
                    <td><%=hws.getBrand()%></td>
                    <td><%=hws.getModel()%></td>
                    <td><%=hws.getObservations()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>
        <h2>Software used in the team</h2>
        <% for (Software sw : team.getSoftware()) {%>
        <table>
            <thead>
                <tr>
                    <th scope="col">Type</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=sw.getType()%></td>
                </tr>
            </tbody>
        </table>
        <table>
            <thead>
                <tr>
                    <th scope="col">License</th>
                    <th scope="col">Version</th>
                    <th scope="col">Other</th>
                    <th scope="col">Observations</th>
                </tr>
            </thead>
            <tbody>
                <% for (SoftwareSpec sws : sw.getSoftwareSpecs()) {%>
                <tr>
                    <td><%=sws.getLicense()%></td>
                    <td><%=sws.getVersion()%></td>
                    <td><%=sws.getOthers()%></td>
                    <td><%=sws.getObservations()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>
        <h2>Team's History</h2>
        <table>
            <thead>
                <tr>
                    <th scope="col">Entry date</th>
                    <th scope="col">Exit date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Observations</th>
                </tr>
            </thead>
            <tbody>
                <% for (History h : team.getHistory()) {%>
                <tr>
                    <td><%=h.getEntryDate()%></td>
                    <td><%=h.getExitDate()%></td>
                    <td><%=h.getStatus()%></td>
                    <td><%=h.getObservations()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>
    </body>
</html>
