<%@ Page Title="Usuarios" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Usuarios.aspx.vb" Inherits="HuellaVet.Usuariosaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .animacion {
            transform: scale(1);
            transition: all .2s ease;
        }

            .animacion:hover {
                transform: scale(1.2);
                transition: all .2s ease;
            }
    </style>
    <main>
        <section>
            <div class="container text-center">
                <div class="row">
                    <div class="col">
                        <asp:ImageButton ID="ImgBtnVolver" CssClass="rounded float-start cerrar" runat="server" Style="height: 50px; width: 50px;" ImageUrl="~/IMG/Volver.png" />
                    </div>
                    <div class="col-11">
                        <h1>Administracion de Usuarios.</h1>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <asp:Panel ID="PnlAdminUsuarios" runat="server">
                <div class="container text-center">
                    <div class="row row-cols-2">
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnRegUsuario" runat="server" ImageUrl="~/Img/Botones/anadir-usuario.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblRegUsuario" runat="server" Font-Bold="True" Font-Size="X-Large">Registrar Usuario</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnBusUsuario" runat="server" ImageUrl="~/Img/Botones/buscar-usuario.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblBusUsuario" runat="server" Font-Bold="True" Font-Size="X-Large">Buscar Usuario</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnModUsuario" runat="server" ImageUrl="~/Img/Botones/editar-usuario.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblModUsuario" runat="server" Font-Bold="True" Font-Size="X-Large">Modificar Empleado</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </section>
    </main>
    <asp:Panel ID="PaneelNuevoUsuario" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Registrar un Usuario</u></h3>
            <br />
        </div>
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <asp:Label ID="LblsubirEmpleadoID" runat="server" Text="Seleccion del empleado"></asp:Label>
                        <asp:DropDownList ID="DdlSubirEmpleadoID" CssClass="form-select" ToolTip="selecccione un empleado" runat="server" DataSourceID="DS_SubirIDEmpleado" DataTextField="N_Nombre" DataValueField="Nid_Empleado"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirIDEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_Empleados]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <asp:Label ID="LblSubirUsuario" runat="server" Text="Nombre de usuario"></asp:Label>
                        <asp:TextBox ID="TxtSubirUsuario" runat="server" CssClass="form-control" ToolTip="nombre de usuario" placeholder="Ingrese un nombre de usuario"></asp:TextBox>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <asp:Label ID="LblSubirPassword" runat="server" Text="Contraseña"></asp:Label>
                        <asp:TextBox ID="TxtSubirPassword" runat="server" CssClass="form-control" ToolTip="Contraseña de seguridad" placeholder="Ingrese una contraseña" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <asp:Label ID="LblSubirRol" runat="server" Text="Seleccione los persmisos del usuarios"></asp:Label>
                        <asp:DropDownList ID="DdlSubirRol" CssClass="form-select" ToolTip="Seleccione uno" runat="server" DataSourceID="DS_SubirRolUsuario" DataTextField="N_Rol" DataValueField="Nid_Rol"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirRolUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Roles]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <br />
                    <asp:Button ID="BtnCancelarNuevoUser" runat="server" class="btn btn-primary animacion" Text="cancelar" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnSubirNuevoUser" runat="server" class="btn btn-success animacion" Text="Registrar" />
                    <asp:SqlDataSource ID="DS_RegistrarUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" InsertCommand="INSERT INTO Tb_Usuarios(ID_Empleado, N_Usuario, N_Password, ID_Rol, N_FechaRegistro) VALUES (@empleado, @user , @pass, @rol, GETDATE())" SelectCommand="SELECT * FROM [Tb_Usuarios]">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="DdlSubirEmpleadoID" Name="empleado" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtSubirUsuario" Name="user" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtSubirPassword" Name="pass" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DdlSubirRol" Name="rol" PropertyName="SelectedValue" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <!-- apartado de consultar un empleado -->
    <asp:Panel ID="PanelConsultarUsuarios" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Consultar Usuarios</u></h3>
            <br />
        </div>
        <div class="container text-center table-responsive">
            <asp:TextBox ID="TxtBuscarPorNombre" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtBuscarPorNombre_TextChanged" placeholder="Buscar por nombre..."></asp:TextBox>
            <asp:Button ID="BtnBuscarPorNombre" runat="server" CssClass="btn btn-primary" Text="Ver todos los registros" OnClick="BtnBuscarPorNombre_Click" />
            <br />
            <asp:SqlDataSource ID="DS_ConsultarUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_Usuarios.Nid_Usuario, Tb_Usuarios.ID_Empleado, Tb_Empleados.N_Nombre, Tb_Empleados.N_ApellidoPa, Tb_Empleados.N_ApellidoMa, Tb_Usuarios.N_Usuario, Tb_Usuarios.N_Password, Tb_Usuarios.ID_Rol, Cat_Roles.N_Rol, Tb_Usuarios.N_FechaRegistro, Tb_Usuarios.N_FechaLogin FROM Tb_Usuarios INNER JOIN Tb_Empleados ON Tb_Usuarios.ID_Empleado = Tb_Empleados.Nid_Empleado INNER JOIN Cat_Roles ON Tb_Usuarios.ID_Rol = Cat_Roles.Nid_Rol"></asp:SqlDataSource>
            <asp:GridView ID="GVConsultarEmpleado" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Nid_Usuario" DataSourceID="DS_ConsultarUsuarios" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Nid_Usuario" HeaderText="No. de usuario" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Usuario" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_ApellidoPa" HeaderText="Apellido Paterno" SortExpression="N_ApellidoPa" />
                    <asp:BoundField DataField="N_ApellidoMa" HeaderText="Apellido Materno" SortExpression="N_ApellidoMa" />
                    <asp:BoundField DataField="N_Usuario" HeaderText="Nombre de Usuario" SortExpression="N_Usuario" />
                    <asp:BoundField DataField="N_Rol" HeaderText="Puesto" SortExpression="N_Rol" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de Registro" SortExpression="N_FechaRegistro" />
                    <asp:BoundField DataField="N_FechaLogin" HeaderText="Ultimo inicio de sesion" SortExpression="N_FechaLogin" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </div>
        <div class="text-center">
            <br />
            <asp:Button ID="BtnCerrarConlta" class="btn btn-primary animacion" runat="server" Text="Cerrar" />
        </div>
    </asp:Panel>
    <!-- apartado de update -->
    <asp:Panel ID="PanelEditarUsuario" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Actualizar Usuarios</u></h3>
            <br />
        </div>
        <div class="container text-center table-responsive">
            <asp:SqlDataSource ID="DS_EditarUsuariosGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_Usuarios.Nid_Usuario, Tb_Usuarios.ID_Empleado, Tb_Empleados.N_Nombre, Tb_Empleados.N_ApellidoPa, Tb_Empleados.N_ApellidoMa, Tb_Usuarios.N_Usuario, Tb_Usuarios.N_Password, Tb_Usuarios.ID_Rol, Cat_Roles.N_Rol, Tb_Usuarios.N_FechaRegistro, Tb_Usuarios.N_FechaLogin FROM Tb_Usuarios INNER JOIN Cat_Roles ON Tb_Usuarios.ID_Rol = Cat_Roles.Nid_Rol INNER JOIN Tb_Empleados ON Tb_Usuarios.ID_Empleado = Tb_Empleados.Nid_Empleado"></asp:SqlDataSource>
            <asp:GridView ID="GVModUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Nid_Usuario" DataSourceID="DS_EditarUsuariosGV" Width="100%">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Nid_Usuario" HeaderText="No. de Usuario" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Usuario" />
                    <asp:BoundField DataField="ID_Empleado" HeaderText="No. de empleado" SortExpression="ID_Empleado" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_ApellidoPa" HeaderText="Apellido paterno" SortExpression="N_ApellidoPa" />
                    <asp:BoundField DataField="N_ApellidoMa" HeaderText="Apellido materno" SortExpression="N_ApellidoMa" />
                    <asp:BoundField DataField="N_Usuario" HeaderText="Nombre de usuario" SortExpression="N_Usuario" />
                    <asp:BoundField DataField="N_Rol" HeaderText="Puesto" SortExpression="N_Rol" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="DS_EditarUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_Usuarios] WHERE ([Nid_Usuario] = @Nid_Usuario)" UpdateCommand="UPDATE Tb_Usuarios SET ID_Empleado = @empl, N_Usuario = @user , N_Password = @pass, ID_Rol = @rol WHERE (Nid_Usuario = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="Nid_Usuario" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="DdlModificarEmpleadoUsuario" Name="empl" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModificarNombreUsuario" Name="user" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtModificarPasswordUsuario" Name="pass" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlModificarCargoUsuario" Name="rol" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModificarNumeroUsuario" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="text-center">
            <br />
            <asp:Button ID="BtnCerrarModificacion" runat="server" class="btn btn-primary animacion" Text="Cerrar" />
        </div>
        <asp:Panel ID="PanelFormditarUsuario" runat="server" Visible="false">
            <div class="row">
                <div class="col">
                    <asp:Label ID="Aux" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <div class="col-md-8 offset-md-5">
                    <div class="form-group">
                        <asp:Label ID="LblModificarNumeroUsuario" runat="server" Text="Numero de usuario"></asp:Label>
                        <asp:TextBox ID="TxtModificarNumeroUsuario" CssClass="form-control" runat="server" Enabled="False" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarEmpleadoUsuario" runat="server" Text="Empleado"></asp:Label>
                        <asp:DropDownList ID="DdlModificarEmpleadoUsuario" CssClass="form-select" runat="server" DataSourceID="DS_ModificarEmpleadoUsuario" DataTextField="N_Coreo" DataValueField="Nid_Empleado"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_ModificarEmpleadoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT [Nid_Empleado], [N_Coreo] FROM [Tb_Empleados]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarNombreUsuario" runat="server" Text="Nombre de usuario"></asp:Label>
                        <asp:TextBox ID="TxtModificarNombreUsuario" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarPasswordUsuario" runat="server" Text="Contraseña"></asp:Label>
                        <asp:TextBox ID="TxtModificarPasswordUsuario" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarCargoUsuario" runat="server" Text="Puesto"></asp:Label>
                        <asp:DropDownList ID="DdlModificarCargoUsuario" CssClass="form-select" runat="server" DataSourceID="DS_ModificarCargoUsuario" DataTextField="N_Rol" DataValueField="Nid_Rol"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_ModificarCargoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Roles]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarFechaRegUsuario" runat="server" Text="Fecha de registro"></asp:Label>
                        <asp:TextBox ID="TxtModificarFechaRegUsuario" CssClass="form-control" runat="server" Enabled="False" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-md-8 offset-md-5">
                <div class="form-group">
                    <br />
                    <asp:Button ID="BtnCerrarModUsuario" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnActualizarUsuario" runat="server" CssClass="animacion btn btn-success" Text="Actualziar registro" />
                    <br />
                </div>
            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
