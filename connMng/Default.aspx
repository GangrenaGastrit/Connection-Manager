<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="connMng.Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register TagPrefix="a" Namespace="DevExpress.Web.ASPxClasses" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <dx:ASPxPopupControl ClientInstanceName="pcConnectionManager" HeaderText="Настройка соединения с БД"
                    ID="pcConnectionManager" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                    Height="280px" runat="server" Width="400px" Modal="true" CloseAction="CloseButton"
                    AllowDragging="True">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <table width="100%">
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Укажите сервер БД">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        <dx:ASPxComboBox ID="cbServerList" runat="server" Width="100%" DropDownStyle="DropDown">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnFindServer" runat="server" Text="Поиск" Width="100%">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" ClientIDMode="AutoID" Text="Авторизация">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxRadioButtonList ID="rblAuthType" runat="server" AutoPostBack="True" ClientIDMode="AutoID"
                                            RepeatDirection="Vertical" RepeatLayout="Table" SelectedIndex="0" TextAlign="Right"
                                            Width="100%" OnSelectedIndexChanged="AuthTypeOnSelectedIndexChanged" Border-BorderStyle="None">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Авторизация Windows" Value="0" />
                                                <dx:ListEditItem Text="Авторизация SQL Server" Value="1" />
                                            </Items>
                                        </dx:ASPxRadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" ClientIDMode="AutoID" RenderMode="Div"
                                            Width="100%" Visible="false">
                                            <PanelCollection>
                                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                                    <table width="100%">
                                                        <tr>
                                                            <td width="50%">
                                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" ClientIDMode="AutoID" Text="Имя пользователя">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" ClientIDMode="AutoID" Text="Пароль">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="50%">
                                                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" AutoCompleteType="None" ClientIDMode="AutoID"
                                                                    HorizontalAlign="NotSet" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" AutoCompleteType="None" ClientIDMode="AutoID"
                                                                    HorizontalAlign="NotSet" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxPanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dx:ASPxButton ID="btnConnect" runat="server" ClientIDMode="AutoID" HorizontalAlign="NotSet"
                                            ImagePosition="Left" Text="Проверить подключение" VerticalAlign="NotSet" Width="100%"
                                            Wrap="False">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" ClientIDMode="AutoID" HorizontalAlign="NotSet"
                                            ImagePosition="Left" Text="Сохранить" VerticalAlign="NotSet" Width="100%" Wrap="Default">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" ClientIDMode="AutoID" HorizontalAlign="NotSet"
                                            ImagePosition="Left" Text="Отмена" VerticalAlign="NotSet" Width="100%" Wrap="Default">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div>
        <table width="100%">
            <tr>
                <td colspan="2" align="center">
                    <dx:ASPxButton ID="btnShowDialog" runat="server" Text="Соединение" OnClick="ShowDialogOnClick">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
