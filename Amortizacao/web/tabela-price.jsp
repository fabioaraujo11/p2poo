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
            
        <h1>Tabela Price</h1>
        <form action="tabela-price.jsp">
            <div>
                <label for="valfin"  >Valor Financiamento:</label>
                <input type="text" id="valfin" name="valfin">
            </div>
            <div>
                <label for="taxa">Taxa de Juros:</label>
                <input type="text" id="taxa" name="taxa">
            </div>
            <div>
                <label for="months">Quantidade Parcelas:</label>
                <input type="text" id="months" name="months">
            </div>
            <div>
                <input type="submit" value="Calcular" />
            </div>
        </form>
        
        <%@page import="java.util.*" %>
        <%@page import="javax.swing.JOptionPane" %>
        <%
            double pmt = 0;
            double pv = 0; 
            double i = 0;
            int    n = 0;
            int    idx, idy= 0;
            int    cnt = 0;
            
            double saldoDevedor = 0;
            double juros = 0;
            
            StringTokenizer row = null;
            String cel = null;
            
            ArrayList<String> tablerow;
            try {
                    pv = Double.parseDouble(request.getParameter("valfin"));
                     if (pv <= 0)
                        throw new Exception("Numeros menores que 1 nao permitido");
                     
            } catch (NullPointerException pnull) {
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Formato campo Valor "
                        + "Financiamento invalido, use apenas valores numericos com "
                        + "ou sem virgula "
                        + "exemplo: 1000,23 ou 250");
            }
            
            try {
                    i = Double.parseDouble(request.getParameter("taxa"));
                     if (i <= 0)
                        throw new Exception("Numeros menores que 1 nao permitido");
                    
            } catch (NullPointerException pnull) {
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Formato campo Taxa "
                        + "de Juros invalido, use apenas valores numéricos com "
                        + "ou sem virgula"
                        + "exemplo: 10,01 ou 45");
            }
            
            try {
                if (request.getParameter("months") != null) {
                    n = Integer.parseInt(request.getParameter("months"));
                    if (n <= 0)
                        throw new Exception("Numeros menores que 1 nao permitido");
                }
                    
            } catch (NullPointerException pnull) {
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, "Formato campo Quantidade "
                        + "Parcelas invalido, use apenas valores inteiros positivos"
                        + "exemplo: 12 ");
            }

            if (pv > 0 && i > 0 && n > 0) {
                pmt = (pv * (i / 100)) / (1 - (1 / Math.pow((1 + (i / 100)), n)));
            
                tablerow = new ArrayList();
                tablerow.add(String.format("0;%.2f; ; ; ;", pv));
                    
                saldoDevedor = pv;
                for (idx = 0; idx < n; idx ++) {
                    juros = saldoDevedor * (i / 100);
                    saldoDevedor -= pmt-juros; 
                    tablerow.add(String.format("%d;R$%.2f;R$%.2f;R$%.2f;"
                            + "R$%.2f", idx + 1, saldoDevedor, pmt, juros, pmt-juros));
                }
                                
                out.println("<table border='1'>");
                out.println( "<tr>"); 
                out.println(  "<th>Período</th>");
                out.println(  "<th>Saldo Devedor</th>");
                out.println(  "<th>Parcela</th>");
                out.println(  "<th>Juros</th>");
                out.println(  "<th>Amortização</th>");
                out.println(  "</tr>");
                
                
                for (idx = 0; idx < (n+1); idx++){
                    out.println( "<tr>");
                    row = new StringTokenizer(tablerow.get(idx), ";");
                    
                    cnt = row.countTokens();
                    for (idy = 0; idy < cnt; idy++) {
                        cel = row.nextToken();
                        out.println("<th>"+ cel +"</th>");
                    }
                    
                    out.println( "</tr>");
                }
                out.println("</table>");
            }
            %>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    

