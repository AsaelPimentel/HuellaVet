Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnIniciarSesion_Click(sender As Object, e As EventArgs) Handles btnIniciarSesion.Click
        Dim dv As DataView = DirectCast(DS_LoginUser.Select(DataSourceSelectArguments.Empty), DataView)
        If dv IsNot Nothing AndAlso dv.Count <> 0 Then
            Session("Usuario") = "1"
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub BtnCrearCuenta_Click(sender As Object, e As EventArgs) Handles BtnCrearCuenta.Click
        DS_LoginUser.Insert()
    End Sub
End Class