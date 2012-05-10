<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Leaflet.Home" %>

<%@ Register Src="Login.ascx" TagName="Login" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>..::SimpleMAPS::..</title>
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="dist/leaflet.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="../dist/leaflet.ie.css" /><![endif]-->
    <link href="main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    //<![CDATA[ 
    
        function CarregarFormas(){ // carrega todas as formas geometricas
            CarregarPonto();
            CarregarTriangulo();
        }
        
        function CarregarPonto(){
            var url = window.location.href; //pega a url atual
            var tam = url.length; // tamanho
            var nomeMapa = "";
            var nomeTemp2 = "";
           for(var a= 0; a < tam; a++){
                if(url.charAt(a) == "="){
                    var nomeTemp = url.substr(a+1,tam); // pega tudo que tiver depois do sinal de =, ou seja, o nome da variavel                  
                    var tamanhoSeparador = nomeTemp.length;
                    for(var b= 0; b < tamanhoSeparador; b++){
                        if(nomeTemp.charAt(b) == "&"){
                            nomeTemp2 = nomeTemp.substr(0,b);
                        }
                    }
                    var tamanho = nomeTemp2.length;
                    for(var v = 0; v < tamanho; v++){
                        nomeMapa = nomeMapa + nomeTemp2.charAt(v).replace("_", " ");
                    }
                    Leaflet.WSPrincipal.CarregaInformacoes(nomeMapa,CriarPontoCarregado, ErroCadastro); // ver se o nomeMapa está chegando no WebS
                }
           }
        }
        
        function CriarPontoCarregado(resultado){
            for(var a = 0; a < resultado.length; a++){
		                var markerLocation = new L.LatLng(resultado[a].latitude - (-0.00001),resultado[a].longitude- (-0.00001));
		                var marker = new L.Marker(markerLocation);
		                map.addLayer(marker);
		                marker.bindPopup(resultado[a].texto).openPopup();
            }
         }

        function CarregarTriangulo(){
            var url = window.location.href; //pega a url atual
            var tam = url.length; // tamanho
            var nomeMapa = "";
            var nomeTemp2 = "";
           for(var a= 0; a < tam; a++){
                if(url.charAt(a) == "="){
                    var nomeTemp = url.substr(a+1,tam); // pega tudo que tiver depois do sinal de =, ou seja, o nome da variavel                  
                    var tamanhoSeparador = nomeTemp.length;
                    for(var b= 0; b < tamanhoSeparador; b++){
                        if(nomeTemp.charAt(b) == "&"){
                            nomeTemp2 = nomeTemp.substr(0,b);
                        }
                    }
                    var tamanho = nomeTemp2.length;
                    for(var v = 0; v < tamanho; v++){
                        nomeMapa = nomeMapa + nomeTemp2.charAt(v).replace("_", " ");
                    }
                    Leaflet.WSPrincipal.CarregarInfoTriangulo(nomeMapa,CriarTrianguloCarregado, ErroCadastro);
                }
           }
        }
        
        function CriarTrianguloCarregado(resultado){
            for(var a = 0; a < resultado.length; a++){
                        var p1 = new L.LatLng(parseFloat(resultado[a].lat1),parseFloat(resultado[a].lng1));
				        var p2 = new L.LatLng(parseFloat(resultado[a].lat2),parseFloat(resultado[a].lng2));
				        var p3 = new L.LatLng(parseFloat(resultado[a].lat3),parseFloat(resultado[a].lng3));
                        var polygonPoints2 = new Array(p1, p2, p3);
                        var Tpolygon = new L.Polygon(polygonPoints2);
                        map.addLayer(Tpolygon);
                        Tpolygon.bindPopup(resultado[a].texto).openPopup();
            }
        }

        function mostraEscondedor() {
            document.getElementById('escondedor').style.visibility = 'visible';
        }
        function ocultaEscondedor() {
            document.getElementById('escondedor').style.visibility = 'hidden';
        }
        
        function mostraEscondedorMapa() {
            document.getElementById('escondedorMapa').style.visibility = 'visible';
        }
        function ocultaEscondedorMapa() {
            document.getElementById('escondedorMapa').style.visibility = 'hidden';
        }
     //]]>
    </script>
    <script type="text/javascript" src="dist/leaflet.js"></script>
</head>
<body onload="CarregarFormas()" >
    <form id="form1" runat="server">
    <uc1:Login ID="Login1" runat="server" />
    
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="WSPrincipal.asmx" />
            </Services>
        </asp:ScriptManager>
    </div>
    </form>
    <div id="map" style="width: 100%"></div>

    <div id="escondedor" class="escondedor"><table class="centralizadora"><tr><td align="center" valign="middle">
     
    <div id="div1" runat="server"><table style="width: 300pt; background-color: #EAECFF">
            <tr>
                <td colspan="2" style="text-align: center">
                    Realizar Cadastro
                </td>
            </tr>
            <tr>
                <td style="width: 90pt; text-align:right">
                    E-mail:
                </td>
                <td>
                    <input type="text" id="txtEmail" runat="server" class="txtCadastro" />
                </td>
            </tr>
            <tr>
                <td style="text-align:right">
                Senha:
                </td>
                <td>
                    <input type="password" id="txtSenha" runat="server" class="txtCadastro" />
                </td>
            </tr>
            <tr>
                <td style="text-align:right">
                Repetir senha:
                </td>
                <td>
                   <input type="password" id="txtRepeteSenha" runat="server" class="txtCadastro" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <a href="#" onclick="javascript:cadastro();"><img src="Images/salvar_5.png" alt="Salvar" /></a>
                    &nbsp;
                    <a onclick="javascript:ocultaEscondedor();" href="#"><img src="Images/excluir_3.png" alt="Fechar" /></a>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    </div>
    </td></tr></table></div>
     <div id="escondedorMapa" class="escondedor"><table class="centralizadora"><tr><td align="center" valign="middle">
        <div id="div2" runat="server"><table style="width: 250pt; background-color: #EAECFF">
         <tr><td>Nome do Mapa:</td>
             <td>
                <input type="text" id="nome_novo_mapa" style="width: 140pt"/>
             </td>
         </tr>
         <tr>
            <td colspan="2" align="right">
            <input type="button" id="btnok" value="Ok" onclick="javascript:CriarMapa();" />
            <input type="button" id="btncancel" value="Cancelar" onclick="javascript:ocultaEscondedorMapa();" /></td>
         </tr>
         </table></div></td></tr></table></div>
 
   <script type="text/javascript">
		var map = new L.Map('map');
		var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png',
			cloudmadeAttribution = 'SimpleMaps',
			cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttribution});

		map.setView(new L.LatLng(-23.577813,-46.644752), 13).addLayer(cloudmade);


		var markerLocation = new L.LatLng(-23.577813,-46.644752);
		var marker = new L.Marker(markerLocation);
		map.addLayer(marker);
		
		marker.bindPopup("<b>Aqui é a BandTec!").openPopup();

		map.on('click', onMapClick);

		var popup = new L.Popup();
        
     //CarregarPonto(); // toda vez que existe um load na página, procura por um mapa
    //********** CRIAR NOVO MAPA *********
    
        function CriarMapa(){
           var nomemp = document.getElementById('nome_novo_mapa').value;
           Leaflet.WSPrincipal.NovoMapa(nomemp,okmapa, erromapa);
        }
        function okmapa(e) {
            window.location.href = e.toString();
        }
        function erromapa(e) {
            alert(e.toString());
        }
    //*********** realiza um novo cadastro
        function cadastro(){
           var email = document.getElementById('txtEmail').value;
           var senha = document.getElementById('txtSenha').value;
           var rptSenha = document.getElementById('txtRepeteSenha').value;
           
           Leaflet.WSPrincipal.novoCadastro(email, senha, rptSenha, OkCadastro, ErroCadastro);
        }
        function OkCadastro(e) {
         alert(e.toString());
        }
        function ErroCadastro(e) {
            alert(e.toString());
        }

		//Variaveis Globais
		var texto ='';
		var lat;
		var lng;
		var regiao;
		var circuloPontox;
		var circuloPontoy;
		var Tponto1x;
		var Tponto1y;
		var Tponto2x;
		var Tponto2y;
		var Tponto3x;
		var Tponto3y;
		var video1;
		var video2;
		var video3;
		var imagem1;
		var imagem2;
		var imagemLink;
		var videoBotoes;
		var videoLink;
		var acao = {
		    atual: null,
		    NADA: function (e) {
		        return false;
		    },
		    PONTO: function (e) {
		        acao.atual = acao.NADA;
			    lat = e.latlng.lat.toFixed(6) - (-0.00001);
			    lng = e.latlng.lng.toFixed(6) - (-0.00001);
			    return criarPonto();
	        },
	        REMOVE: function (e) {
		        acao.atual = acao.NADA;
			    lat = e.latlng.lat.toFixed(6) - (-0.00001);
			    lng = e.latlng.lng.toFixed(6) - (-0.00001);
			    return RemoveForma();
			},
		    VIDEO: function (e) {
		        acao.atual = acao.NADA;
			    lat = e.latlng.lat.toFixed(6) - (-0.00001);
			    lng = e.latlng.lng.toFixed(6) - (-0.00001);
			    return criarVideo();
			},
		    IMAGEM: function (e) {
		        acao.atual = acao.NADA;
			    lat = e.latlng.lat.toFixed(6) - (-0.00001);
			    lng = e.latlng.lng.toFixed(6) - (-0.00001);
			    return criarImagem();
		    },
		    TRIANGULO: function (e) {
				acao.atual = acao.TRIANGULO2;
				Tponto1x = e.latlng.lat.toFixed(6) - (-0.00001);
				Tponto1y = e.latlng.lng.toFixed(6) - (-0.00001);
				return false;
		    },
		    TRIANGULO2: function (e) {
				acao.atual = acao.TRIANGULO3;
				Tponto2x = e.latlng.lat.toFixed(6) - (-0.00001);
				Tponto2y = e.latlng.lng.toFixed(6) - (-0.00001);
				return false;
		    },
		    TRIANGULO3: function (e) {
				acao.atual = acao.NADA;
				Tponto3x = e.latlng.lat.toFixed(6) - (-0.00001);
				Tponto3y = e.latlng.lng.toFixed(6) - (-0.00001);
				return criarTriangulo();
		    },
	        CIRCULO: function (e) {
		        acao.atual = acao.CIRCULO2;
			    lat = e.latlng.lat.toFixed(6) - (-0.00001);
			    lng = e.latlng.lng.toFixed(6) - (-0.00001);
			    regiao = document.createElement("div");
			    regiao.className = "floatDiv";
			    regiao.style.width = "100px";
			    regiao.style.height = "100px";
			    regiao.style.left = e.layerPoint.x + "px";
			    regiao.style.top = e.layerPoint.y + "px";
			    regiao.style.zIndex = 6;
			    var m = document.getElementById("map");
			    m.appendChild(regiao);
			    attachObserver(m, "mousemove", circuloMouseMove, true);
			    return false;
	        },
	        CICULO2: function (e) {
	            return false;
	        }
		};
		acao.atual = acao.NADA;
		var poligno = false;
		var remove = false;
		var video = false;
		var imagem = false;
	
		function mostraMenu(id) {
		    document.getElementById(id).style.display = "block";
		}
		function escondeMenu(id) {
		    document.getElementById(id).style.display = "none";
		}
		function menuPontoClick() {
            acao.atual = acao.PONTO;
            escondeMenu("m1");
		}
		function menuCirculoClick() {
            acao.atual = acao.CIRCULO;
            escondeMenu("m2");
		}
		function menuTrianguloClick() {
            acao.atual = acao.TRIANGULO;
            escondeMenu("m2");
		}
		function circuloMouseMove(e) {
		    var l = parseInt(regiao.style.left);
		    var t = parseInt(regiao.style.top);
		    regiao.style.width = (e.layerX - l) + "px";
		    regiao.style.height = (e.layerY - t) + "px";
		    return true;
		}
		function attachObserver(element, eventName, func, capturePhase) {
		    if (element.addEventListener) {
		        return element.addEventListener(eventName, func, capturePhase ? true : false);
		    } else {
		        return element.attachEvent("on" + eventName, func);
		    }
		}
		function detachObserver(element, eventName, func, capturePhase) {
		    if (element.removeEventListener)
		    {
		        return element.removeEventListener(eventName, func, capturePhase ? true : false);
		    } else {
		        return element.detachEvent("on" + eventName, func);
		    }
		}
		function onMapClick(e) {
		    acao.atual(e);
		}

// Criar ponto de marcação
        var markerSMPonto;
	    function criarPonto(){
           var markerLocationSM = new L.LatLng(lat, lng);
           markerSMPonto = new L.Marker(markerLocationSM);
           map.addLayer(markerSMPonto);
           markerSMPonto.bindPopup("<input type='text' name='texto' id='marcaTexto' value='insira o texto aqui'/> <br/> <input type='button' name='pontoButton' id='idButton' value='Salvar' onclick='inserirPonto();'/> <input type='button' name='pontoButton' id='editarbotao' value='Editar' onclick='editarPonto();'/>" ).openPopup();  
        }
        
        function inserirPonto(){
            var url = window.location.href; //pega a url atual
            tamanhoURL = url.length;
            for(var d=0; d < tamanhoURL; d++){
                if(url.charAt(d) == '?'){
                    url = url.substr(d+1);
                    d=0;
                }
                if(url.charAt(d) == '&'){
                    url = url.substr(d+1);
                }
            }
            var id_mapa = url.replace("id_mapa=", ""); // pega só o id
            var textoMarcado = document.getElementById('marcaTexto').value;
            Leaflet.WSPrincipal.MarcaPontoPersistencia(lat, lng, textoMarcado, id_mapa, OkPonto, ErroPonto);
            markerSMPonto.bindPopup(textoMarcado);
            map.closePopup(markerSMPonto);
        }
        
        function editarPonto(){
            alert('editar');
        }        

        function OkPonto(e) {
           alert(e.toString());
        }
        function ErroPonto(e) {
            alert(e.toString());
        }
         /**
         * Created by: http://gustavopaes.net
         * Created on: Nov/2009
         *
         * Retorna os valores de parâmetros passados via url.
         *
         * @param String Nome da parâmetro.
         */
        function _GET(name)
        {
          //Para usar, sem segredos. Supondo que você deseje pegar o valor do 
          //parâmetro sessid da url http://gustavopaes.net/?sessid=NHJI89182JAIS:
          var url   = window.location.search.replace("?", "");
          var itens = url.split("&");

          for(n in itens)
          {
            if( itens[n].match(name) )
            {
              return decodeURIComponent(itens[n].replace(name+"=", ""));
            }
          }
          return null;
        }

// Criar Circulo
		function criarCirculo(){
			raio = document.getElementById('raio').value;
			var circleLocation = new L.LatLng(lat,lng),
			circleOptions = {color: '#f03', opacity: 0.7},
			circle = new L.Circle(circleLocation,raio, circleOptions);
		
			circle.bindPopup(texto);
			map.addLayer(circle);
			document.getElementById('raio').disabled=true;
			limpaTexto();
		}

// Criar Triangulo
        var polygon;
		function criarTriangulo(){
			var p1 = new L.LatLng(Tponto1x,Tponto1y),
				p2 = new L.LatLng(Tponto2x,Tponto2y),
				p3 = new L.LatLng(Tponto3x,Tponto3y),
			polygonPoints = [p1, p2, p3];
			polygon = new L.Polygon(polygonPoints);			
			map.addLayer(polygon);
			polygon.bindPopup("<input type='text' name='texto' id='marcaTextoTriangulo' value='insira o texto aqui'/> <br/> <input type='button' name='trianguloNameButton' id='idTriangulo' value='Salvar' onclick='inserirTriangulo();'/> <input type='button' name='triaguloEditButton' id='editarbotao' value='Editar' onclick='editarPonto();'/>").openPopup();
		}

        function inserirTriangulo(){
            var url = window.location.href; //pega a url atual
            tamanhoURL = url.length;
            for(var d=0; d < tamanhoURL; d++){
                if(url.charAt(d) == '?'){
                    url = url.substr(d+1);
                    d=0;
                }
                if(url.charAt(d) == '&'){
                    url = url.substr(d+1);
                }
            }
            var id_mapa = url.replace("id_mapa=", ""); // pega só o id
            var textoMarcado = document.getElementById('marcaTextoTriangulo').value;
            Leaflet.WSPrincipal.MarcaTrianguloPersistencia(Tponto1x, Tponto1y,Tponto2x, Tponto2y,Tponto3x, Tponto2y, textoMarcado, id_mapa, OkPonto, ErroPonto);
            polygon.bindPopup(textoMarcado);
            map.closePopup(polygon);
        }


		function criarVideo(){
			var markerLocationSM = new L.LatLng(lat, lng);
			var markerSM = new L.Marker(markerLocationSM);
			map.addLayer(markerSM);

			video1 = "<object width='200' height='200'> <param name='movie' value='";
			video2 = "'</param> <param name='allowFullScreen' value='true'></param> <embed src='";
			video3 = "'type='application/x-shockwave-flash' allowfullscreen='true'  width='200' height='200'></embed></object>";
			videoBotoes = "\n<button type='button'>Inserir vídeo</button> <button type='button'>Apagar vídeo</button>";
			videoLink = "http://www.youtube.com/v/gD6zhpHT0xM?version=3&amp;hl=pt_BR";
//			videoLink =	"http://www.youtube.com/watch?v=VAFLVQqu1ak&ap=%2526fmt%3D22";

			markerSM.bindPopup(video1+videoLink+video2+videoLink+video3).openPopup();
			video = false;
			limpaTexto();
		}

		function criarImagem(){
			var markerLocationSM = new L.LatLng(lat, lng);
			var markerSM = new L.Marker(markerLocationSM);
			map.addLayer(markerSM);

			imagem1 = "<IMG width='200' heigth='200' SRC='" 
			imagem2 = "'>"
			imagemLink = "http://i0.kym-cdn.com/photos/images/original/000/096/044/trollface.jpg?1296494117";
			markerSM.bindPopup(imagem1+imagemLink+imagem2).openPopup();

			imagem = false;
			limpaTexto();
		}
		
		function limpaPoligno(){
			Tponto1x = 0;
			Tponto1y = 0;
			Tponto2x = 0;
			Tponto2y = 0;
			Tponto3x = 0;
			Tponto3y = 0;
		}

		function limpaTexto(){
			document.getElementById('texto').value='';
		}

// Calculo do raio do Círculo deve ser usado: a teoria do mano Pitágoras para calcular a distância entre 2 pontos.
// Pelo Teorema de Pitágoras temos: “o quadrado da hipotenusa é igual à soma dos quadrados dos catetos”

        function pitagoras() {
            a = document.pythagorean
            b = a.a.value
            c = a.b.value
            c=parseInt(c)
            b=parseInt(b)
            b = b*b
            c = c*c
            d = b+c
            e = Math.sqrt(d)
            document.pythagorean.theorem.value = e
        }
	</script>
</body>
</html>