Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub CerrarSesionButton_Click(sender As Object, e As EventArgs) Handles CerrarSesionButton.Click
        Session.Abandon()
        Session.Remove("Usuario")
        Response.Redirect("Login.aspx")
    End Sub
End Class