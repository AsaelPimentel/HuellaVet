<%@ Page Title="Iniciar Sesión" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.vb" Inherits="HuellaVet.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container ">
        <div class="row row-cols-2">
            <div class="col">
                <!-- Imagen en la primera columna -->
                <img src="Img/FormularioPropietario.jpg" alt="Imagen de inicio de sesión" width="100%" />
            </div>
            <div class="col">
                <!-- Formulario de inicio de sesión en la segunda columna -->
                <h2 class="text-center">Iniciar Sesión</h2>
                <div class="form-group text-left">
                    <!-- Utilizamos text-left para alinear las etiquetas a la izquierda -->
                    <asp:Label ID="lblNombre" runat="server" AssociatedControlID="txtNombre" CssClass="control-label">Nombre:</asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                </div>
                <div class="form-group text-left">
                    <!-- Utilizamos text-left para alinear las etiquetas a la izquierda -->
                    <asp:Label ID="lblCorreo" runat="server" AssociatedControlID="txtCorreo" CssClass="control-label">Correo:</asp:Label>
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" placeholder="Correo"></asp:TextBox>
                </div>
                <div class="form-group text-left">
                    <!-- Utilizamos text-left para alinear las etiquetas a la izquierda -->
                    <asp:Label ID="lblContrasena" runat="server" AssociatedControlID="txtContrasena" CssClass="control-label">Contraseña:</asp:Label>
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
                </div>
                <br />
                <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" CssClass="btn btn-primary" />
                <asp:SqlDataSource ID="DS_LoginUser" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_Propietario] WHERE (([N_Nombre] = @N_Nombre) AND ([N_Coreo] = @N_Coreo) AND ([N_Password] = @N_Password))" InsertCommand="INSERT INTO Tb_Propietario(N_Nombre, N_ApellidoPa, N_ApellidoMa, N_Direccion, N_Telefono, N_Coreo, N_Password, N_FechaRegistro) VALUES (@nom, @app, @apm, @dir, @tel, @mail, @pass, GETDATE())">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtRegNombre" Name="nom" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRegApellidoPaterno" Name="app" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRegApellidoMaterno" Name="apm" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRegDireccion" Name="dir" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRegTelefono" Name="tel" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRegCorreo" Name="mail" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtRegContrasena" Name="pass" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtNombre" Name="N_Nombre" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtCorreo" Name="N_Coreo" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtContrasena" Name="N_Password" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <p>No tienes una cuenta <a href="#" onclick="mostrarModal();">Crea una</a></p>
            </div>
        </div>
    </div>



    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Contenido del modal -->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Crear una cuenta</h4>
                    <button type="button" class="close" data-dismiss="modal" onclick="cerrarModal();">&times;</button>
                </div>
                <div class="modal-body">
                    <!-- Agrega aquí el contenido del formulario de creación de cuenta -->
                    <div class="form-group">
                        <label associatedcontrolid="txtRegNombre">Nombre:</label>
                        <asp:TextBox ID="txtRegNombre" runat="server" CssClass="form-control" placeholder="Nombre" />
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label associatedcontrolid="txtRegApellidoPaterno">Apellido Paterno:</label>
                                <asp:TextBox ID="txtRegApellidoPaterno" runat="server" CssClass="form-control" placeholder="Apellido Paterno" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label associatedcontrolid="txtRegApellidoMaterno">Apellido Materno:</label>
                                <asp:TextBox ID="txtRegApellidoMaterno" runat="server" CssClass="form-control" placeholder="Apellido Materno" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label associatedcontrolid="txtRegDireccion">Dirección:</label>
                                <asp:TextBox ID="txtRegDireccion" runat="server" CssClass="form-control" placeholder="Dirección" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label associatedcontrolid="txtRegTelefono">Teléfono:</label>
                                <asp:TextBox ID="txtRegTelefono" runat="server" CssClass="form-control" placeholder="Teléfono" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label associatedcontrolid="txtRegCorreo">Correo:</label>
                                <asp:TextBox ID="txtRegCorreo" runat="server" CssClass="form-control" placeholder="Correo" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label associatedcontrolid="txtRegContrasena">Contraseña:</label>
                                <asp:TextBox ID="txtRegContrasena" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cerrarModal();">Cerrar</button>
                        <asp:Button ID="BtnCrearCuenta" runat="server" Text="Crear" class="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>

        <script>
            function mostrarModal() {
                $('#myModal').modal('show');
            }

            function cerrarModal() {
                $('#myModal').modal('hide');
            }

            // Asignar la función cerrarModal al botón "Cerrar" del modal footer
            $('#myModal .modal-footer button.btn-secondary').on('click', cerrarModal);

            // Asignar la función cerrarModal al botón "&times;" en la esquina superior derecha del modal
            $('#myModal .modal-header .close').on('click', cerrarModal);

            function crearCuenta() {
                var ds = document.getElementById('<%= DS_LoginUser.ClientID %>');
                if (ds) {
                    ds.control._doInsert(function (result) {
                        if (result) {
                            alert('La cuenta se creó de forma correcta.');
                            setTimeout(function () {
                                cerrarModal();
                            }, 1000); // Espera 1 segundo antes de cerrar el modal
                        } else {
                            alert('Ocurrió un error al crear la cuenta.');
                        }
                    });
                }
            }

        </script>

    </div>
</asp:Content>
