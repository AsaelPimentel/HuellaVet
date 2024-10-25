<%@ Page Title="Productos" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Productos.aspx.vb" Inherits="HuellaVet.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <main>
        <section>
            <div class="text-center from-group ">
                <asp:DropDownList ID="ddlCategorias" runat="server" AutoPostBack="true" CssClass="form-select btn btn-secondary dropdown-toggle">
                    <asp:ListItem Text="Seleccione una categoria" Value="Select"></asp:ListItem>
                    <asp:ListItem Text="Productos Generales" Value="Generales"></asp:ListItem>
                    <asp:ListItem Text="Medicamentos" Value="Medicamentos"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
            </div>
        </section>
    </main>

    <asp:Panel ID="PnlGenerales" runat="server" Visible="false">
        <!-- Contenido para Productos Generales -->
        <div class="row">
            <div class="col">
                <h2 class="text-center bg-success text-white">--> Productos generales <--</h2>
                <div class="container">
                    <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="DS_ProductosGenerales" GridLines="Horizontal" AllowPaging="True" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Nid_Producto" HeaderText="No.Serie" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Producto" />
                            <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                            <asp:BoundField DataField="Expr1" HeaderText="Tipo de producto" SortExpression="Expr1" />
                            <asp:BoundField DataField="N_Descripcion" HeaderText="Descripcion" SortExpression="N_Descripcion" />
                            <asp:BoundField DataField="N_Precio" HeaderText="Precio ($ MXN)" SortExpression="N_Precio" />
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                    <asp:Image ID="ImgFarmaco" runat="server" ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String(CType(Eval("N_Imagen"), Byte())) %>' Width="100" Height="150" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="DS_ProductosGenerales" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Tb_ProductosGenerales.Nid_Producto, Tb_ProductosGenerales.N_Nombre, Cat_TipoPro.N_Tipo AS Expr1, Tb_ProductosGenerales.N_Descripcion, Tb_ProductosGenerales.N_Precio, Tb_ProductosGenerales.N_Imagen FROM Tb_ProductosGenerales INNER JOIN Cat_TipoPro ON Tb_ProductosGenerales.N_Tipo = Cat_TipoPro.Nid_TipoPro"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="PnlMedicamentos" runat="server" Visible="false">
        <!-- Contenido para Medicamentos -->
        <div class="row">
            <div class="col">
                <h2 class="text-center bg-success text-white">--> Medicamentos <--</h2>
                <div class="container text-center">
                    <asp:GridView ID="gvMedicamentos" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Nid_Medicamento" DataSourceID="DS_Medicamentos" AllowPaging="True" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Nid_Medicamento" HeaderText="No.Serie" InsertVisible="False" ReadOnly="True" SortExpression="Nid_Medicamento" />
                            <asp:BoundField DataField="N_Nombre" HeaderText="Nombre" SortExpression="N_Nombre" />
                            <asp:BoundField DataField="N_Precio" HeaderText="Precio ($ MXN)" SortExpression="N_Precio" />
                            <asp:BoundField DataField="N_Unidades" HeaderText="Unidades" SortExpression="N_Unidades" />
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                    <asp:Image ID="ImgFarmaco" runat="server" ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String(CType(Eval("N_Imagen"), Byte())) %>' Width="100" Height="150" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="DS_Medicamentos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT Nid_Medicamento, N_Nombre, N_Precio, N_Unidades, N_Imagen FROM Tb_ProductosFarmacia"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
