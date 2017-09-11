<%-- 
    Document   : refatdps
    Created on : 10/09/2017, 15:07:50
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
        <link href="content/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <%
            double ValFin = 0;
            double taxa=0;
            int i=0;
            double amort=0;
            if (request.getParameter("ValFin") != null) {
                try {
                    ValFin = Integer.parseInt(request.getParameter("ValFin"));
                } catch (Exception ex) {
                    out.println("<p>Parametro invalido</p>");
                }
                                try {
                    taxa = Double.parseDouble(request.getParameter("taxa"));
                } catch (Exception ex) {
                    out.println("<p>Parametro invalido</p>");
                }
                                                try {
                    i = Integer.parseInt(request.getParameter("i"));
                } catch (Exception ex) {
                    out.println("<p>Parametro invalido</p>");
                }
            }
            %>
        <h1>Amortização Constante</h1>
                                  <form>
                <label for='inputValor' style='font-size: 100%;'>Valor Financiado:</label>
                <input required min='0' step='0.0001' type='number'  value="<%=ValFin%>" id='inputValor' placeholder='R$' name='i'>
                <label for='inputTaxa' style='font-size: 100%;' >Taxa de Juros (%):</label>
                <input required min='0' step='0.0001' type='number'  value="<%=taxa%>" id='inputTaxa' placeholder='% ao mês' name='i'>
                <label for='inputTempo' style='font-size: 100%;' >Número de Meses:</label>
                <input required min='1' step='1' type='number' value="<%=i%>" id='inputTempo' placeholder='Meses' name='t'>
                <p><input type='submit' value='Calcular SAC'></p>
                <%
                    
                    %>
        <table border="1">
            <tr><th>#</th><th>Parcelas</th><th>Amortizações</th><th>Juros</th><th>Saldo Devedor</th></tr>
              <!--      <%for ( i=1; i <= 10; i++) {%>
            <tr>
           
            </tr>   
            <%}%>
        </table>
-->
                                </form>    
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
