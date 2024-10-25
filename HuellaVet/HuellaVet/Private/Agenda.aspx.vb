Public Class Agenda
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        DS_RegistrarCita.Insert()
        ' Registrando el script JavaScript para mostrar el mensaje
        Dim script As String = "alert('Cita registrada correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirigir después del mensaje si es necesario
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
    End Sub

    'Protected Sub Ddl_SelectPropietario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Ddl_SelectPropietario.SelectedIndexChanged
    '    ' Forzar la recarga del DropDownList de mascotas
    '    Ddl_SelectMascota.DataBind()
    'End Sub
End Class