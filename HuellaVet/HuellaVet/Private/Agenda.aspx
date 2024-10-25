﻿<%@ Page Title="Reservar Citas" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteAdmin.Master" CodeBehind="Agenda.aspx.vb" Inherits="HuellaVet.Agenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .demo {
            background: #E0E0E0;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                locale: 'es',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                dateClick: function (info) {
                    // Obtenemos la fecha seleccionada en el formato "yyyy-mm-dd"
                    var fechaSeleccionada = info.date.toISOString().split('T')[0];
                    // Accedemos al elemento ASP TextBox por su ID
                    var elementoASP = document.getElementById('<%= TxtFechaSeleccionada.ClientID %>');
                    // Asignamos la fecha seleccionada al TextBox
                    elementoASP.value = fechaSeleccionada;
                    // Abre el modal
                    $("#exampleModal").modal("show");
                }

            });
            calendar.render();
            // Configurar evento shown.bs.modal para cargar datos en el segundo DropDownList después de mostrar el modal
            $('#exampleModal').on('shown.bs.modal', function () {
                // Cargar datos en el segundo DropDownList
                cargarDatosDropDownMascota();
            });
            function cargarMascotas() {
                // Obtener el propietario seleccionado
                var propietarioSeleccionado = document.getElementById('<%= Ddl_SelectPropietario.ClientID %>').value;

                // Actualizar el segundo DropDownList
                var ddlMascota = document.getElementById('<%= Ddl_SelectMascota.ClientID %>');
                ddlMascota.options.length = 0;  // Limpiar opciones actuales

                // Verificar si se seleccionó un propietario
                if (propietarioSeleccionado !== "") {
                    // Realizar una llamada a la función del lado del servidor para obtener mascotas
                    PageMethods.ObtenerMascotasPorPropietario(propietarioSeleccionado, onSuccess, onFailure);
                } else {
                    // Si no se seleccionó propietario, mostrar un mensaje o realizar otras acciones necesarias
                    ddlMascota.options[0] = new Option("-- Seleccione --", "");
                }
            }

            function onSuccess(result) {
                // Manejar el resultado exitoso de la llamada al servidor
                var ddlMascota = document.getElementById('<%= Ddl_SelectMascota.ClientID %>');
                ddlMascota.options[0] = new Option("-- Seleccione --", "");

                // Agregar las opciones devueltas por el servidor
                for (var i = 0; i < result.length; i++) {
                    ddlMascota.options[i + 1] = new Option(result[i].Text, result[i].Value);
                }
            }

            function onFailure(error) {
                // Manejar el error de la llamada al servidor
                alert("Error al cargar datos de mascotas.");
            }
        });
    </script>

    <main>
        <!-- Calendario -->
        <div class="container-lg">
            <div class="container">
                <div class="container-sm">
                    <div class="col-md-8 offset-md-2">
                        <div id='calendar' class="demo"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <center>
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Agendar cita para atencion de una mascota</h1>
                        </center>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Inicio del formualrio -->
                        <div class="col-md-6 offset-md-3">
                            <div class="form-group">
                            </div>
                            <div class="form-group">
                                <asp:Label ID="LblFechaInicio" runat="server" Text="Fecha Inicio"></asp:Label>
                                <asp:TextBox ID="TxtFechaSeleccionada" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="LblSelectHora" runat="server" Text="Hora a solicitar"></asp:Label>
                                <asp:TextBox ID="TxtSelectHora" CssClass="form-control" runat="server" TextMode="Time"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="LblSelectPropietarios" runat="server" Text="Propietario"></asp:Label>
                                <asp:DropDownList ID="Ddl_SelectPropietario" CssClass="form-select" runat="server" AutoPostBack="True" DataSourceID="DS_Propietario" DataTextField="N_Coreo" DataValueField="Nid_Propietario"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_Propietario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT [Nid_Propietario], [N_Coreo] FROM [Tb_Propietario]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="LblSelectMascota" runat="server" Text="Mascota"></asp:Label>
                                <asp:DropDownList ID="Ddl_SelectMascota" CssClass="form-select" runat="server" DataSourceID="DS_Mascota" DataTextField="N_Nombre" DataValueField="Nid_Mascota"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_Mascota" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT [Nid_Mascota], [N_Nombre] FROM [Tb_Mascotas] WHERE [ID_Propietario] = @propietario">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Ddl_SelectPropietario" Name="propietario" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="from-group">
                                <asp:Label ID="LblSelectServicio" runat="server" Text="Servicio a solicitar"></asp:Label>
                                <asp:DropDownList ID="Ddl_SelectServicio" CssClass="form-select" runat="server" DataSourceID="DS_Servicios" DataTextField="N_Servicio" DataValueField="Nid_Servicio"></asp:DropDownList>
                                <asp:SqlDataSource ID="DS_Servicios" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" SelectCommand="SELECT * FROM [Cat_Servicios]"></asp:SqlDataSource>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="LblNotas" runat="server" Text="Notas Extras"></asp:Label>
                                <asp:TextBox ID="TxtNotas" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            </div>
                        </div>
                        <!-- fin del formulario -->
                    </div>
                    <div class="modal-footer">
                        <br />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="BtnSave" class="btn btn-primary" runat="server" Text="Registrar Evento" />
                    </div>
                </div>
            </div>
        </div>
    </main>
    <asp:SqlDataSource ID="DS_RegistrarCita" runat="server" ConnectionString="<%$ ConnectionStrings:CS_HuellaVet %>" InsertCommand="INSERT INTO Frm_Citas(N_Fecha, N_Hora, ID_Mascota, ID_Propietario, ID_Servicio, N_NotasAdicionales, ID_Empleado) VALUES (@fech, @hora, @mas, @popi, @ser, @nota, @empl)" SelectCommand="SELECT * FROM [Frm_Citas]">
        <InsertParameters>
            <asp:ControlParameter ControlID="TxtFechaSeleccionada" Name="fech" PropertyName="Text" />
            <asp:ControlParameter ControlID="TxtSelectHora" Name="hora" PropertyName="Text" />
            <asp:ControlParameter ControlID="Ddl_SelectMascota" Name="mas" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="Ddl_SelectPropietario" Name="popi" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="Ddl_SelectServicio" Name="ser" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TxtNotas" Name="nota" PropertyName="Text" />
            <asp:Parameter DefaultValue="2" Name="empl" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>
