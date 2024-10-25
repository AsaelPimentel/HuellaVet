<%@ Page Title="Mascotas" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Mascotas.aspx.vb" Inherits="HuellaVet.Mascotas" %>

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
                        <h1>Administracion de Masctoas.</h1>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <asp:Panel ID="PnlAdminMascota" runat="server">
                <div class="container text-center">
                    <div class="row row-cols-2">
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnSubirMascota" runat="server" ImageUrl="~/Img/Botones/AgregarMascota.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblImgBtnSubirMascota" runat="server" Font-Bold="True" Font-Size="X-Large">Registrar Mascota</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnConsultarMascota" runat="server" ImageUrl="~/Img/Botones/ConsultarMascota.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblImgBtnConsultarMascota" runat="server" Font-Bold="True" Font-Size="X-Large">Buscar Mascotas</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnEditarMascota" runat="server" ImageUrl="~/Img/Botones/EditarMascota.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblImgBtnEditarMascota" runat="server" Font-Bold="True" Font-Size="X-Large">Editar Registro</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </section>
    </main>
    <asp:Panel ID="PanelSubirMascota" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Registrar mascota</u></h3>
            <br />
        </div>
        <div class="contarner">
            <div class="row">
                <div class=" col-md-6 offset-md-5">
                    <div class="form-group">
                        <asp:Label ID="LblSubirNombreMascotas" runat="server" Text="Nombre de la mascota:"></asp:Label>
                        <asp:TextBox ID="TxtSubirNombreMascota" placeholder="Ingrese el nombre de la mascota" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirEspecieMascota" runat="server" Text="Especie"></asp:Label>
                        <asp:DropDownList ID="DdlSubirEspecieMascota" CssClass="form-select" runat="server" DataSourceID="DS_SubirEspeciMascota" DataTextField="N_Especie" DataValueField="Nid_Especie"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirEspeciMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Especies]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirRazaMascota" runat="server" Text="Raza"></asp:Label>
                        <asp:DropDownList ID="DdlSubirRazaMascota" CssClass="form-select" runat="server" DataSourceID="DS_SubirRazaMascota" DataTextField="N_Raza" DataValueField="Nid_Raza"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirRazaMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Razas]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirEdadMascota" runat="server" Text="Edad de la mascota"></asp:Label>
                        <asp:TextBox ID="TxtSubirEdadMascota" runat="server" CssClass="form-control" placeholder="ingrese la edad de la mascota" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirAlergiaMascota" runat="server" Text="Alergias"></asp:Label>
                        <asp:DropDownList ID="DdlSubirAlergiaMascota" CssClass="form-select" runat="server" DataSourceID="DS_SubirAlergiaMascota" DataTextField="N_Aelrgia" DataValueField="Nid_Alergia"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirAlergiaMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Alergias]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirPropietarioMascota" runat="server" Text="Dueño de la masscota"></asp:Label>
                        <asp:DropDownList ID="DdlSubirPropietarioMascota" CssClass="form-select" runat="server" DataSourceID="DS_SubirPropietarioMascota" DataTextField="N_Coreo" DataValueField="Nid_Propietario"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirPropietarioMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_Propietario]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="text-center">
                    <br />
                    <asp:Button ID="BtnCancelarSubirMascota" runat="server" class="btn btn-primary animacion" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnSubirNuevaMascota" runat="server" class="btn btn-success animacion" Text="Registrar" />
                    <asp:SqlDataSource ID="DS_SubirMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" InsertCommand="INSERT INTO Tb_Mascotas(N_Nombre, ID_Especie, ID_Raza, N_Edad, ID_Alergias, ID_Propietario, N_FechaRegistro) VALUES (@nom, @esp, @raza, @edad, @alergia, @prestamo, GETDATE())" SelectCommand="SELECT * FROM [Tb_Mascotas]">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TxtSubirNombreMascota" Name="nom" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DdlSubirEspecieMascota" Name="esp" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DdlSubirRazaMascota" Name="raza" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtSubirEdadMascota" Name="edad" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DdlSubirAlergiaMascota" Name="alergia" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="DdlSubirPropietarioMascota" Name="prestamo" PropertyName="SelectedValue" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelConsultarMascotas" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Buscar una mascota</u></h3>
        </div>
        <div class="container text-center table-responsive">
            <asp:TextBox ID="TxtBuscarPorNombre" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtBuscarPorNombre_TextChanged" placeholder="Buscar por nombre..."></asp:TextBox>
            <asp:Button ID="BtnBuscarPorNombre" runat="server" CssClass="btn btn-primary" Text="Ver todos los registros" OnClick="BtnBuscarPorNombre_Click" />

            <asp:SqlDataSource ID="DS_ConsultarMascotas" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>"
                SelectCommand="SELECT Tb_Mascotas.Nid_Mascota, Tb_Mascotas.N_Nombre, Tb_Mascotas.ID_Especie, Cat_Especies.N_Especie, Tb_Mascotas.ID_Raza, Cat_Razas.N_Raza, Tb_Mascotas.N_Edad, Tb_Mascotas.ID_Alergias, Cat_Alergias.N_Aelrgia, Tb_Mascotas.ID_Propietario, Tb_Propietario.N_Coreo, Tb_Mascotas.N_FechaRegistro FROM Tb_Mascotas INNER JOIN Cat_Especies ON Tb_Mascotas.ID_Especie = Cat_Especies.Nid_Especie INNER JOIN Cat_Razas ON Tb_Mascotas.ID_Raza = Cat_Razas.Nid_Raza INNER JOIN Cat_Alergias ON Tb_Mascotas.ID_Alergias = Cat_Alergias.Nid_Alergia INNER JOIN Tb_Propietario ON Tb_Mascotas.ID_Propietario = Tb_Propietario.Nid_Propietario"></asp:SqlDataSource>
            <asp:GridView ID="GVConsultarMascotas" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Nid_Mascota" DataSourceID="DS_ConsultarMascotas" GridLines="None" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Nid_Mascota" HeaderText="Nid_Mascota" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Mascota" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_Especie" HeaderText="Especie" SortExpression="N_Especie" />
                    <asp:BoundField DataField="N_Raza" HeaderText="Raza" SortExpression="N_Raza" />
                    <asp:BoundField DataField="N_Edad" HeaderText="Edad (Años)" SortExpression="N_Edad" />
                    <asp:BoundField DataField="N_Aelrgia" HeaderText="Alergia" SortExpression="N_Aelrgia" />
                    <asp:BoundField DataField="N_Coreo" HeaderText="Coreo del pripietario" SortExpression="N_Coreo" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de Registro" SortExpression="N_FechaRegistro" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
        </div>
        <div class="text-center">
            <br />
            <asp:Button ID="BtnCerrarConlta" class="btn btn-primary animacion" runat="server" Text="Cerrar" />
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelModificarMascotas" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Modificar mascota</u></h3>
            <br />
        </div>
        <div class="container text-center table-responsive">
            <asp:SqlDataSource ID="DS_ModMascotaGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_Mascotas.Nid_Mascota, Tb_Mascotas.N_Nombre, Tb_Mascotas.ID_Especie, Cat_Especies.N_Especie, Tb_Mascotas.ID_Raza, Cat_Razas.N_Raza, Tb_Mascotas.N_Edad, Tb_Mascotas.ID_Alergias, Cat_Alergias.N_Aelrgia, Tb_Mascotas.ID_Propietario, Tb_Propietario.N_Coreo, Tb_Mascotas.N_FechaRegistro FROM Tb_Mascotas INNER JOIN Cat_Especies ON Tb_Mascotas.ID_Especie = Cat_Especies.Nid_Especie INNER JOIN Cat_Razas ON Tb_Mascotas.ID_Raza = Cat_Razas.Nid_Raza INNER JOIN Cat_Alergias ON Tb_Mascotas.ID_Alergias = Cat_Alergias.Nid_Alergia INNER JOIN Tb_Propietario ON Tb_Mascotas.ID_Propietario = Tb_Propietario.Nid_Propietario"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Nid_Mascota" DataSourceID="DS_ModMascotaGV" GridLines="None" CssClass="text-center " Width="100%">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Nid_Mascota" HeaderText="No de registro" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Mascota" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="N_Especie" HeaderText="Especie" SortExpression="N_Especie" />
                    <asp:BoundField DataField="N_Raza" HeaderText="Raza" SortExpression="N_Raza" />
                    <asp:BoundField DataField="N_Edad" HeaderText="Edad (Años)" SortExpression="N_Edad" />
                    <asp:BoundField DataField="N_Aelrgia" HeaderText="Alergias" SortExpression="N_Aelrgia" />
                    <asp:BoundField DataField="N_Coreo" HeaderText="Correo del propietario" SortExpression="N_Coreo" />
                    <asp:BoundField DataField="N_FechaRegistro" HeaderText="Fecha de registro" SortExpression="N_FechaRegistro" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <br />

            <asp:SqlDataSource ID="DS_ModificarMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_Mascotas] WHERE ([Nid_Mascota] = @Nid_Mascota)" UpdateCommand="UPDATE Tb_Mascotas SET N_Nombre = @nom, ID_Especie = @esp, ID_Raza = @raz, N_Edad = @edad, ID_Alergias = @aler, ID_Propietario = @propi WHERE (Nid_Mascota = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="Nid_Mascota" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TxtModificarNombreMascota" Name="nom" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlModificarEspecieMascota" Name="esp" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlModificarRazaMascota" Name="raz" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModifciarEdadMascota" Name="edad" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlModificarAlergiaMascota" Name="aler" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DdlModificarPropietarioMascota" Name="propi" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtModificarRegMascota" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
        <div class="text-center">
            <asp:Button ID="BtnCerrarModificacion" runat="server" class="btn btn-primary animacion" Text="Cerrar" />
        </div>
        <asp:Panel ID="PanelFormEditarMascota" runat="server" Visible="false">
            <div class="row">
                <div class="col">
                    <asp:Label ID="Aux" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <div class="col-md-8 offset-md-5">
                    <div class="form-group">
                        <asp:Label ID="LblModificarRegMascota" runat="server" Text="Numero de registro de mascotas"></asp:Label>
                        <asp:TextBox ID="TxtModificarRegMascota" CssClass="form-control" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarNombreMascota" runat="server" Text="Nombre de la mascota"></asp:Label>
                        <asp:TextBox ID="TxtModificarNombreMascota" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarEspecieMascota" runat="server" Text="Especie de la mascota"></asp:Label>
                        <asp:DropDownList ID="DdlModificarEspecieMascota" CssClass="form-select" runat="server" DataSourceID="DS_ModificarEspecieMascota" DataTextField="N_Especie" DataValueField="Nid_Especie"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_ModificarEspecieMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Especies]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarRazaMascota" runat="server" Text="Raza de la mascota"></asp:Label>
                        <asp:DropDownList ID="DdlModificarRazaMascota" CssClass="form-select" runat="server" DataSourceID="DS_ModificarRazaMascota" DataTextField="N_Raza" DataValueField="Nid_Raza"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_ModificarRazaMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Razas]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModifciarEdadMascota" runat="server" Text="Ead de la mascota en años"></asp:Label>
                        <asp:TextBox ID="TxtModifciarEdadMascota" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarAlergiaMascota" runat="server" Text="Alergia de la mascota"></asp:Label>
                        <asp:DropDownList ID="DdlModificarAlergiaMascota" CssClass="form-select" runat="server" DataSourceID="DS_ModificarAlergiaMascota" DataTextField="N_Aelrgia" DataValueField="Nid_Alergia"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_ModificarAlergiaMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Alergias]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarPropietarioMascota" runat="server" Text="Correo del propietario"></asp:Label>
                        <asp:DropDownList ID="DdlModificarPropietarioMascota" CssClass="form-select" runat="server" DataSourceID="DS_ModificarPropietarioMascota" DataTextField="N_Coreo" DataValueField="Nid_Propietario"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_ModificarPropietarioMascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT [Nid_Propietario], [N_Coreo] FROM [Tb_Propietario]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblModificarFechaRegMascota" runat="server" Text="Fecha del registro"></asp:Label>
                        <asp:TextBox ID="TxtModificarFechaRegMascota" runat="server" CssClass="form-control" ReadOnly="True" TextMode="Date"></asp:TextBox>
                    </div>
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
