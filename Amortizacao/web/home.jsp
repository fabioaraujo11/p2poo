<%-- 
    Document   : home
    Created on : 10/09/2017, 15:43:31
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início</title>
        <link href="content/css/bootstrap.css" rel="stylesheet">
    </head>
    <body style="text-align: center" >
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        
        <br />
        <div class="container-fluid">
            <div class="col-sm-4 thumbnail">
                <div class="caption">
                    <h3>Amortização Americana</h3>
                    <p class="text-justify">O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo 
                        pagamento apenas dos juros da dívida, deixando o valor da dívida constante, que pode ser paga em 
                        apenas um único pagamento.
                        Esse sistema de amortização tem a vantagem em relação ao sistema de pagamento único, pois nele não 
                        há incidência de juros sobre juros. Os juros sempre incidem sobre o valor original da dívida. Com
                        isso o devedor pode quitar sua dívida quando quiser.</p>
                </div>
            </div>
            <div class="col-sm-4 thumbnail">
                <div class="caption">
                    <h3>Amortização Constante</h3>
                    <p class="text-justify"> Sistema de Amortização Constante (SAC) é uma forma de amortização de um empréstimo 
                        por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo.
                        Neste sistema o saldo devedor é reembolsado em valores de amortização iguais. Desta forma, no
                        sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação. 
                        O valor da amortização é calculada dividindo-se o valor do principal pelo número de períodos de 
                        pagamento, ou seja, de parcelas.</p>
                </div>
            </div>
            <div class="col-sm-4 thumbnail">
                <div class="caption">
                    <h3>Tabela Price</h3>
                    <p class="text-justify">Tabela Price, também chamado de sistema francês de amortização, é um método usado em 
                        amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais.A 
                        tabela Price usa o regime de juros compostos para calcular o valor das parcelas de um empréstimo e, 
                        dessa parcela, há uma proporção relativa ao pagamento de juros e amortização do valor emprestado.</p>
                </div>
            </div>
        </div>
        
        <hr />
        <div>
            
            <h1 style="font-size: 60px">Integrantes</h1>
            
        <div class='col-sm-3 '>
            <img src='content/img/allan.jpg' class="img-thumbnail" style="width: 60%">
            <div class="caption " >
            <h3>Allan Almeida</h3>
            </div>
        </div>
        <div class='col-sm-3 ' >
            <img src='content/img/fabio.jpg' class="img-thumbnail" style="width: 60%">
            <div class="caption">
            <h3>Fabio Araujo</h3>
            </div>
        </div>
        <div class='col-sm-3 ' >
            <img src='content/img/henrique.jpg' class="img-thumbnail" style="width: 60%">
            <div class="caption">
            <h3>Henrique Hornos</h3>
            </div>
        </div>
        <div class='col-sm-3 ' >
            <img src='content/img/vitor.jpg' class="img-thumbnail" style="width:60%">
            <div class="caption">
            <h3>Vitor Jesus</h3>
            </div>
        </div>
        </div>
        
<br />
<br />
<br />
<br />
<br />
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
