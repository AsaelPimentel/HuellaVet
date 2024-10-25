<%@ Page Title="Inicio" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="HuellaVet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .carousel-item img {
            width: 350px;
            height: 300px;
            object-fit: cover; /* Esto evita la distorsión de la imagen */
        }

        .carousel-caption {
            background-color: rgba(0, 0, 0, 0.5); /* Fondo gris con opacidad */
            color: #fff; /* Texto en color blanco */
            padding: 10px; /* Espaciado interno para el texto */
        }

            .carousel-caption h5 {
                font-size: 1.5rem; /* Tamaño del título */
            }

            .carousel-caption p {
                font-size: 1rem; /* Tamaño del párrafo */
            }
    </style>
    <main>
        <section>
            <div style="background-color: #2591D9; color: #FFF; text-align: center; padding: 20px;">
                <h1>Bienvenido a HuellaVet</h1>
                <p>Su lugar de confianza para el cuidado integral de su mascota. Descubra una experiencia excepcional con nuestros servicios de estética, consultas médicas, venta de productos y accesorios de alta calidad, y medicamentos para el bienestar de su fiel amigo. ¡Confíe en nosotros para mantener a su mascota saludable y feliz!</p>
            </div>
        </section>
    </main>
    <br />
    <main>
        <section>
            <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-ride="carousel" data-bs-touch="false">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="Img/Carrousel/ServicioMedico.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Servicio Médico</h5>
                            <p>Descripción del servicio médico.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Img/Carrousel/ServicioVenta.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Servicio de Venta</h5>
                            <p>Descripción del servicio de venta.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Img/Carrousel/ServicioHospital.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Servicio Hospital</h5>
                            <p>Descripción del servicio de hospital.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Img/Carrousel/ServicioEstetica.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Servicio de Estética</h5>
                            <p>Descripción del servicio de estética.</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        <br />
        <br />
        <div class="container">
            <h4 style="color: #095E00;" class="text-center">Horario de Atención</h4>
            <asp:Table ID="TablaHorario" runat="server" CssClass="table table-responsive" Style="background-color: #518494; color:white;">
                <asp:TableRow>
                    <asp:TableCell>Domingo</asp:TableCell>
                    <asp:TableCell>Lunes</asp:TableCell>
                    <asp:TableCell>Martes</asp:TableCell>
                    <asp:TableCell>Miércoles</asp:TableCell>
                    <asp:TableCell>Jueves</asp:TableCell>
                    <asp:TableCell>Viernes</asp:TableCell>
                    <asp:TableCell>Sábado</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>8:00 AM - 5:00 PM</asp:TableCell>
                    <asp:TableCell>8:00 AM - 7:00 PM</asp:TableCell>
                    <asp:TableCell>8:00 AM - 7:00 PM</asp:TableCell>
                    <asp:TableCell>8:00 AM - 7:00 PM</asp:TableCell>
                    <asp:TableCell>8:00 AM - 7:00 PM</asp:TableCell>
                    <asp:TableCell>8:00 AM - 7:00 PM</asp:TableCell>
                    <asp:TableCell>8:00 AM - 7:00 PM</asp:TableCell>
                </asp:TableRow>
            </asp:Table>


        </div>
    </main>

</asp:Content>
