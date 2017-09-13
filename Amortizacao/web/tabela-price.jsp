<%-- 
    Document   : tabela-price
    Created on : 10/09/2017, 15:44:54
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        <link href="content/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body style="text-align: center">
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <%@page import="java.util.*" %>
        <%
            char   isValidForm = 0;
            double pmt = 0;
            double pv = 0; 
            double i = 0;
            double sumJuros = 0;
            double sumParc = 0;
            double sumAmort = 0;
            String aux;
            
            
            int    n = 0;
            int    idx, idy= 0;
            int    cnt = 0;
            
            double saldoDevedor = 0;
            double juros = 0;
            asd
            StringTokenizer row = null;
            String cel = null;
             
            ArrayList<String> tablerow = null;
            
            if (request.getParameter("valfin") != null) {
                try {
                    pv = Double.parseDouble(request.getParameter("valfin"));
                    if (pv <= 0) {
                       throw new Exception("Numero zero ou negativo não é permitido");
                    }
                } catch (Exception ex) {
                %> <script> alert("Formato campo Valor "
                            + "Financiamento invalido, use apenas valores numericos positivos com "
                            + "ou sem virgula "
                            + "exemplo: 1000,23 ou 250");
                   </script>
                <%
                    pv = 0;
                }
            }
            
            if (request.getParameter("taxa") != null) {
                try {
                        i = Double.parseDouble(request.getParameter("taxa"));
                        if (i <= 0) {
                            throw new Exception("Numero zero ou negativo não é permitido");
                        }
                } catch (Exception ex) {
                %> <script> alert("Formato campo Taxa "
                            + "de Juros invalido, use apenas valores numéricos positivos com "
                            + "ou sem virgula "
                            + "exemplo: 10,01 ou 45");
                   </script>
                <%
                    i = 0;
                }
            }

            if (request.getParameter("months") != null) {
                try {
                    if (request.getParameter("months") != null) {
                        n = Integer.parseInt(request.getParameter("months"));
                        if (n <= 0) {
                            throw new Exception("Numero zero ou negativo não é permitido");
                        }
                    }
                } catch (Exception ex) {
                %> <script> alert("Formato campo Quantidade "
                            + "Parcelas invalido, use apenas valores numéricos inteiros positivos "
                            + "exemplo: 12 ");
                   </script>
                <%
                    n = 0;
                }
            }

            if (pv > 0 && i > 0 && n > 0) {
                isValidForm = 1;
                pmt = (pv * (i / 100)) / (1 - (1 / Math.pow((1 + (i / 100)), n)));
            
                tablerow = new ArrayList();
                tablerow.add(String.format("0;%.2f; ; ; ;", pv));
                    
                saldoDevedor = pv;
                for (idx = 0; idx < n; idx ++) {
                    juros = saldoDevedor * (i / 100);
                    sumJuros += juros;
                    sumParc += pmt;
                    saldoDevedor -= pmt-juros;
                    sumAmort += pmt-juros;
                    tablerow.add(String.format("%d;R$ %.2f;R$ %.2f;R$ %.2f;"
                            + "R$ %.2f", idx + 1, saldoDevedor, pmt, juros, pmt-juros));
                }
            }
        %>
            
        <h1>Tabela Price</h1>
        <div>
            <form action="tabela-price.jsp">
                <label for="valfin" style="font-size: 100%">Valor Financiamento:</label>
                <input type="number" id="valfin" name="valfin" required="required"
                       min="0.01" step="0.01" placeholder="R$">
                
                <label for="taxa" style="font-size: 100%">Taxa de Juros:</label>
                <input type="number" id="taxa" name="taxa" required="required"
                       min="0.0001" step="0.0001" placeholder="%">
                
                <label for="months" style="font-size: 100%">Quantidade Parcelas:</label>
                <input type="number" id="months" name="months" required="required" 
                       min="1" step="1" placeholder="Numero Meses">
                
                <input class="btn btn-default" type="submit" name="sendform" 
                       value="Calcular Price" />
            </form>    
        </div>
        
        <div>
            <table class="table tatable-inverse">
                <tr>
                    <th>Período</th>
                    <th>Saldo Devedor</th>
                    <th>Parcela</th>
                    <th>Juros</th>
                    <th>Amortização</th>
                </tr>
        <%          if(request.getParameter("sendform")!=null &&
                       isValidForm != 0){%>
        <%              for (idx = 0; idx < (n+1); idx++) { %>
                        <tr>
        <%                  row = new StringTokenizer(tablerow.get(idx), ";");

                            cnt = row.countTokens();
                            for (idy = 0; idy < cnt; idy++) {
                                cel = row.nextToken();
        %>
                                <th><%=cel%></th>
        <%                  } %>
                        </tr>
        <%              } %>
                    <tr>
                        <th>Totais</th>
                        <th></th>
                        <th>
                            <% out.println(String.format("R$ %.2f", sumParc));%>
                        </th>
                        <th>
                            <% out.println(String.format("R$ %.2f", sumJuros));%>
                        </th>
                        <th>
                            <% out.println(String.format("R$ %.2f", sumAmort));%>
                        </th>
                    </tr>
        <%          }%>
                </table>
            </div>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    

