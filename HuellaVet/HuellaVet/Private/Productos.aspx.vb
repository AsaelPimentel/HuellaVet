Public Class Productoss
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImgBtnVolver_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnVolver.Click
        Response.Redirect("Administracion.aspx")
    End Sub

    Protected Sub ImgBtnRegProducto_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnRegProducto.Click
        PnlAdminProductos.Visible = False
        PanelNuevoProducto.Visible = True
        PanelBuscarProducto.Visible = False
    End Sub

    Protected Sub BtnSubirNuevoProducto_Click(sender As Object, e As EventArgs) Handles BtnSubirNuevoProducto.Click
        Dim camposVacios As Boolean = False

        If String.IsNullOrEmpty(TxtSubirNombreProducto.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el nombre del producto.');", True)
            TxtSubirNombreProducto.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(DdlSubirTipoProducto.SelectedValue) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione el tipo de producto.');", True)
            DdlSubirTipoProducto.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirDescripcionProducto.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese la descripción del producto.');", True)
            TxtSubirDescripcionProducto.Focus()
            camposVacios = True
        ElseIf String.IsNullOrEmpty(TxtSubirPrecioProducto.Text) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese el precio del producto.');", True)
            TxtSubirPrecioProducto.Focus()
            camposVacios = True
        ElseIf FUPSubirImagenProducto.HasFile = False Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Seleccione una imagen para el producto.');", True)
            camposVacios = True
        End If
        If Not camposVacios Then
            ' Si no hay campos vacíos, procede con la inserción de datos en la base de datos
            DS_SubirProdcuto.Insert()
            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Producto registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        End If
    End Sub

    Protected Sub BtnCancelarNuevoProducto_Click(sender As Object, e As EventArgs) Handles BtnCancelarNuevoProducto.Click
        PnlAdminProductos.Visible = True
        PanelNuevoProducto.Visible = False
        PanelBuscarProducto.Visible = False
    End Sub

    Protected Sub TxtBuscarPorNombre_TextChanged(sender As Object, e As EventArgs) Handles TxtBuscarPorNombre.TextChanged
        BuscarProductoPorNombre(TxtBuscarPorNombre.Text)
    End Sub

    Protected Sub BtnBuscarPorNombre_Click(sender As Object, e As EventArgs)
        ' Restablece la consulta general de la GridView
        GVConsultarProductos.DataSourceID = "DS_ConsultarProductos"
        GVConsultarProductos.DataBind()
    End Sub

    Private Sub BuscarProductoPorNombre(nombre As String)
        ' Modifica la consulta SQL para filtrar por el nombre del producto
        DS_ConsultarProductos.SelectCommand = "SELECT Tb_ProductosGenerales.Nid_Producto, Tb_ProductosGenerales.N_Nombre, Tb_ProductosGenerales.N_Tipo, Cat_TipoPro.N_Tipo AS [Tipo de producto], Cat_TipoPro.N_Descripcion AS [Descricion Producito], Tb_ProductosGenerales.N_Descripcion, Tb_ProductosGenerales.N_Precio, Tb_ProductosGenerales.N_Imagen FROM Tb_ProductosGenerales INNER JOIN Cat_TipoPro ON Tb_ProductosGenerales.N_Tipo = Cat_TipoPro.Nid_TipoPro WHERE Tb_ProductosGenerales.N_Nombre LIKE '%' + @nombre + '%'"
        DS_ConsultarProductos.SelectParameters.Clear()
        DS_ConsultarProductos.SelectParameters.Add("nombre", nombre)
        GVConsultarProductos.DataBind()
    End Sub

    Protected Sub BtnCerrarConlta_Click(sender As Object, e As EventArgs) Handles BtnCerrarConlta.Click
        PnlAdminProductos.Visible = True
        PanelNuevoProducto.Visible = False
        PanelBuscarProducto.Visible = False
    End Sub

    Protected Sub ImgBtnBusProducto_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnBusProducto.Click
        PanelBuscarProducto.Visible = True
        PnlAdminProductos.Visible = False
        PanelNuevoProducto.Visible = False
    End Sub

    Protected Sub ImgBtnModProducto_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnModProducto.Click
        PanelEditarProducto.Visible = True
        PanelBuscarProducto.Visible = False
        PanelNuevoProducto.Visible = False
        PnlAdminProductos.Visible = False
    End Sub

    Protected Sub BtnCerrarModProducto_Click(sender As Object, e As EventArgs) Handles BtnCerrarModProducto.Click
        PanelFrmEditarProducto.Visible = False
        TxtEditarIdProducto.Text = ""
        TxtEditarNombreProducto.Text = ""
        DdlEditarTipoProducto.ClearSelection()
        TxtEditarDescProducto.Text = ""
        TxtEditarPrecioProducto.Text = ""
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' Obtén el ID del producto de la fila seleccionada
        Dim selectedProductID As Integer = Convert.ToInt32(GridView1.SelectedDataKey.Value)

        ' Filtra los datos usando el ID del producto
        DS_EditarProducto.SelectCommand = "SELECT * FROM [Tb_ProductosGenerales] WHERE ([Nid_Producto] = @Nid_Producto)"

        ' Establece el parámetro
        DS_EditarProducto.SelectParameters.Clear()
        DS_EditarProducto.SelectParameters.Add("Nid_Producto", selectedProductID.ToString())

        ' Realiza la consulta
        Dim dvProducto As DataView = DirectCast(DS_EditarProducto.Select(DataSourceSelectArguments.Empty), DataView)

        ' Verifica si hay datos y actualiza los campos del formulario
        If dvProducto IsNot Nothing AndAlso dvProducto.Count > 0 Then
            TxtEditarIdProducto.Text = dvProducto.Table.Rows(0)("Nid_Producto").ToString()
            TxtEditarNombreProducto.Text = dvProducto.Table.Rows(0)("N_Nombre").ToString()
            DdlEditarTipoProducto.SelectedValue = dvProducto.Table.Rows(0)("N_Tipo").ToString()
            TxtEditarDescProducto.Text = dvProducto.Table.Rows(0)("N_Descripcion").ToString()
            TxtEditarPrecioProducto.Text = dvProducto.Table.Rows(0)("N_Precio").ToString()

            ' La imagen se maneja de manera diferente debido a que es un FileUpload
            ' Aquí se asume que la imagen ya está guardada en el servidor y se actualiza el FileUpload con la ruta de la imagen
            Dim imagenProducto As Byte() = DirectCast(dvProducto.Table.Rows(0)("N_Imagen"), Byte())
            If imagenProducto IsNot Nothing AndAlso imagenProducto.Length > 0 Then
                FileUploadImagenProducto.Attributes("data-filename") = "ImagenProducto.jpg" ' Nombre de archivo para mostrar en el cliente
                ViewState("ImagenProducto") = imagenProducto
                ' También puedes convertir la imagen a base64 para mostrarla directamente en una etiqueta img si lo prefieres
                ' ImgPortada.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(imagenProducto)
            End If

            ' Muestra el panel de edición de producto
            PanelFrmEditarProducto.Visible = True
        End If
    End Sub

    Protected Sub BtnActualizarProdcuto_Click(sender As Object, e As EventArgs) Handles BtnActualizarProdcuto.Click
        ' Obtén el ID del producto que se está editando
        Dim selectedProductID As Integer = Convert.ToInt32(TxtEditarIdProducto.Text)

        ' Actualiza la información en la base de datos
        DS_EditarProducto.Update()
        ' Muestra un mensaje de éxito
        Dim script As String = "alert('Producto actualizado correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirige después del mensaje si es necesario
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        ' Vuelve a cargar los datos del GridView
        GridView1.DataBind()
        ' Oculta el panel de edición después de la actualización
        PanelFrmEditarProducto.Visible = False
    End Sub
End Class