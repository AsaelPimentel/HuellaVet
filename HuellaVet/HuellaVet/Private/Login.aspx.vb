Public Class Login1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If txtUsername.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('Por favor ingrese su usuario');", True) 'se muestra el modal de alerta
            txtUsername.Focus() 'resaltamos el campo
            txtUsername.Text = "" ' limpiamos la informacion del campo
            txtPassword.Text = "" ' limpiamos la informacion del campo
        ElseIf txtPassword.Text = "" Then
            'se muestra el modal de alerta
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('Por favor ingrese su contraseña');", True)
            txtPassword.Focus() 'resaltamos el campo
            txtUsername.Text = "" ' limpiamos la informacion del campo
            txtPassword.Text = "" ' limpiamos la informacion del campo
        Else
            Dim dv As DataView = DirectCast(DS_Login.Select(DataSourceSelectArguments.Empty), DataView) 'creacion de la variable de la consulta
            If dv IsNot Nothing And dv.Count <> 0 Then 'creacion de la validacion
                Session("rol") = "1" 'si es correcta la validacion genera una variable de sesion llamada rol
                Response.Redirect("Default.aspx") 'redirecciona a una pagina una vez creada la vairable de sesion
                DS_Login.Update()
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('El usuario y/o contraseña incorrectos.');", True)
                txtUsername.Text = "" ' limpiamos la informacion del campo
                txtPassword.Text = "" ' limpiamos la informacion del campo
            End If
        End If
    End Sub
End Class