<%-- 
    Document   : tabela-price
    Created on : 10/09/2017, 15:44:54
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        <link href="content/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body style="text-align: center">
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <%
            double pmt;
            double pv; 
            double i;
            int    n;
           
            if (!"".equals(request.getParameter("valfin"))) {
                try {
                        pv = Double.parseDouble(request.getParameter("valfin"));
                    } catch (Exception ex) {
                        out.println("<p>Formato campo Valor Financiamento invalido</p>");
                    }
            }

            if (!"".equals(request.getParameter("taxa"))) {
                try {   
                        i = Double.parseDouble(request.getParameter("taxa"));
                } catch (Exception ex) {
                    out.println("<p>Formato campo Taxa de Juros invalido</p>");
                }
            }

            if (!"".equals(request.getParameter("months"))) {
                try {
                        n = Integer.parseInt(request.getParameter("months"));
                } catch (Exception ex) {
                    out.println("<p>Formato campo Quantidade Parcelas invalido</p>");
                }
            }
            %>
        <h1>Tabela Price</h1>
        <form action="/tabela-price" method="post">
            <div>
                <label for="valfin"  >Valor Financiamento:</label>
                <input type="text" id="valfin">
            </div>
            <div>
                <label for="taxa">Taxa de Juros:</label>
                <input type="text" id="taxa">
            </div>
            <div>
                <label for="months">Quantidade Parcelas:</label>
                <input type="text" id="months">
            </div>
            
        </form>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
