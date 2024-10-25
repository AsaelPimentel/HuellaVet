Public Class _Default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("rol") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

End Class