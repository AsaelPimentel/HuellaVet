Public Class Mascotas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub

    Protected Sub BtnSubirNuevaMascota_Click(sender As Object, e As EventArgs) Handles BtnSubirNuevaMascota.Click
        Dim camposVacios As Boolean = False

        If String.IsNullOrEmpty(TxtSubirNombreMascota.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre (s) de la mascota');", True)
            TxtSubirNombreMascota.Focus()
            camposVacios = True
        ElseIf DdlSubirEspecieMascota.SelectedValue = "-1" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione la especie de la mascota.');", True)
            DdlSubirEspecieMascota.Focus()
            camposVacios = True
        ElseIf DdlSubirRazaMascota.SelectedValue = "-1" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione la raza de la mascota.');", True)
            DdlSubirRazaMascota.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirEdadMascota.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la edad de la mascota.');", True)
            TxtSubirEdadMascota.Focus()
            camposVacios = True
        ElseIf DdlSubirAlergiaMascota.SelectedValue = "-1" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el correo del empleado.');", True)
            DdlSubirAlergiaMascota.Focus()
            camposVacios = True
        ElseIf DdlSubirPropietarioMascota.SelectedValue = "-1" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el correo del empleado.');", True)
            DdlSubirPropietarioMascota.Focus()
            camposVacios = True
        End If
        If Not camposVacios Then
            'Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_SubirMascota.Insert()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Empleado registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If
    End Sub

    Protected Sub BtnCancelarSubirMascota_Click(sender As Object, e As EventArgs) Handles BtnCancelarSubirMascota.Click
        PnlAdminMascota.Visible = True
        PanelSubirMascota.Visible = False
        TxtSubirNombreMascota.Text = ""
        DdlSubirEspecieMascota.ClearSelection()
        DdlSubirRazaMascota.ClearSelection()
        TxtSubirEdadMascota.Text = ""
        DdlSubirAlergiaMascota.ClearSelection()
        DdlSubirPropietarioMascota.ClearSelection()
    End Sub

    Protected Sub ImgBtnSubirMascota_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnSubirMascota.Click
        PnlAdminMascota.Visible = False
        PanelSubirMascota.Visible = True
    End Sub

    Protected Sub BtnCerrarConlta_Click(sender As Object, e As EventArgs) Handles BtnCerrarConlta.Click
        PnlAdminMascota.Visible = True
        PanelConsultarMascotas.Visible = False
    End Sub

    Protected Sub ImgBtnConsultarMascota_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnConsultarMascota.Click
        PanelConsultarMascotas.Visible = True
        PnlAdminMascota.Visible = False
    End Sub

    Protected Sub BtnCerrarModificacion_Click(sender As Object, e As EventArgs) Handles BtnCerrarModificacion.Click
        PanelModificarMascotas.Visible = False
        PnlAdminMascota.Visible = True
    End Sub

    Protected Sub ImgBtnEditarMascota_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnEditarMascota.Click
        PnlAdminMascota.Visible = False
        PanelModificarMascotas.Visible = True
    End Sub
    Protected Sub TxtBuscarPorNombre_TextChanged(sender As Object, e As EventArgs) Handles TxtBuscarPorNombre.TextChanged
        BuscarMascotaPorNombre(TxtBuscarPorNombre.Text)
    End Sub
    Protected Sub BtnBuscarPorNombre_Click(sender As Object, e As EventArgs)
        ' Restablece la consulta general de la GridView
        GVConsultarMascotas.DataSourceID = "DS_ConsultarMascotas"
        GVConsultarMascotas.DataBind()
    End Sub

    Private Sub BuscarMascotaPorNombre(nombre As String)
        ' Modify the SQL query to filter by the pet's name
        DS_ConsultarMascotas.SelectCommand = "SELECT Tb_Mascotas.Nid_Mascota, Tb_Mascotas.N_Nombre, Tb_Mascotas.ID_Especie, Cat_Especies.N_Especie, Tb_Mascotas.ID_Raza, Cat_Razas.N_Raza, Tb_Mascotas.N_Edad, Tb_Mascotas.ID_Alergias, Cat_Alergias.N_Aelrgia, Tb_Mascotas.ID_Propietario, Tb_Propietario.N_Coreo, Tb_Mascotas.N_FechaRegistro FROM Tb_Mascotas INNER JOIN Cat_Especies ON Tb_Mascotas.ID_Especie = Cat_Especies.Nid_Especie INNER JOIN Cat_Razas ON Tb_Mascotas.ID_Raza = Cat_Razas.Nid_Raza INNER JOIN Cat_Alergias ON Tb_Mascotas.ID_Alergias = Cat_Alergias.Nid_Alergia INNER JOIN Tb_Propietario ON Tb_Mascotas.ID_Propietario = Tb_Propietario.Nid_Propietario WHERE Tb_Mascotas.N_Nombre LIKE '%' + @nombre + '%'"
        DS_ConsultarMascotas.SelectParameters.Clear()
        DS_ConsultarMascotas.SelectParameters.Add("nombre", nombre)
        GVConsultarMascotas.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' Obtén el ID de la mascota de la fila seleccionada
        Dim selectedMascotaID As Integer = Convert.ToInt32(GridView1.SelectedDataKey.Value)

        ' Filtra los datos usando el ID de la mascota
        DS_ModificarMascota.SelectCommand = "SELECT * FROM [Tb_Mascotas] WHERE ([Nid_Mascota] = @Nid_Mascota)"

        ' Establece el parámetro
        DS_ModificarMascota.SelectParameters.Clear()
        DS_ModificarMascota.SelectParameters.Add("Nid_Mascota", selectedMascotaID.ToString())

        ' Realiza la consulta
        Dim dvMascota As DataView = DirectCast(DS_ModificarMascota.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dvMascota IsNot Nothing AndAlso dvMascota.Count > 0 Then
            TxtModificarRegMascota.Text = dvMascota.Table.Rows(0)("Nid_Mascota").ToString()
            TxtModificarNombreMascota.Text = dvMascota.Table.Rows(0)("N_Nombre").ToString()
            ' Resto de campos a actualizar...
            DdlModificarEspecieMascota.SelectedValue = dvMascota.Table.Rows(0)("ID_Especie").ToString()
            DdlModificarRazaMascota.SelectedValue = dvMascota.Table.Rows(0)("ID_Raza").ToString()
            TxtModifciarEdadMascota.Text = dvMascota.Table.Rows(0)("N_Edad").ToString()
            DdlModificarAlergiaMascota.SelectedValue = dvMascota.Table.Rows(0)("ID_Alergias").ToString()
            DdlModificarPropietarioMascota.SelectedValue = dvMascota.Table.Rows(0)("ID_Propietario").ToString()
            TxtModificarFechaRegMascota.Text = Convert.ToDateTime(dvMascota.Table.Rows(0)("N_FechaRegistro")).ToString("yyyy-MM-dd")
            ' Muestra el panel de modificación de mascotas
            PanelFormEditarMascota.Visible = True
        End If
    End Sub

    Protected Sub BtnCerrarModMascota_Click(sender As Object, e As EventArgs) Handles BtnCerrarModMascota.Click
        PanelFormEditarMascota.Visible = False
    End Sub

    Protected Sub BtnActualizarMascota_Click(sender As Object, e As EventArgs) Handles BtnActualizarMascota.Click
        ' Actualiza la información en la base de datos
        DS_ModificarMascota.Update()
        ' Muestra un mensaje de éxito
        Dim script As String = "alert('Mascota actualizada correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirige después del mensaje si es necesario
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        ' Vuelve a cargar los datos del GridView
        GridView1.DataBind()
    End Sub
End Class