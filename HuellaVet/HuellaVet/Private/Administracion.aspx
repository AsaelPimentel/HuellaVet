<%@ Page Title="Administracion del sistema" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Administracion.aspx.vb" Inherits="HuellaVet.Administracion" %>
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
  <br />
  <main>
      <section>
          <h1 class="text-center bg-success text-white">--> Administracion General <--</h1>
      </section>
      <section>
          <asp:Panel ID="ControlPanel" runat="server">
              <div class="container">
                  <div class="container text-center">
                      <div class="row row-cols-2">
                          <div class="col g-3">
                              <asp:ImageButton ID="BtnAdminEmpleados" runat="server" ImageUrl="~/Img/Adminsitracion/Empleados.png" Style="height: 150px; width: 150px;" CssClass="animacion" />
                              <div class="col">
                                  <asp:Label ID="LblAdminEmpleados" runat="server" Font-Bold="True" Font-Size="X-Large">Empleados</asp:Label>
                              </div>
                          </div>
                          <div class="col g-3">
                              <asp:ImageButton ID="BtnAdminUsuarios" runat="server" ImageUrl="~/Img/Adminsitracion/intimidad.png" Style="height: 150px; width: 150px;" CssClass="animacion" />
                              <div class="col">
                                  <asp:Label ID="LblAdminUsuarios" runat="server" Font-Bold="True" Font-Size="X-Large">Usuarios</asp:Label>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <asp:ImageButton ID="BtnAdminProductos" runat="server" ImageUrl="~/Img/Adminsitracion/ProductosGenerales.png" Style="height: 150px; width: 150px;" CssClass="animacion" />
                              <div class="col">
                                  <asp:Label ID="LblAdminProductos" runat="server" Font-Bold="True" Font-Size="X-Large">Productos Generales</asp:Label>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <asp:ImageButton ID="BtnAdminFarmacos" runat="server" ImageUrl="~/Img/Adminsitracion/farmaco.png" Style="height: 150px; width: 150px;" CssClass="animacion" />
                              <div class="col">
                                  <asp:Label ID="LblAdminFarmacos" runat="server" Font-Bold="True" Font-Size="X-Large">Medicamentos</asp:Label>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <asp:ImageButton ID="BtnAdminMascotas" runat="server" ImageUrl="~/Img/Adminsitracion/mascotas.png" Style="height: 150px; width: 150px;" CssClass="animacion" />
                              <div class="col">
                                  <asp:Label ID="LblAdminMascotas" runat="server" Font-Bold="True" Font-Size="X-Large">Mascotas</asp:Label>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </asp:Panel>
      </section>
  </main>
</asp:Content>
