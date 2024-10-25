<%@ Page Title="Empleados" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Empleados.aspx.vb" Inherits="HuellaVet.Empleados" %>

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
                        <h1>Administracion de Empleados.</h1>
                    </div>
                </div>
            </div>
            <hr />
        </section>
        <section>
            <asp:Panel ID="PanelControl" runat="server" Visible="True">
                <div class="container text-center">
                    <div class="row row-cols-2">
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="BtnRegistrarEmpleado" runat="server" ImageUrl="~/Img/Botones/registroEmpelado.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblRegEmpleado" runat="server" Font-Bold="True" Font-Size="X-Large">Registrar Empelado</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="BtnBuscarEmpleado" runat="server" ImageUrl="~/Img/Botones/BuscarEmpleados.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblBusEmpleado" runat="server" Font-Bold="True" Font-Size="X-Large">Busccar Empelado</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="BtnEditarEmpleado" runat="server" Style="height: 125px; width: 125px;" CssClass="animacion" ImageUrl="~/Img/Botones/editarEmpleados.png" />
                            <div class="col">
                                <asp:Label ID="LblModEmpleado" runat="server" Font-Bold="True" Font-Size="X-Large">Editar Empelado</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </section>
    </main>
    <asp:Panel ID="PanelSubirEmpelado" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Registrar un empleado</u></h3>
            <br />
        </div>
        <div class="container text-center">
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="LblRegNomEmpl" runat="server" Text="Nombre(s)"></asp:Label>
                    <asp:TextBox ID="TxtRegNomEmpl" runat="server" placeholder="Nombre(s)" ToolTip="Solo primer(os) nombres" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="LblRegAppEmpl" runat="server" Text="Apellido paterno"></asp:Label>
                    <asp:TextBox ID="TxtRegAppEmpl" runat="server" placeholder="Apellido paterno" ToolTip="Solo apellido paterno" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="LblRegApmEmpl" runat="server" Text="Apellido Materno"></asp:Label>
                    <asp:TextBox ID="TxtRegApmEmpl" runat="server" placeholder="Apellido materno" ToolTip="Solo apellido materno" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="LblRegPuestoEmpl" runat="server" Text="Puesto del empleado"></asp:Label>
                    <asp:DropDownList ID="DdlRegPuestoEmpl" runat="server" CssClass="form-select" DataSourceID="DS_RegPuesto" DataTextField="N_Rol" DataValueField="Nid_Rol"></asp:DropDownList>
                    <asp:SqlDataSource ID="DS_RegPuesto" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Roles]"></asp:SqlDataSource>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="LblRegTelEmpl" runat="server" Text="Teléfono"></asp:Label>
                    <asp:TextBox ID="TxtRegTelEmpl" runat="server" placeholder="(xxx) xxx-xx-xx" ToolTip="Número telefónico a 10 dígitos" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="LblRegMailEmpl" runat="server" Text="Correo"></asp:Label>
                    <asp:TextBox ID="TxtRegMailEmpl" runat="server" placeholder="Ejemplo@gmail.com" ToolTip="Correo electrónico del empleado" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="BtnCanRegEmpelado" runat="server" class="btn btn-primary animacion" Text="cancelar" />
                    &nbsp;&nbsp;&nbsp;
                       <asp:Button ID="BtnRegEmpleado" runat="server" class="btn btn-success animacion" Text="Registrar" />
                    <asp:SqlDataSource ID="DS_SubirEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" InsertCommand="INSERT INTO Tb_Empleados(N_Nombre, N_ApellidoPa, N_ApellidoMa, ID_Cargo, N_Telefono, N_Coreo, ID_Estado, N_FechaRegistro) VALUES (@nom, @app, @apm, @cargo, @tel, @mail, @estado, GETDATE())" SelectCommand="SELECT * FROM [Tb_Empleados]">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TxtRegNomEmpl" Name="nom" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtRegAppEmpl" Name="app" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtRegApmEmpl" Name="apm" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DdlRegPuestoEmpl" Name="cargo" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtRegTelEmpl" Name="tel" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtRegMailEmpl" Name="mail" PropertyName="Text" />
                            <asp:Parameter DefaultValue="1" Name="estado" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelConsultarEmpleado" runat="server" Visible="false">
        <div class="container text-center table-responsive">
            <h3><u>Buscar un empleado</u></h3>
            <br />
            <asp:TextBox ID="TxtBuscarPorNombre" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtBuscarPorNombre_TextChanged" placeholder="Buscar por nombre..."></asp:TextBox>
            <asp:Button ID="BtnBuscarPorNombre" runat="server" CssClass="btn btn-primary" Text="Ver todos los registros" OnClick="BtnBuscarPorNombre_Click" />
            <asp:SqlDataSource ID="DS_ConsultarEmpleadosGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_Empleados.Nid_Empleado, Tb_Empleados.N_Nombre, Tb_Empleados.N_ApellidoPa, Tb_Empleados.N_ApellidoMa, Tb_Empleados.ID_Cargo, Cat_Roles.N_Rol, Tb_Empleados.N_Telefono, Tb_Empleados.N_Coreo, Tb_Empleados.ID_Estado, Cat_EstadoUsuario.N_Estado, Tb_Empleados.N_FechaRegistro FROM Tb_Empleados INNER JOIN Cat_EstadoUsuario ON Tb_Empleados.ID_Estado = Cat_EstadoUsuario.Nid_Estado INNER JOIN Cat_Roles ON Tb_Empleados.ID_Cargo = Cat_Roles.Nid_Rol"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Nid_Empleado" DataSourceID="DS_ConsultarEmpleadosGV" AllowPaging="True" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Nid_Empleado" HeaderText="No. Empleado" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Empleado" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_ApellidoPa" HeaderText="Apellido Paterno" SortExpression="N_ApellidoPa" />
                    <asp:BoundField DataField="N_ApellidoMa" HeaderText="Apellido Materno" SortExpression="N_ApellidoMa" />
                    <asp:BoundField DataField="N_Rol" HeaderText="Puesto" SortExpression="N_Rol" />
                    <asp:BoundField DataField="N_Telefono" HeaderText="Telefono" SortExpression="N_Telefono" />
                    <asp:BoundField DataField="N_Coreo" HeaderText="Correo" SortExpression="N_Coreo" />
                    <asp:BoundField DataField="N_Estado" HeaderText="Estado del usuario" SortExpression="N_Estado" />
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
            <br />
        </div>
        <div class="text-center">
            <asp:Button ID="BtnCanRegEmpelado0" runat="server" class="btn btn-primary animacion" Text="cancelar" />
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelActualizarEmpleados" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Actualizar datos de un empleado</u></h3>
            <br />
        </div>
        <div class="container text-center table-responsive">
            <asp:SqlDataSource ID="DS_ModificarEmpleadoGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_Empleados.Nid_Empleado, Tb_Empleados.N_Nombre, Tb_Empleados.N_ApellidoPa, Tb_Empleados.N_ApellidoMa, Tb_Empleados.ID_Cargo, Cat_Roles.N_Rol, Cat_Roles.N_Descripcion, Tb_Empleados.N_Telefono, Tb_Empleados.N_Coreo, Tb_Empleados.ID_Estado, Cat_EstadoUsuario.N_Estado, Tb_Empleados.N_FechaRegistro FROM Tb_Empleados INNER JOIN Cat_EstadoUsuario ON Tb_Empleados.ID_Estado = Cat_EstadoUsuario.Nid_Estado INNER JOIN Cat_Roles ON Tb_Empleados.ID_Cargo = Cat_Roles.Nid_Rol"></asp:SqlDataSource>
            <asp:GridView ID="GVModEmpleados" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Nid_Empleado" DataSourceID="DS_ModificarEmpleadoGV" Width="100%" CssClass="text-center ">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Nid_Empleado" HeaderText="No.Empleado" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Empleado" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_ApellidoPa" HeaderText="Apellido Paterno" SortExpression="N_ApellidoPa" />
                    <asp:BoundField DataField="N_ApellidoMa" HeaderText="Apellido Materno" SortExpression="N_ApellidoMa" />
                    <asp:BoundField DataField="N_Rol" HeaderText="Puesto de trabajo" SortExpression="N_Rol" />
                    <asp:BoundField DataField="N_Descripcion" HeaderText="Descripcion" SortExpression="N_Descripcion" />
                    <asp:BoundField DataField="N_Telefono" HeaderText="Telefono" SortExpression="N_Telefono" />
                    <asp:BoundField DataField="N_Coreo" HeaderText="Correo electronico" SortExpression="N_Coreo" />
                    <asp:BoundField DataField="N_Estado" HeaderText="Estado del usuario" SortExpression="N_Estado" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de Registro" SortExpression="N_FechaRegistro" />
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
            <asp:SqlDataSource ID="DS_ModificarEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_Empleados] WHERE ([Nid_Empleado] = @Nid_Empleado)" UpdateCommand="UPDATE Tb_Empleados SET N_Nombre = @nom, N_ApellidoPa = @app, N_ApellidoMa = @apm, ID_Cargo = @car, N_Telefono = @tel, N_Coreo = @mail, ID_Estado = @est WHERE (Nid_Empleado = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="Nid_Empleado" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TxtModificarNombreEmpleado" Name="nom" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtModificarApellidoPaEmpleado" Name="app" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtModificarApellidoMaEmpleado" Name="apm" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlModificarPuestoEmpleado" Name="car" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModificarTelefonoEmpleado" Name="tel" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtModificarCorreoEmpleado" Name="mail" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlModificarEstadoEmpleado" Name="est" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModificarNumeroEmpleado" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div class="text-center">
            <asp:Button ID="BtnCerrarModificacion" runat="server" class="btn btn-primary animacion" Text="Cerrar" />
        </div>
        <asp:Panel ID="PanelFromEditarEmpleado" runat="server" Visible="false">
            <div class="row">
                <div class="col">
                    <asp:Label ID="Aux" runat="server" Text="" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="col-md-8 offset-md-5">
                <div class="form-group">
                    <asp:Label ID="LblModificarNumeroEmpleado" runat="server" Text="Numero de empleado"></asp:Label>
                    <asp:TextBox ID="TxtModificarNumeroEmpleado" runat="server" CssClass="form-control" Enabled="False" TextMode="Number"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarNombreEmpleado" runat="server" Text="Nombre del empleado"></asp:Label>
                    <asp:TextBox ID="TxtModificarNombreEmpleado" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarApellidoPaEmpleado" runat="server" Text="Apellido Paterno"></asp:Label>
                    <asp:TextBox ID="TxtModificarApellidoPaEmpleado" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarApellidoMaEmpleado" runat="server" Text="Apellido Materno"></asp:Label>
                    <asp:TextBox ID="TxtModificarApellidoMaEmpleado" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarPuestoEmpleado" runat="server" Text="Puesto de trabajo"></asp:Label>
                    <asp:DropDownList ID="DdlModificarPuestoEmpleado" CssClass="form-select" runat="server" DataSourceID="DS_ModificarPuestoEmpleado" DataTextField="N_Rol" DataValueField="Nid_Rol"></asp:DropDownList>
                    <asp:SqlDataSource ID="DS_ModificarPuestoEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Roles]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarTelefonoEmpleado" runat="server" Text="Telefono de contacto"></asp:Label>
                    <asp:TextBox ID="TxtModificarTelefonoEmpleado" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarCorreoEmpleado" runat="server" Text="Correo del empleado"></asp:Label>
                    <asp:TextBox ID="TxtModificarCorreoEmpleado" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarEstadoEmpleado" runat="server" Text="Estado del empleado"></asp:Label>
                    <asp:DropDownList ID="DdlModificarEstadoEmpleado" CssClass="form-select" runat="server" DataSourceID="DS_ModificarEstadoEmpleado" DataTextField="N_Estado" DataValueField="Nid_Estado"></asp:DropDownList>
                    <asp:SqlDataSource ID="DS_ModificarEstadoEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_EstadoUsuario]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblModificarFechaRegEmpleado" runat="server" Text="Fecha de registro"></asp:Label>
                    <asp:TextBox ID="TxtModificarFechaRegEmpleado" CssClass="form-control" runat="server" Enabled="False" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-8 offset-md-5">
                <div class="form-group">
                    <br />
                    <asp:Button ID="BtnCerrarModMascota" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnActualizarMascota" runat="server" CssClass="animacion btn btn-success" Text="Actualziar registro" />
                    <br />
                </div>
            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
