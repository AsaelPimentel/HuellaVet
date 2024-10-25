Public Class Empleados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub

    Protected Sub BtnRegistrarEmpleado_Click(sender As Object, e As ImageClickEventArgs) Handles BtnRegistrarEmpleado.Click
        PanelControl.Visible = False
        PanelSubirEmpelado.Visible = True
        PanelActualizarEmpleados.Visible = False
        PanelConsultarEmpleado.Visible = False
    End Sub

    Protected Sub BtnCanRegEmpelado_Click(sender As Object, e As EventArgs) Handles BtnCanRegEmpelado.Click
        PanelControl.Visible = True
        PanelSubirEmpelado.Visible = False
        TxtRegNomEmpl.Text = ""
        TxtRegAppEmpl.Text = ""
        TxtRegApmEmpl.Text = ""
        TxtRegMailEmpl.Text = ""
        TxtRegTelEmpl.Text = ""
        DdlRegPuestoEmpl.ClearSelection()
    End Sub

    Protected Sub BtnRegEmpleado_Click(sender As Object, e As EventArgs) Handles BtnRegEmpleado.Click
        Dim camposVacios As Boolean = False

        If String.IsNullOrEmpty(TxtRegNomEmpl.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre (s) del empleado.');", True)
            TxtRegNomEmpl.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtRegAppEmpl.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el apellido paterno del empleado.');", True)
            TxtRegAppEmpl.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtRegApmEmpl.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el apellido materno del empleado.');", True)
            TxtRegApmEmpl.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtRegTelEmpl.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el teléfono de contacto del empleado.');", True)
            TxtRegTelEmpl.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtRegMailEmpl.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el correo del empleado.');", True)
            TxtRegMailEmpl.Focus()
            camposVacios = True
        End If

        If Not camposVacios Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_SubirEmpleado.Insert()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Empleado registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If
    End Sub

    Protected Sub BtnBuscarEmpleado_Click(sender As Object, e As ImageClickEventArgs) Handles BtnBuscarEmpleado.Click
        PanelConsultarEmpleado.Visible = True
        PanelControl.Visible = False
        PanelSubirEmpelado.Visible = False
        PanelActualizarEmpleados.Visible = False
    End Sub

    Protected Sub BtnEditarEmpleado_Click(sender As Object, e As ImageClickEventArgs) Handles BtnEditarEmpleado.Click
        PanelActualizarEmpleados.Visible = True
        PanelConsultarEmpleado.Visible = False
        PanelControl.Visible = False
    End Sub

    Protected Sub BtnCanRegEmpelado0_Click(sender As Object, e As EventArgs) Handles BtnCanRegEmpelado0.Click
        PanelActualizarEmpleados.Visible = False
        PanelConsultarEmpleado.Visible = False
        PanelControl.Visible = True
    End Sub

    Protected Sub GVModEmpleados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVModEmpleados.SelectedIndexChanged
        ' Obtén el ID del empleado de la fila seleccionada
        Dim selectedEmployeeID As Integer = Convert.ToInt32(GVModEmpleados.SelectedDataKey.Value)

        ' Filtra los datos usando el ID del empleado
        DS_ModificarEmpleado.SelectCommand = "SELECT * FROM [Tb_Empleados] WHERE ([Nid_Empleado] = @Nid_Empleado)"

        ' Establece el parámetro
        DS_ModificarEmpleado.SelectParameters.Clear()
        DS_ModificarEmpleado.SelectParameters.Add("Nid_Empleado", selectedEmployeeID.ToString())

        ' Realiza la consulta
        Dim dvEmpleado As DataView = DirectCast(DS_ModificarEmpleado.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dvEmpleado IsNot Nothing AndAlso dvEmpleado.Count > 0 Then
            TxtModificarNumeroEmpleado.Text = dvEmpleado.Table.Rows(0)("Nid_Empleado").ToString()
            TxtModificarNombreEmpleado.Text = dvEmpleado.Table.Rows(0)("N_Nombre").ToString()
            TxtModificarApellidoPaEmpleado.Text = dvEmpleado.Table.Rows(0)("N_ApellidoPa").ToString()
            TxtModificarApellidoMaEmpleado.Text = dvEmpleado.Table.Rows(0)("N_ApellidoMa").ToString()
            DdlModificarPuestoEmpleado.SelectedValue = dvEmpleado.Table.Rows(0)("ID_Cargo").ToString()
            TxtModificarTelefonoEmpleado.Text = dvEmpleado.Table.Rows(0)("N_Telefono").ToString()
            TxtModificarCorreoEmpleado.Text = dvEmpleado.Table.Rows(0)("N_Coreo").ToString()
            ' Ajusta los demás campos según tu estructura de datos
            ' Muestra la fecha en el formato del campo
            Dim fechaRegistroEmpleado As DateTime
            If DateTime.TryParse(dvEmpleado.Table.Rows(0)("N_FechaRegistro").ToString(), fechaRegistroEmpleado) Then
                TxtModificarFechaRegEmpleado.Text = fechaRegistroEmpleado.ToString("yyyy-MM-dd")
            End If
            ' ... y así sucesivamente para los demás campos
            DdlModificarEstadoEmpleado.SelectedValue = dvEmpleado.Table.Rows(0)("ID_Estado").ToString()
        End If

        ' Muestra el panel de modificación
        PanelFromEditarEmpleado.Visible = True

    End Sub

    Protected Sub BtnCerrarModMascota_Click(sender As Object, e As EventArgs) Handles BtnCerrarModMascota.Click
        PanelFromEditarEmpleado.Visible = False
        TxtModificarNumeroEmpleado.Text = ""
        TxtModificarNombreEmpleado.Text = ""
        TxtModificarApellidoPaEmpleado.Text = ""
        TxtModificarApellidoMaEmpleado.Text = ""
        DdlModificarPuestoEmpleado.ClearSelection()
        TxtModificarTelefonoEmpleado.Text = ""
        TxtModificarCorreoEmpleado.Text = ""
        TxtModificarFechaRegEmpleado.Text = ""
        DdlModificarEstadoEmpleado.ClearSelection()
    End Sub

    Protected Sub BtnActualizarMascota_Click(sender As Object, e As EventArgs) Handles BtnActualizarMascota.Click
        ' Actualiza la información en la base de datos
        DS_ModificarEmpleado.Update()
        ' Muestra un mensaje de éxito
        Dim script As String = "alert('Empleado(a) actualizado(a) correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirige después del mensaje si es necesario
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        ' Vuelve a cargar los datos del GridView
        GVModEmpleados.DataBind()
    End Sub

    Protected Sub TxtBuscarPorNombre_TextChanged(sender As Object, e As EventArgs) Handles TxtBuscarPorNombre.TextChanged
        BuscarEmpleadoPorNombre(TxtBuscarPorNombre.Text)
    End Sub

    Protected Sub BtnBuscarPorNombre_Click(sender As Object, e As EventArgs)
        ' Restablece la consulta general de la GridView
        DS_ConsultarEmpleadosGV.SelectCommand = "SELECT Tb_Empleados.Nid_Empleado, Tb_Empleados.N_Nombre, Tb_Empleados.N_ApellidoPa, Tb_Empleados.N_ApellidoMa, Tb_Empleados.ID_Cargo, Cat_Roles.N_Rol, Tb_Empleados.N_Telefono, Tb_Empleados.N_Coreo, Tb_Empleados.ID_Estado, Cat_EstadoUsuario.N_Estado, Tb_Empleados.N_FechaRegistro FROM Tb_Empleados INNER JOIN Cat_EstadoUsuario ON Tb_Empleados.ID_Estado = Cat_EstadoUsuario.Nid_Estado INNER JOIN Cat_Roles ON Tb_Empleados.ID_Cargo = Cat_Roles.Nid_Rol"
        GridView1.DataBind()
    End Sub

    Private Sub BuscarEmpleadoPorNombre(nombre As String)
        ' Modifica la consulta SQL para filtrar por el nombre del empleado
        DS_ConsultarEmpleadosGV.SelectCommand = "SELECT Tb_Empleados.Nid_Empleado, Tb_Empleados.N_Nombre, Tb_Empleados.N_ApellidoPa, Tb_Empleados.N_ApellidoMa, Tb_Empleados.ID_Cargo, Cat_Roles.N_Rol, Tb_Empleados.N_Telefono, Tb_Empleados.N_Coreo, Tb_Empleados.ID_Estado, Cat_EstadoUsuario.N_Estado, Tb_Empleados.N_FechaRegistro FROM Tb_Empleados INNER JOIN Cat_EstadoUsuario ON Tb_Empleados.ID_Estado = Cat_EstadoUsuario.Nid_Estado INNER JOIN Cat_Roles ON Tb_Empleados.ID_Cargo = Cat_Roles.Nid_Rol WHERE Tb_Empleados.N_Nombre LIKE '%' + @nombre + '%'"
        DS_ConsultarEmpleadosGV.SelectParameters.Clear()
        DS_ConsultarEmpleadosGV.SelectParameters.Add("nombre", nombre)
        GridView1.DataBind()
    End Sub
End Class