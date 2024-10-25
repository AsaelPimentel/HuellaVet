<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="HuellaVet.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>HuellaVet | Iniciar Sesión</title>
    <!-- Boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" />
    <!-- hojas de estilos -->
    <link href="../Css/Estilos.css" rel="stylesheet" />
    <!-- Archivos scripts-->
    <script src="../Js/Funciones.js"></script>
</head>
<body>
    <!-- formualrio de inicio de sesion -->
    <form id="LoginForm" runat="server">
        <div class="container">
            <div class="login-card">
                <h3 class="login-title">Iniciar Sesión</h3>
                <img src="../img/icono.png" class="centered-image img-fluid mb-4" alt="Imagen Extra" style="max-height: 200px; max-width: 100%;" />
                <div class="form-group">
                    <label for="txtUsername"><i class="fas fa-user"></i>Usuario</label>
                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Ingresa tu usuario"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPassword"><i class="fas fa-lock"></i>Contraseña</label>
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Ingresa tu contraseña"></asp:TextBox>
                </div>
                <br />
                <div class="form-group text-center">
                    <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" runat="server" Text="Iniciar Sesión" />
                </div>
            </div>
        </div>
        <!-- Modal de alerta -->
        <div class="modal-container" id="customModal">
            <div class="modal-content">
                <img src="../img/GIFS/alerta.gif" width="100px" height="75px" />
                <h2>¡Alerta!</h2>
                <p id="modalMessage"></p>
                <button class="modal-button" onclick="closeModal()">Aceptar</button>
            </div>
        </div>
    </form>
    <!-- enlace a la base de datos para validar el formulario -->
    <asp:SqlDataSource ID="DS_Login" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_Usuarios] WHERE (([N_Usuario] = @N_Usuario) AND ([N_Password] = @N_Password))" UpdateCommand="UPDATE Tb_Usuarios SET N_FechaLogin = GETDATE() WHERE (N_Usuario = @USR)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUsername" Name="N_Usuario" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="N_Password" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtUsername" Name="USR" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!-- Footer -->
    <div class="footer">
        <p>
            <img src="../img/Dolphin_System.png" height="50px" width="50px" />
            &copy; <%= DateTime.Now.Year %> - HuellaVet by Dolphin System
        </p>
    </div>
    <!-- JQery y Bootstrap js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script src="../Js/Funciones.js"></script>
</body>
</html>
