Public Class Reservaciones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        ' Verificar si hay una sesión de usuario activa
        If Session("Usuario") IsNot Nothing AndAlso Session("Usuario").ToString() = "1" Then
            ' Si la sesión de usuario es válida, realizar la inserción
            DS_RegistrarCita.Insert()

            ' Registrando el script JavaScript para mostrar el mensaje
            Dim script As String = "alert('Cita registrada correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)

            ' Redirigir después del mensaje si es necesario
            Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
        Else
            ' Si no hay una sesión de usuario válida, mostrar mensaje y redirigir a la página de inicio de sesión
            Dim script As String = "alert('Para agendar una cita, debe iniciar sesión.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)

            ' Redirigir a la página de inicio de sesión después del mensaje
            Response.AddHeader("REFRESH", "0;URL=Login.aspx")
        End If
    End Sub

End Class