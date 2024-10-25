<%@ Page Title="Productos" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Productos.aspx.vb" Inherits="HuellaVet.Productoss" %>

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
                        <h1>Administracion de Productos genereales.</h1>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <!-- Administracion de productos generales-->
            <asp:Panel ID="PnlAdminProductos" runat="server">
                <div class="container text-center">
                    <div class="row row-cols-2">
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnRegProducto" runat="server" ImageUrl="~/Img/Botones/agregar-producto.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblRegProducto" runat="server" Font-Bold="True" Font-Size="X-Large">Registrar Productos</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnBusProducto" runat="server" ImageUrl="~/Img/Botones/buscar-Producto.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblBusProducto" runat="server" Font-Bold="True" Font-Size="X-Large">Buscar Productos</asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 g-3">
                            <asp:ImageButton ID="ImgBtnModProducto" runat="server" ImageUrl="~/Img/Botones/Editar-de-producto.png" Style="height: 125px; width: 125px;" CssClass="animacion" />
                            <div class="col">
                                <asp:Label ID="LblModProducto" runat="server" Font-Bold="True" Font-Size="X-Large">Editar Productos</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </section>
    </main>
    <asp:Panel ID="PanelNuevoProducto" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Registrar un Producto nuevo</u></h3>
            <br />
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-5">
                    <div class="form-group">
                        <asp:Label ID="LblSubirNombreProducto" runat="server" Text="Nombre del producto"></asp:Label>
                        <asp:TextBox ID="TxtSubirNombreProducto" placeholder="Ingrese el nombre del prodcuto" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirTipoProducto" runat="server" Text="Tipo de producto"></asp:Label>
                        <asp:DropDownList ID="DdlSubirTipoProducto" CssClass="form-control" runat="server" DataSourceID="DS_SubirTipoProducto" DataTextField="N_Tipo" DataValueField="Nid_TipoPro"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_SubirTipoProducto" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_TipoPro]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirDescripcionProductor" runat="server" Text="Descripción del producto"></asp:Label>
                        <asp:TextBox ID="TxtSubirDescripcionProducto" placeholder="Descripción del producto" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirPrecioProducto" runat="server" Text="Precio del producto en $MXN"></asp:Label>
                        <asp:TextBox ID="TxtSubirPrecioProducto" placeholder="$" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblSubirImagenProducto" runat="server" Text="Imagen del producto"></asp:Label>
                        <asp:FileUpload ID="FUPSubirImagenProducto" CssClass="form-control" PropertyName="FileBytes" runat="server" accept=".jpg, .jpeg, .png"/>
                    </div>
                </div>
                <div class="text-center">
                    <br />
                    <asp:Button ID="BtnCancelarNuevoProducto" runat="server" class="btn btn-primary animacion" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnSubirNuevoProducto" runat="server" class="btn btn-success animacion" Text="Registrar" />
                    <asp:SqlDataSource ID="DS_SubirProdcuto" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" InsertCommand="INSERT INTO Tb_ProductosGenerales(N_Nombre, N_Tipo, N_Descripcion, N_Precio, N_Imagen) VALUES (@nom, @tip, @desc , @prec, @img)" SelectCommand="SELECT * FROM [Tb_ProductosGenerales]">
                        <InsertParameters>
                            <asp:ControlParameter Name="nom" ControlID="TxtSubirNombreProducto" PropertyName="Text" />
                            <asp:ControlParameter ControlID="DdlSubirTipoProducto" Name="tip" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="TxtSubirDescripcionProducto" Name="desc" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TxtSubirPrecioProducto" Name="prec" PropertyName="Text" />
                            <asp:ControlParameter ControlID="FUPSubirImagenProducto" Name="img" PropertyName="FileBytes" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
    <!-- Selects -->
    <asp:Panel ID="PanelBuscarProducto" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Buscar un Producto</u></h3>
            <br />
        </div>
        <div class="container text-center table-responsive">
            <asp:TextBox ID="TxtBuscarPorNombre" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtBuscarPorNombre_TextChanged" placeholder="Buscar por nombre..."></asp:TextBox>
            <asp:Button ID="BtnBuscarPorNombre" runat="server" CssClass="btn btn-primary" Text="Ver todos los registros" OnClick="BtnBuscarPorNombre_Click" />
            <br />
            <asp:SqlDataSource ID="DS_ConsultarProductos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_ProductosGenerales.Nid_Producto, Tb_ProductosGenerales.N_Nombre, Tb_ProductosGenerales.N_Tipo, Cat_TipoPro.N_Tipo AS [Tipo de producto], Cat_TipoPro.N_Descripcion AS [Descricion Producito], Tb_ProductosGenerales.N_Descripcion, Tb_ProductosGenerales.N_Precio, Tb_ProductosGenerales.N_Imagen FROM Tb_ProductosGenerales INNER JOIN Cat_TipoPro ON Tb_ProductosGenerales.N_Tipo = Cat_TipoPro.Nid_TipoPro"></asp:SqlDataSource>
            <asp:GridView ID="GVConsultarProductos" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="DS_ConsultarProductos" Width="100%" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Nid_Producto" HeaderText="Numero de serie" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Producto" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="Tipo de producto" HeaderText="Tipo de producto" SortExpression="Tipo de producto" />
                    <asp:BoundField DataField="N_Descripcion" HeaderText="Descripcion del producto" SortExpression="N_Descripcion" />
                    <asp:BoundField DataField="N_Precio" HeaderText="Precio (MXN)" SortExpression="N_Precio" />
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
    <!-- updates -->
    <asp:Panel ID="PanelEditarProducto" runat="server" Visible="false">
        <div class="container text-center">
            <h3><u>Editar un Producto</u></h3>
            <br />
        </div>
        <div class="container text-center table-responsive">
            <asp:SqlDataSource ID="DS_EditarProductoGV" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_ProductosGenerales.Nid_Producto, Tb_ProductosGenerales.N_Nombre, Tb_ProductosGenerales.N_Tipo, Cat_TipoPro.N_Tipo AS [Tipo de producto], Cat_TipoPro.N_Descripcion AS [Descricion Producito], Tb_ProductosGenerales.N_Descripcion, Tb_ProductosGenerales.N_Precio, Tb_ProductosGenerales.N_Imagen FROM Tb_ProductosGenerales INNER JOIN Cat_TipoPro ON Tb_ProductosGenerales.N_Tipo = Cat_TipoPro.Nid_TipoPro"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="DS_EditarProductoGV" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="Nid_Producto">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Nid_Producto" HeaderText="No. de Serie" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Producto" />
                    <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                    <asp:BoundField DataField="Tipo de producto" HeaderText="Tipo de producto" SortExpression="Tipo de producto" />
                    <asp:BoundField DataField="N_Descripcion" HeaderText="Descripcion" SortExpression="N_Descripcion" />
                    <asp:BoundField DataField="N_Precio" HeaderText="Precio en ($MXN)" SortExpression="N_Precio" />
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
            <asp:SqlDataSource ID="DS_EditarProducto" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Tb_ProductosGenerales] WHERE ([Nid_Producto] = @Nid_Producto)" UpdateCommand="UPDATE Tb_ProductosGenerales SET N_Nombre = @nom, N_Tipo = @tip, N_Descripcion = @desc , N_Precio = @pre, N_Imagen = @img WHERE (Nid_Producto = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Aux" Name="Nid_Producto" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TxtEditarNombreProducto" Name="nom" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DdlEditarTipoProducto" Name="tip" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TxtEditarDescProducto" Name="desc" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TxtEditarPrecioProducto" Name="pre" PropertyName="Text" />
                    <asp:ControlParameter ControlID="FileUploadImagenProducto" Name="img" PropertyName="FileBytes" />
                    <asp:ControlParameter ControlID="TxtEditarIdProducto" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="text-center">
            <br />
            <asp:Button ID="BtnCerrarModificacion" runat="server" class="btn btn-primary animacion" Text="Cerrar" />
        </div>
        <asp:Panel ID="PanelFrmEditarProducto" runat="server" Visible="false">
            <div class="row">
                <div class="col">
                    <asp:Label ID="Aux" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                <div class="col-md-8 offset-md-5">
                    <div class="form-group">
                        <asp:Label ID="LblEditarIdProducto" runat="server" Text="Numero de serie"></asp:Label>
                        <asp:TextBox ID="TxtEditarIdProducto" runat="server" CssClass="form-control" Enabled="False" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblEditarNombreProducto" runat="server" Text="Nombre del producto"></asp:Label>
                        <asp:TextBox ID="TxtEditarNombreProducto" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblEditarTipoProducto" runat="server" Text="Tipo de producto"></asp:Label>
                        <asp:DropDownList ID="DdlEditarTipoProducto" runat="server" CssClass="form-select" DataSourceID="DS_EditarTipoProducto" DataTextField="N_Tipo" DataValueField="Nid_TipoPro"></asp:DropDownList>
                        <asp:SqlDataSource ID="DS_EditarTipoProducto" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_TipoPro]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblEditarDescProducto" runat="server" Text="Descripcion del producto"></asp:Label>
                        <asp:TextBox ID="TxtEditarDescProducto" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblEditarPrecioProducto" runat="server" Text="Precio del producto ($MXN)"></asp:Label>
                        <asp:TextBox ID="TxtEditarPrecioProducto" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblEditarImagenProducto" runat="server" Text="Imagen del producto"></asp:Label>
                        <asp:FileUpload ID="FileUploadImagenProducto" runat="server" PropertyName="FileBytes" CssClass="form-control" EnableViewState="true" accept=".jpg, .jpeg, .png"/>
                        <asp:Label ID="LblSubirMismaImagen" runat="server" ForeColor="Red" Text="Por favor, vuelve a subir la misma imagen del producto"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-md-8 offset-md-5">
                <div class="form-group">
                    <br />
                    <asp:Button ID="BtnCerrarModProducto" runat="server" CssClass="animacion btn btn-warning" Text="Cancelar" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnActualizarProdcuto" runat="server" CssClass="animacion btn btn-success" Text="Actualziar registro" />
                    <br />
                </div>
            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
