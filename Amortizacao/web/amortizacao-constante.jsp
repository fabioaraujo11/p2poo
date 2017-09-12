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
        <title>Amortização Constante</title>
        <link href="content/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body style="text-align: center">
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <%
            
            
            double ValFin = 0;
            double taxa=0;
            double taxafinal=0;
            int i=0;
            double amort=0;
            double saldo=0;
            double parc=0;
            double parc2=0;
            double totalp=0;
            double totalj=0;
            double juros=0;
            int cont=2;
            DecimalFormat df = new DecimalFormat("0.000");
            
                
            if (request.getParameter("ValFin") != null) {
                try {
                    ValFin = Double.parseDouble(request.getParameter("ValFin"));
                } catch (Exception ex) {
                    out.println("Parametro invalido");
                }
                }
            if (request.getParameter("taxa") != null) {
                  try {
                    taxa = Double.parseDouble(request.getParameter("taxa"));
                } catch (Exception ex) {
                    out.println("Parametro invalido");
                }
            }
            if (request.getParameter("i") != null) {
                    try {
                    i = Integer.parseInt(request.getParameter("i"));
                } catch (Exception ex) {
                    out.println("Parametro invalido");
                }
            }
            
            %>
        <h1>Amortização Constante</h1>
                                  <form>
                <label for='inputValor' style='font-size: 100%;'>Valor Financiado:</label>
                <input required min='0' step='0.0001' type='number'  value="<%=ValFin%>" id='inputValor' placeholder='R$' name='ValFin'>
                <label for='inputTaxa' style='font-size: 100%;' >Taxa de Juros (%):</label>
                <input required min='0' step='0.0001' type='number'  value="<%=taxa%>" id='inputTaxa' placeholder='% ao mês' name='taxa'>
                <label for='inputTempo' style='font-size: 100%;' >Número de Meses:</label>
                <input  required min='1' step='1' type='number' value="<%=i%>" id='inputTempo' placeholder='Meses' name='i'>
                <p><input type='submit' class="btn btn-default" name='sendform' value='Calcular SAC'></p>
                                  </form>
                <%
                    amort = ValFin/i;
                    int x =0;
                    taxafinal=taxa/100;
                     saldo = ValFin-amort;
                    // parc=(amort+(taxa*ValFin));
                   // parc2 =(amort+taxa*(ValFin-x*amort));
                   
                    
                    %>
        <table class="table table-inverse">
            <tr><th>#</th><th>Parcelas</th><th>Amortizações</th><th>Juros</th><th>Saldo Devedor</th></tr>
            <%             if(request.getParameter("sendform")!=null){%>
            <td>1</td><td><%=df.format(parc=amort+(taxafinal*ValFin))%></td><td><%=df.format(amort=ValFin/i)%></td><td><%=df.format(totalj=(parc-amort))%></td><td><%=df.format(saldo)%></td>
        <%}%>
            <%totalp+=parc;%>
                    <%for ( x=1; x<=i ;x ++) { totalp+=parc2; totalj+=juros;%>
                    <%if(x==i){
                        break;}%>
            <tr>
                <td><%=cont++%></td><td><%=df.format(parc2=(amort+taxafinal*(ValFin-x*amort)))%></td><td><%=df.format(amort)%></td><td><%=df.format(juros=(parc2-amort))%></td><td><%=df.format(saldo=saldo-amort)%></td>

            </tr>   
            <%}%>
            
            <%if(request.getParameter("sendform")!=null){%>
            <td><strong>TOTAIS</strong></td><td><%=df.format(totalp)%></td><td><%=df.format(ValFin)%></td><td><%=df.format(totalj)%></td><TD>0</TD>
            <%}%>
        </table>
        
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
