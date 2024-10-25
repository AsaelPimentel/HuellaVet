Public Class Medicamentos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub

    Protected Sub ImgBtnRegMedicamento_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnRegMedicamento.Click
        PaneelNuevoMedicamento.Visible = True
        PnlAdminMedicamento.Visible = False
    End Sub

    Protected Sub BtnCancelarNuevoProducto_Click(sender As Object, e As EventArgs) Handles BtnCancelarNuevoProducto.Click
        PaneelNuevoMedicamento.Visible = False
        PnlAdminMedicamento.Visible = True
    End Sub

    Protected Sub BtnSubirNuevoProducto_Click(sender As Object, e As EventArgs) Handles BtnSubirNuevoProducto.Click
        Dim camposVacios As Boolean = False

        If String.IsNullOrEmpty(TxtSubirNombreMedicamento.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre del medicamento.');", True)
            TxtSubirNombreMedicamento.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(DdlSubirTipoMedicamento.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione el tipo de medicamento.');", True)
            DdlSubirTipoMedicamento.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirPrecioMedicamento.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el precio del medicamento.');", True)
            TxtSubirPrecioMedicamento.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirUnidadesMedicamento.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la cantidad de unidades del medicamento.');", True)
            TxtSubirUnidadesMedicamento.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirLoteMedicamento.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el número de lote del medicamento.');", True)
            TxtSubirLoteMedicamento.Focus()
            camposVacios = True
        ElseIf txtSubirFechaCducidadMedicamento.Text = "" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione la fecha de caducidad del medicamento.');", True)
            txtSubirFechaCducidadMedicamento.Focus()
            camposVacios = True
        ElseIf FUPSubirImagenMedicamento.HasFile = False Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione una imagen para el medicamento.');", True)
            camposVacios = True
        End If

        If Not camposVacios Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_SubirMedicamento.Insert()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Medicamento registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If

    End Sub

    Protected Sub ImgBtnBscMedicamento_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnBscMedicamento.Click
        PnlAdminMedicamento.Visible = False
        PaneelNuevoMedicamento.Visible = False
        PanelConsultarMedicamentos.Visible = True
    End Sub

    Protected Sub BtnCerrarConlta_Click(sender As Object, e As EventArgs) Handles BtnCerrarConlta.Click
        PanelConsultarMedicamentos.Visible = False
        PnlAdminMedicamento.Visible = True
    End Sub

    Protected Sub TxtBuscarPorNombre_TextChanged(sender As Object, e As EventArgs) Handles TxtBuscarPorNombre.TextChanged
        BuscarProductoPorNombre(TxtBuscarPorNombre.Text)
    End Sub

    Protected Sub BtnBuscarPorNombre_Click(sender As Object, e As EventArgs)
        ' Restablece la consulta general de la GridView
        GVMedicamentos.DataSourceID = "DS_ConsultarMedicamentos"
        GVMedicamentos.DataBind()
    End Sub

    Private Sub BuscarProductoPorNombre(nombre As String)
        ' Modifica la consulta SQL para filtrar por el nombre del producto
        DS_ConsultarMedicamentos.SelectCommand = "SELECT Tb_ProductosFarmacia.Nid_Medicamento, Tb_ProductosFarmacia.N_Nombre, Tb_ProductosFarmacia.N_Tipo, Cat_TipoMed.N_Tipo AS Expr1, Tb_ProductosFarmacia.N_Precio, Tb_ProductosFarmacia.N_Unidades, Tb_ProductosFarmacia.N_Lote, Tb_ProductosFarmacia.N_FechaCaducidad, Tb_ProductosFarmacia.N_Imagen FROM Tb_ProductosFarmacia INNER JOIN Cat_TipoMed ON Tb_ProductosFarmacia.N_Tipo = Cat_TipoMed.Nid_TipoMed WHERE Tb_ProductosFarmacia.N_Nombre LIKE '%' + @nombre + '%'"
        DS_ConsultarMedicamentos.SelectParameters.Clear()
        DS_ConsultarMedicamentos.SelectParameters.Add("nombre", nombre)
        GVMedicamentos.DataBind()
    End Sub

    Protected Sub BtnCerrarModMedicamento_Click(sender As Object, e As EventArgs) Handles BtnCerrarModMedicamento.Click
        PanelFrmEditarMedicamento.Visible = False
        TxtEditarCaducidadMed.Text = ""
        TxtEditarLoteMed.Text = ""
        TxtEditarNombreMed.Text = ""
        TxtEditarPrecioMed.Text = ""
        TxtEditarSerieMed.Text = ""
        TxtEditarUnidadesMed.Text = ""
        DdlEditarTipoMed.ClearSelection()
    End Sub

    Protected Sub GVEditarMedicamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVEditarMedicamento.SelectedIndexChanged
        ' Obtén el ID del medicamento de la fila seleccionada
        Dim selectedMedicamentoID As Integer = Convert.ToInt32(GVEditarMedicamento.SelectedDataKey.Value)

        ' Filtra los datos usando el ID del medicamento
        DS_EditarMedicamento.SelectCommand = "SELECT * FROM [Tb_ProductosFarmacia] WHERE ([Nid_Medicamento] = @Nid_Medicamento)"

        ' Establece el parámetro
        DS_EditarMedicamento.SelectParameters.Clear()
        DS_EditarMedicamento.SelectParameters.Add("Nid_Medicamento", selectedMedicamentoID.ToString())

        ' Realiza la consulta
        Dim dvMedicamento As DataView = DirectCast(DS_EditarMedicamento.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dvMedicamento IsNot Nothing AndAlso dvMedicamento.Count > 0 Then
            TxtEditarSerieMed.Text = dvMedicamento.Table.Rows(0)("Nid_Medicamento").ToString()
            TxtEditarNombreMed.Text = dvMedicamento.Table.Rows(0)("N_Nombre").ToString()
            DdlEditarTipoMed.SelectedValue = dvMedicamento.Table.Rows(0)("N_Tipo").ToString()
            TxtEditarPrecioMed.Text = dvMedicamento.Table.Rows(0)("N_Precio").ToString()
            TxtEditarUnidadesMed.Text = dvMedicamento.Table.Rows(0)("N_Unidades").ToString()
            TxtEditarLoteMed.Text = dvMedicamento.Table.Rows(0)("N_Lote").ToString()
            Dim fechaRegistroMed As DateTime
            If DateTime.TryParse(dvMedicamento.Table.Rows(0)("N_FechaCaducidad").ToString(), fechaRegistroMed) Then
                TxtEditarCaducidadMed.Text = fechaRegistroMed.ToString("yyyy-MM-dd")
            End If
            ' Muestra el panel de edición de medicamento
            PanelFrmEditarMedicamento.Visible = True
        End If
    End Sub

    Protected Sub BtnActualizarMedicamento_Click(sender As Object, e As EventArgs) Handles BtnActualizarMedicamento.Click
        ' Obtén el ID del producto que se está editando
        Dim selectedProductID As Integer = Convert.ToInt32(TxtEditarSerieMed.Text)

        ' Actualiza la información en la base de datos
        DS_EditarMedicamento.Update()
        ' Muestra un mensaje de éxito
        Dim script As String = "alert('Producto actualizado correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirige después del mensaje si es necesario
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        ' Vuelve a cargar los datos del GridView
        GVEditarMedicamento.DataBind()
        ' Oculta el panel de edición después de la actualización
        PanelFrmEditarMedicamento.Visible = False
    End Sub

    Protected Sub ImgBtnModMedicamento_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnModMedicamento.Click
        PanelEditarMedicamentos.Visible = True
        PnlAdminMedicamento.Visible = False
    End Sub
End Class