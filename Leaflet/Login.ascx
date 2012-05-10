<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="Leaflet.Login" %>

<link href="main.css" rel="stylesheet" type="text/css" />

<!-- dd menu -->
<script type="text/javascript">
//<![CDATA[
var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}
// close layer when click-out
document.onclick = mclose; 
//]]>
</script>
<div style="text-align: right;">

<table style="float: left; text-align:center">
    <%if (!logado)
      { %>  
        <tr style="text-align: center; width: 400pt">
            <td style=" text-align:center ;font-weight: bold; color: #FFFFFF;">
            <asp:Image  ID="logo" runat="server" ImageUrl="Images/logofinal.png" ImageAlign="Right" />
            </td>
        </tr>
  
  <%}else
      {%>
      <tr>
        <td style="font-weight: bold; color: #FFFFFF;">
        <label for="textfield">Buscar Endereço:</label> <input type="text" name="textfield" id="textfield" style="width: 65%;" />
                  <input id="Button2" type="button" value="Buscar" /></td>
  </tr>
      <tr>
        <td><table style="border-color: #A6CAF0; border-bottom-style: solid;">
          <tr>
            <td><ul id="sddm">
              <li onmouseover="mostraMenu('m1');" onmouseout="escondeMenu('m1');"><img src="images/marcador.png" alt="" width="48" height="48" />
                <div id="m1">
                <span onclick="menuPontoClick();">Inserir Marcador</span>
                </div>
              </li>
              <li onmouseover="mostraMenu('m2');" onmouseout="escondeMenu('m2');"><img src="images/formas.png" alt="" width="48" height="48" />
                <div id="m2">
                <span onclick="menuCirculoClick();">Desenhar Círculo</span>
                <span>Desenhar Retângulo</span>
                <span onclick="menuTrianguloClick();">Desenhar Triângulo</span>
                </div>
              </li>
              <li onmouseover="document.getElementById('m3').style.display='block';" onmouseout="document.getElementById('m3').style.display='none';"><img src="images/foto.png" alt="" width="48" height="48" />
                <div id="m3">
                <span>Inserir Foto</span>
                </div>
              </li>
              <li onmouseover="document.getElementById('m4').style.display='block';" onmouseout="document.getElementById('m4').style.display='none';"><img src="images/audio.png" alt="" width="48" height="48" />
                <div id="m4">
                <span>Inserir Áudio</span>
                </div>
              </li>
              <li onmouseover="document.getElementById('m5').style.display='block';" onmouseout="document.getElementById('m5').style.display='none';"><img src="images/video.png" alt="" width="48" height="48" />
                <div id="m5">
                <span>Inserir Vídeo</span>
                </div>
              </li>
              <li onmouseover="document.getElementById('m6').style.display='block';" onmouseout="document.getElementById('m6').style.display='none';"><img src="images/gravador.png" alt="" width="48" height="48" />
                <div id="m6">
                <span>Inserir Gravação</span>
                </div>
              </li>
              <li onmouseover="document.getElementById('m7').style.display='block';" onmouseout="document.getElementById('m7').style.display='none';"><img src="images/salvar.gif" alt="" width="48" height="48" />
                <div id="m7">
                <span>Salvar Mapa</span>
                </div>
              </li>
            </ul></td>
          </tr>          
        </table></td>
      </tr>
      <%} %>
      </table>

<table style="display: inline-table; background-color: #EAECFF;">
    <%if (!logado)
      { %>
    <tr>
        <td colspan="2" style="text-align: center;">
            Área de Login
        </td>
    </tr>
    <tr>
        <td style="text-align: right;">
            E-mail:
        </td>
        <td>
            <asp:TextBox ID="txtEmailLogin" runat="server" Width="160pt" BorderColor="#999999"
                BorderWidth="1px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: right;">
            Senha:
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtSenhaLogin" TextMode="Password" Width="160pt"
                BorderColor="#999999" BorderWidth="1px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: right;">
            <asp:Button runat="server" ID="btnEntrar" Text="Entrar" OnClick="btnEntrar_Click"/>
        </td>
    </tr>
    <% } %>
    <tr>
        <td colspan="2" style="text-align: right;">
            <asp:Label ID="lblMsgLogin" runat="server"></asp:Label>
        </td>
    </tr>
    <%if (logado)
      { %>
    <tr>
        <td colspan="2" style="text-align: right;">
            <asp:Label ID="lblLog" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: right;">
            <a href="#"><span class="textoPequeno">Alterar Cadastro</span></a><span class="textoPequeno">&nbsp;|&nbsp;
            </span><a href="sair.aspx"><span class="textoPequeno">Sair</span></a> <span class="textoPequeno">
                <% lblMsgLogin.Text = ""; %></span>
        </td>
    </tr>
    
    <tr>
    <td colspan="2">
     
         <asp:Label ID="Label1" runat="server" Text="Mapas"></asp:Label>
         <asp:DropDownList ID="ddlMapas" runat="server">
            <asp:ListItem>Selecionar Mapas</asp:ListItem>
         </asp:DropDownList>
         <asp:Button ID="abrirMapa" runat="server" text="Abrir" OnClick="abrirMapaSelecionado"  />
         
          <br />
        <input type="button" value="Criar novo mapa" onclick="javascript:mostraEscondedorMapa();" />
        
        <br />
        <asp:Label ID="AlertaMapa" runat="server"></asp:Label>
        </td>
    </tr>
    <% }
      else
      { %>
    <tr>
        <td colspan="2" style="text-align: right;">
            <a href="#" class="textoPequeno">Esqueci minha senha</a>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: right;">
            <a href="#" onclick="javascript:mostraEscondedor();" class="textoPequeno">Não sou cadastrado</a>
        </td>
    </tr>
    <% } %>
</table>

</div>
