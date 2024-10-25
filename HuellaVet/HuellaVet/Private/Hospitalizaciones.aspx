<%@ Page Title="Hospitalizaciones" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Hospitalizaciones.aspx.vb" Inherits="HuellaVet.Hospitalizaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <main>
        <section>
            <h1 class="text-center bg-success text-white">--> Hospitalizaciones <--- </h1>
        </section>
        <hr />
    </main>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="../Img/Mensaje.png" width="700px" />
            </div>
            <div class="col-md-6 text-center">
                <div class="d-flex justify-content-center">
                    <!-- Utilizamos d-flex y justify-content-center para centrar horizontalmente -->
                    <div class="card" style="width: 500px;">
                        <img src="../Img/PegoTriste.jpg" class="card-img-top" style="height:270px;"/>
                        <div class="card-body">
                            <h5 class="card-title">Lo sentimos</h5>
                            <p class="card-text">El equipo de desarrollo esta trabajando en este apartado y no será visible hasta que esté terminado. Le pedimos que tome sus debidas precauciones si tiene algún proceso que dependa de este apartado. Le informaremos inmediatamente una vez que esté terminado.</p>
                            <a href="Default.aspx" class="btn btn-primary">Volver al inicio</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
