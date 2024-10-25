<%@ Page Title="Medicamentos" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Medicamentos.aspx.vb" Inherits="HuellaVet.Medicamentos" %>

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
                        <h1>Administracion de Medicamentos.</h1>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <asp:Panel ID="PnlAdminMedicamento" runat="server">
                <div class="container text-center">
                    <div class="row row-cols-2">
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnRegMedicamento" runat="server" ImageUrl="~/Img/Botones/AgregarMedicamento.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblImgBtnRegMedicamento" runat="server" Font-Bold="True" Font-Size="X-Large">Registrar Medicamento</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnBscMedicamento" runat="server" ImageUrl="~/Img/Botones/buscarMedicamento.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblImgBtnBscMedicamento" runat="server" Font-Bold="True" Font-Size="X-Large">Buscar Medicamento</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnModMedicamento" runat="server" ImageUrl="~/Img/Botones/ModificarMedicamento.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblImgBtnModMedicamento" runat="server" Font-Bold="True" Font-Size="X-Large">Modificar Meedicamento</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </section>
    </main>
    <asp:Panel ID="PaneelNuevoMedicamento" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Registrar un Medicamento nuevo</u></h3>
            <br />
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-5">
                    <div class="form-group">
                        <asp:Label ID="LblSubirNombreMedicamento" runat="server" Text="Nombre del Medicamento"></asp:Label>
                        <asp:TextBox ID="TxtSubirNombreMedicamento" placeholder="Ingrese el nombre del prodcuto" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirTipoProducto" runat="server" Text="Tipo de Medicamento"></asp:Label>
                        <asp:DropDownList ID="DdlSubirTipoMedicamento" CssClass="form-control" runat="server" DataSourceID="DS_SubirTipoMedicamento" DataTextField="N_Tipo" DataValueField="Nid_TipoMed"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirTipoMedicamento" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_TipoMed]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirPrecioMedicamento" runat="server" Text="Precio del Medicamento en $MXN"></asp:Label>
                        <asp:TextBox ID="TxtSubirPrecioMedicamento" placeholder="$" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirUnidadesMedicamento" runat="server" Text="unidades del producto en pz"></asp:Label>
                        <asp:TextBox ID="TxtSubirUnidadesMedicamento" placeholder="pz" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirLoteMedicamento" runat="server" Text="Lote del medicamento"></asp:Label>
                        <asp:TextBox ID="TxtSubirLoteMedicamento" placeholder="Ingrese el número de lote" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirFechaCducidadMedicamento" runat="server" Text="fecha de caducidad del medicamento"></asp:Label>
                        <asp:TextBox ID="txtSubirFechaCducidadMedicamento" placeholder="Seleccione la fecha de caducidad" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirImagenMedicamento" runat="server" Text="Imagen del producto"></asp:Label>
                        <asp:FileUpload ID="FUPSubirImagenMedicamento" CssClass="form-control" PropertyName="FileBytes" runat="server" />
                    </div>
                </div>
                <div class="text-center">
                    <br />
                    <asp:Button ID="BtnCancelarNuevoProducto" runat="server" class="btn btn-primary animacion" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnSubirNuevoProducto" runat="server" class="btn btn-success animacion" Text="Registrar" />
                    <asp:SqlDataSource ID="DS_SubirMedicamento" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" InsertCommand="INSERT INTO Tb_ProductosFarmacia(N_Nombre, N_Tipo, N_Precio, N_Unidades, N_Lote, N_FechaCaducidad, N_Imagen) VALUES (@nom, @tip, @precio, @unida, @lote, @fecha, @img)" SelectCommand="SELECT * FROM [Tb_ProductosFarmacia]">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TxtSubirNombreMedicamento" Name="nom" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DdlSubirTipoMedicamento" Name="tip" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtSubirPrecioMedicamento" Name="precio" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtSubirUnidadesMedicamento" Name="unida" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtSubirLoteMedicamento" Name="lote" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtSubirFechaCducidadMedicamento" Name="fecha" PropertyName="Text" />
                            <asp:ControlParameter ControlID="FUPSubirImagenMedicamento" Name="img" PropertyName="FileBytes" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <!-- consultar -->
    <asp:Panel ID="PanelConsultarMedicamentos" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Buscar un Mediacmento</u></h3>
            <br />
        </div>
        <div class="container text-center table table-responsive">
            <asp:TextBox ID="TxtBuscarPorNombre" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtBuscarPorNombre_TextChanged" placeholder="Buscar por nombre..."></asp:TextBox>
            <asp:Button ID="BtnBuscarPorNombre" runat="server" CssClass="btn btn-primary" Text="Ver todos los registros" OnClick="BtnBuscarPorNombre_Click" />
            <br />
            <asp:SqlDataSource ID="DS_ConsultarMedicamentos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_ProductosFarmacia.Nid_Medicamento, Tb_ProductosFarmacia.N_Nombre, Tb_ProductosFarmacia.N_Tipo, Cat_TipoMed.N_Tipo AS Expr1, Tb_ProductosFarmacia.N_Precio, Tb_ProductosFarmacia.N_Unidades, Tb_ProductosFarmacia.N_Lote, Tb_ProductosFarmacia.N_FechaCaducidad, Tb_ProductosFarmacia.N_Imagen FROM Tb_ProductosFarmacia INNER JOIN Cat_TipoMed ON Tb_ProductosFarmacia.N_Tipo = Cat_TipoMed.Nid_TipoMed"></asp:SqlDataSource>
            <asp:GridView ID="GVMedicamentos" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Nid_Medicamento" DataSourceID="DS_ConsultarMedicamentos" GridLines="Vertical" Width="100%">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Nid_Medicamento" HeaderText="No. serie" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Medicamento" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="Expr1" HeaderText="Tipo de medicamento" SortExpression="Expr1" />
                    <asp:BoundField DataField="N_Precio" HeaderText="Precio ($MXN)" SortExpression="N_Precio" />
                    <asp:BoundField DataField="N_Unidades" HeaderText="Unidades" SortExpression="N_Unidades" />
                    <asp:BoundField DataField="N_Lote" HeaderText="Lote" SortExpression="N_Lote" />
                    <asp:BoundField DataField="N_FechaCaducidad" HeaderText="Fecha de caducidad" SortExpression="N_FechaCaducidad" DataFormatString="{0:d}"/>
                    <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String(CType(Eval("N_Imagen"), Byte())) %>' Width="100" Height="150" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
        <div class="text-center">
            <br />
            <asp:Button ID="BtnCerrarConlta" class="btn btn-primary animacion" runat="server" Text="Cerrar" />
        </div>
    </asp:Panel>
    <!-- updates-->
    <asp:Panel ID="PanelEditarMedicamentos" runat="server" Visible="False">
        <div class="text-center">
            <h3><u>Editar Registro de medicamentos</u></h3>
            <br />
        </div>
        <div class="container text-center table table-responsive">
            <asp:SqlDataSource ID="DS_EditarMedicamentoGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_ProductosFarmacia.Nid_Medicamento, Tb_ProductosFarmacia.N_Nombre, Tb_ProductosFarmacia.N_Tipo, Cat_TipoMed.N_Tipo AS Expr1, Tb_ProductosFarmacia.N_Precio, Tb_ProductosFarmacia.N_Unidades, Tb_ProductosFarmacia.N_Lote, Tb_ProductosFarmacia.N_FechaCaducidad, Tb_ProductosFarmacia.N_Imagen FROM Tb_ProductosFarmacia INNER JOIN Cat_TipoMed ON Tb_ProductosFarmacia.N_Tipo = Cat_TipoMed.Nid_TipoMed"></asp:SqlDataSource>
            <asp:GridView ID="GVEditarMedicamento" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Nid_Medicamento" DataSourceID="DS_EditarMedicamentoGV" GridLines="Vertical" Width="100%">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Nid_Medicamento" HeaderText="No. de serie" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Medicamento" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="Expr1" HeaderText="Tipo de medicamento" SortExpression="Expr1" />
                    <asp:BoundField DataField="N_Precio" HeaderText="Precio" SortExpression="N_Precio" />
                    <asp:BoundField DataField="N_Unidades" HeaderText="Unidades" SortExpression="N_Unidades" />
                    <asp:BoundField DataField="N_Lote" HeaderText="Lote" SortExpression="N_Lote" />
                    <asp:BoundField DataField="N_FechaCaducidad" HeaderText="Fecha de caducidad" SortExpression="N_FechaCaducidad" DataFormatString="{0:d}"/>
                    <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <asp:Image ID="ImgPortada" runat="server" ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String(CType(Eval("N_Imagen"), Byte())) %>' Width="100" Height="150" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="DS_EditarMedicamento" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_ProductosFarmacia] WHERE ([Nid_Medicamento] = @Nid_Medicamento)" UpdateCommand="UPDATE Tb_ProductosFarmacia SET N_Nombre = @nom, N_Tipo = @tip, N_Precio = @pre, N_Unidades = @uni WHERE (Nid_Medicamento = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="Nid_Medicamento" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TxtEditarNombreMed" Name="nom" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlEditarTipoMed" Name="tip" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtEditarPrecioMed" Name="pre" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtEditarUnidadesMed" Name="uni" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtEditarSerieMed" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="text-center">
            <asp:Button ID="BtnCerrarModificacion" runat="server" class="btn btn-primary animacion" Text="Cerrar" />
        </div>
        <asp:Panel ID="PanelFrmEditarMedicamento" runat="server" Visible="False">
            <div class="row">
                <div class="col">
                    <asp:Label ID="Aux" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <div class="col-md-8 offset-md-5">
                    <div class="form-gruop">
                        <asp:Label ID="LblEditarSerieMed" runat="server" Text="Numero de serie"></asp:Label>
                        <asp:TextBox ID="TxtEditarSerieMed" CssClass="form-control" runat="server" Enabled="False" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-gruop">
                        <asp:Label ID="LblEditarNombreMed" runat="server" Text="Nombre"></asp:Label>
                        <asp:TextBox ID="TxtEditarNombreMed" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-gruop">
                        <asp:Label ID="LblEditarTipoMed" runat="server" Text="Tipo de medicamento"></asp:Label>
                        <asp:DropDownList ID="DdlEditarTipoMed" CssClass="form-select" runat="server" DataSourceID="SqlDataSource1" DataTextField="N_Tipo" DataValueField="Nid_TipoMed"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_TipoMed]"></asp:SqlDataSource>
                    </div>
                    <div class="form-gruop">
                        <asp:Label ID="LblEditarPrecioMed" runat="server" Text="Precio"></asp:Label>
                        <asp:TextBox ID="TxtEditarPrecioMed" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-gruop">
                        <asp:Label ID="LblEditarUnidadesMed" runat="server" Text="Unidades"></asp:Label>
                        <asp:TextBox ID="TxtEditarUnidadesMed" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-gruop">
                        <asp:Label ID="LblEditarLoteMed" runat="server" Text="Lote"></asp:Label>
                        <asp:TextBox ID="TxtEditarLoteMed" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                    <div class="form-gruop">
                        <asp:Label ID="LblEditarCaducidadMed" runat="server" Text="Fecha de caducidad"></asp:Label>
                        <asp:TextBox ID="TxtEditarCaducidadMed" CssClass="form-control" runat="server" ReadOnly="True" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-md-8 offset-md-5">
                <div class="form-group">
                    <br />
                    <asp:Button ID="BtnCerrarModMedicamento" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnActualizarMedicamento" runat="server" CssClass="animacion btn btn-success" Text="Actualziar registro" />
                    <br />
                </div>
            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
