Public Class SiteAdmin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CerrarSesionButton_Click(sender As Object, e As EventArgs) Handles CerrarSesionButton.Click
        Session.Abandon()
        Session.Remove("rol")
        Response.Redirect("Login.aspx")
    End Sub
End Class