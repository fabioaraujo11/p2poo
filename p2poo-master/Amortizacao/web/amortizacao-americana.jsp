<%-- 
    Document   : refatdps
    Created on : 10/09/2017, 15:07:50
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
 
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
        <link href="content/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body style="text-align: center; margin: 20px 40px 300px 30px">
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <%
            
            
            double montante = 0;
            double juros = 0;
            double jurosfinal = 0;
            int meses=0;
            double montfinal = 0;
            double parcelajuros = 0;
            double parcelafinal = 0;

            DecimalFormat df = new DecimalFormat("0.000");
            
                
            if (request.getParameter("montante") != null) {
                try {
                    montante = Double.parseDouble(request.getParameter("montante"));
                } catch (Exception ex) {
                    out.println("Parametro invalido");
                }
                }
            if (request.getParameter("juros") != null) {
                  try {
                    juros = Double.parseDouble(request.getParameter("juros"));
                } catch (Exception ex) {
                    out.println("Parametro invalido");
                }
            }
            if (request.getParameter("meses") != null) {
                    try {
                    meses = Integer.parseInt(request.getParameter(""));
                } catch (Exception ex) {
                    out.println("Parametro invalido");
                }
            }
            
            %>
        <h1>Amortização Constante</h1>
                                  <form>
                <label for='inputValor' style='font-size: 100%;'>Valor Financiado:</label>
                <input required min='0' step='0.0001' type='number'  value="<%=montante%>" id='inputValor' placeholder='R$' name='ValFin'>
                <label for='inputTaxa' style='font-size: 100%;' >Taxa de Juros (%):</label>
                <input required min='0' step='0.0001' type='number'  value="<%=juros%>" id='inputTaxa' placeholder='% ao mês' name='taxa'>
                <label for='inputTempo' style='font-size: 100%;' >Número de Meses:</label>
                <input  required min='1' step='1' type='number' value="<%=meses%>" id='inputTempo' placeholder='Meses' name='i'>
                <p><input type='submit' class="btn btn-default" name='sendform' value='Calcular SAA'></p>
                                  </form>
                <%
                    jurosfinal=juros/100;
                    int x =0;
                    parcelajuros = montante*jurosfinal;
                    parcelafinal = montante+parcelajuros;

                    %>
        <table class="table table-inverse">
            <tr><th>#</th><th>Parcelas</th><th>Amortizações</th><th>Juros</th><th>Saldo Devedor</th></tr>
            <%             if(request.getParameter("sendform")!=null){%>
            <td>1</td><td><%=df.format(parcelajuros)%></td><td>-</td><td><%=df.format(parcelajuros)%></td><td><%=df.format(montante)%></td>
        <%}%>
  
                    <%for ( x=1; x<meses ;x ++)%>
                    
            <tr>
                <td><%=x%></td><td><%=df.format(parcelajuros)%></td><td>-</td><td><%=df.format(parcelajuros)%></td><td><%=df.format(montante)%></td>

            </tr>   
            <%}%>
            
            <tr>
                <td><%=meses%></td><td><%=df.format(parcelafinal)%></td><td><%=df.format(montante)%></td><td>-</td>
                
            </tr>
        </table>
        
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>