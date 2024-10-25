Public Class Ventas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            PnlGenerales.Visible = False
            PnlMedicamentos.Visible = False
        End If
    End Sub

    Protected Sub ddlCategorias_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlCategorias.SelectedIndexChanged
        PnlGenerales.Visible = False
        PnlMedicamentos.Visible = False
        If ddlCategorias.SelectedValue = "Generales" Then
            PnlGenerales.Visible = True
        End If
        If ddlCategorias.SelectedValue = "Medicamentos" Then
            PnlMedicamentos.Visible = True
        End If
    End Sub
End Class