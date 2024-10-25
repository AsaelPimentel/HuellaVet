Public Class Usuariosaspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub

    Protected Sub ImgBtnRegUsuario_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnRegUsuario.Click
        PaneelNuevoUsuario.Visible = True

        PnlAdminUsuarios.Visible = False
    End Sub

    Protected Sub BtnCancelarNuevoUser_Click(sender As Object, e As EventArgs) Handles BtnCancelarNuevoUser.Click
        PnlAdminUsuarios.Visible = True

        PaneelNuevoUsuario.Visible = False
    End Sub

    Protected Sub BtnSubirNuevoUser_Click(sender As Object, e As EventArgs) Handles BtnSubirNuevoUser.Click
        Dim camposVacios As Boolean = False

        If String.IsNullOrEmpty(TxtSubirUsuario.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre de usuario.');", True)
            TxtSubirUsuario.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirPassword.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese una contraseña.');", True)
            TxtSubirPassword.Focus()
            camposVacios = True
        End If

        If Not camposVacios Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_RegistrarUsuario.Insert()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Usuario registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If
    End Sub

    Protected Sub TxtBuscarPorNombre_TextChanged(sender As Object, e As EventArgs) Handles TxtBuscarPorNombre.TextChanged
        BuscarUsuarioPorNombre(TxtBuscarPorNombre.Text)
    End Sub

    Protected Sub BtnBuscarPorNombre_Click(sender As Object, e As EventArgs)
        ' Restablece la consulta general de la GridView
        GVConsultarEmpleado.DataSourceID = "DS_ConsultarUsuarios"
        GVConsultarEmpleado.DataBind()
    End Sub

    Private Sub BuscarUsuarioPorNombre(nombre As String)
        ' Modifica la consulta SQL para filtrar por el nombre del usuario
        DS_ConsultarUsuarios.SelectCommand = "SELECT Tb_Usuarios.Nid_Usuario, Tb_Usuarios.ID_Empleado, Tb_Empleados.N_Nombre, Tb_Empleados.N_ApellidoPa, Tb_Empleados.N_ApellidoMa, Tb_Usuarios.N_Usuario, Tb_Usuarios.N_Password, Tb_Usuarios.ID_Rol, Cat_Roles.N_Rol, Tb_Usuarios.N_FechaRegistro, Tb_Usuarios.N_FechaLogin FROM Tb_Usuarios INNER JOIN Tb_Empleados ON Tb_Usuarios.ID_Empleado = Tb_Empleados.Nid_Empleado INNER JOIN Cat_Roles ON Tb_Usuarios.ID_Rol = Cat_Roles.Nid_Rol WHERE Tb_Usuarios.N_Usuario LIKE '%' + @nombre + '%'"
        DS_ConsultarUsuarios.SelectParameters.Clear()
        DS_ConsultarUsuarios.SelectParameters.Add("nombre", nombre)
        GVConsultarEmpleado.DataBind()
    End Sub

    Protected Sub ImgBtnBusUsuario_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnBusUsuario.Click
        PanelConsultarUsuarios.Visible = True
        PnlAdminUsuarios.Visible = False
        PaneelNuevoUsuario.Visible = False
        PanelEditarUsuario.Visible = False
    End Sub

    Protected Sub BtnCerrarConlta_Click(sender As Object, e As EventArgs) Handles BtnCerrarConlta.Click
        PanelConsultarUsuarios.Visible = False
        PaneelNuevoUsuario.Visible = False
        PnlAdminUsuarios.Visible = True
        PanelEditarUsuario.Visible = False
    End Sub

    Protected Sub ImgBtnModUsuario_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnModUsuario.Click
        PanelEditarUsuario.Visible = True
        PnlAdminUsuarios.Visible = False
        PanelConsultarUsuarios.Visible = False
        PaneelNuevoUsuario.Visible = False
    End Sub

    Protected Sub BtnCerrarModUsuario_Click(sender As Object, e As EventArgs) Handles BtnCerrarModUsuario.Click
        PanelFormditarUsuario.Visible = False
        TxtModificarNumeroUsuario.Text = ""
        DdlModificarEmpleadoUsuario.ClearSelection()
        TxtModificarNombreUsuario.Text = ""
        TxtModificarPasswordUsuario.Text = ""
        DdlModificarCargoUsuario.ClearSelection()
        TxtModificarFechaRegUsuario.Text = ""
    End Sub

    Protected Sub GVModUsers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVModUsers.SelectedIndexChanged
        ' Obtén el ID del usuario de la fila seleccionada
        Dim selectedUserID As Integer = Convert.ToInt32(GVModUsers.SelectedDataKey.Value)

        ' Filtra los datos usando el ID del usuario
        DS_EditarUsuario.SelectCommand = "SELECT * FROM [Tb_Usuarios] WHERE ([Nid_Usuario] = @Nid_Usuario)"

        ' Establece el parámetro
        DS_EditarUsuario.SelectParameters.Clear()
        DS_EditarUsuario.SelectParameters.Add("Nid_Usuario", selectedUserID.ToString())

        ' Realiza la consulta
        Dim dvUsuario As DataView = DirectCast(DS_EditarUsuario.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dvUsuario IsNot Nothing AndAlso dvUsuario.Count > 0 Then
            TxtModificarNumeroUsuario.Text = dvUsuario.Table.Rows(0)("Nid_Usuario").ToString()
            DdlModificarEmpleadoUsuario.SelectedValue = dvUsuario.Table.Rows(0)("ID_Empleado").ToString()
            TxtModificarNombreUsuario.Text = dvUsuario.Table.Rows(0)("N_Usuario").ToString()
            TxtModificarPasswordUsuario.Text = dvUsuario.Table.Rows(0)("N_Password").ToString()
            DdlModificarCargoUsuario.SelectedValue = dvUsuario.Table.Rows(0)("ID_Rol").ToString()
            Dim fechaRegistroUsuario As DateTime
            If DateTime.TryParse(dvUsuario.Table.Rows(0)("N_FechaRegistro").ToString(), fechaRegistroUsuario) Then
                TxtModificarFechaRegUsuario.Text = fechaRegistroUsuario.ToString("yyyy-MM-dd")
            End If
            ' Muestra el panel de edición de usuario
            PanelFormditarUsuario.Visible = True
        End If
    End Sub

    Protected Sub BtnCerrarModificacion_Click(sender As Object, e As EventArgs) Handles BtnCerrarModificacion.Click
        PnlAdminUsuarios.Visible = True
        PanelEditarUsuario.Visible = False
    End Sub

    Protected Sub BtnActualizarUsuario_Click(sender As Object, e As EventArgs) Handles BtnActualizarUsuario.Click
        ' Actualiza la información en la base de datos
        DS_EditarUsuario.Update()
        ' Muestra un mensaje de éxito
        Dim script As String = "alert('Usuario actualizado correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirige después del mensaje si es necesario
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        ' Vuelve a cargar los datos del GridView
        GVModUsers.DataBind()
    End Sub
End Class