Public Class Administracion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnAdminEmpleados_Click(sender As Object, e As ImageClickEventArgs) Handles BtnAdminEmpleados.Click
        Response.Redirect("Empleados.aspx")
    End Sub

    Protected Sub BtnAdminUsuarios_Click(sender As Object, e As ImageClickEventArgs) Handles BtnAdminUsuarios.Click
        Response.Redirect("Usuarios.aspx")
    End Sub

    Protected Sub BtnAdminProductos_Click(sender As Object, e As ImageClickEventArgs) Handles BtnAdminProductos.Click
        Response.Redirect("Productos.aspx")
    End Sub

    Protected Sub BtnAdminFarmacos_Click(sender As Object, e As ImageClickEventArgs) Handles BtnAdminFarmacos.Click
        Response.Redirect("Medicamentos.aspx")
    End Sub

    Protected Sub BtnAdminMascotas_Click(sender As Object, e As ImageClickEventArgs) Handles BtnAdminMascotas.Click
        Response.Redirect("Mascotas.aspx")
    End Sub
End Class