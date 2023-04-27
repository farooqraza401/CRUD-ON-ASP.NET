<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="app31_08022022.EmployeeForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
               <center>
            <table>

                <tr style="background-color:dodgerblue;color:white;text-align:center;height:40px">
                    <td colspan="2">Employee Form</td>
                    
                </tr>

                <tr>
                    <td>Name :<span style="color:red;">*</span></td>
                    <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvname" runat="server" ValidationGroup="vg" ControlToValidate="txtname" 
                            ErrorMessage="Please enter your name !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Gender :<span style="color:red;">*</span></td>
                    <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="female" Value="2"></asp:ListItem>
                        <asp:ListItem Text="other" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvgender" runat="server" ValidationGroup="vg" ControlToValidate="rblgender" 
                            ErrorMessage="Please select your gender !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Designation :<span style="color:red;">*</span></td>
                    <td><asp:DropDownList ID="ddldesignation" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvdesignation" runat="server" ValidationGroup="vg" InitialValue="0" ControlToValidate="ddldesignation" 
                            ErrorMessage="Please select your designation !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Salary :<span style="color:red;">*</span></td>
                    <td><asp:TextBox ID="txtsalary" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvsalary" runat="server" ValidationGroup="vg" ControlToValidate="txtsalary" 
                            ErrorMessage="Please enter your salary !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td>Email :<span style="color:red;">*</span></td>
                    <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvemail" runat="server" ValidationGroup="vg" ControlToValidate="txtemail" 
                            ErrorMessage="Please enter your email !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td>Mobile :<span style="color:red;">*</span></td>
                    <td><asp:TextBox ID="txtmobileno" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvmobileno" runat="server" ValidationGroup="vg" ControlToValidate="txtmobileno" 
                        ErrorMessage="Please enter your mobile number !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revmobileno" runat="server" ValidationGroup="vg" ControlToValidate="txtmobileno" ErrorMessage="Mobile number shoud be 10 digits and start with 7 or 8 or 9 !!" Display="None" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>

                    </td>
                </tr>

                <tr>
                    <td>Qualification :<span style="color:red;">*</span></td>
                    <td><asp:DropDownList ID="ddlqualification" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvqualification" runat="server" ValidationGroup="vg" InitialValue="0" ControlToValidate="ddlqualification" 
                            ErrorMessage="Please select your qualification !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                

                <tr>
                    <td>Country :<span style="color:red;">*</span></td>
                    <td><asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvcountry" runat="server" ValidationGroup="vg" InitialValue="0" ControlToValidate="ddlcountry" 
                            ErrorMessage="Please select your country !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>City :<span style="color:red;">*</span></td>
                    <td><asp:DropDownList ID="ddlcity" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvcity" runat="server" ValidationGroup="vg" InitialValue="0" ControlToValidate="ddlcity" 
                            ErrorMessage="Please select your city !!" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td><asp:Button ID="btninsert" runat="server" ValidationGroup="vg" Text="Submit" OnClick="btninsert_Click" /></td>
                </tr>

                <tr style="background-color:dodgerblue;color:white;text-align:center;height:40px">
                    <td colspan="2">List Of Employees</td>
                    
                </tr>

                <asp:ValidationSummary ID="vs" runat="server" ValidationGroup="vg" ShowMessageBox="true" ShowSummary="false" />

                <tr>
                    <td></td>
                    <td><asp:GridView ID="gvwemployee" runat="server"  OnRowCommand="gvwemployee_RowCommand" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Employee ID">
                                <ItemTemplate>
                                    <%#Eval("empid") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Employee Name">
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender ">
                                <ItemTemplate>
                                    <%#Eval("gender").ToString()=="1" ? "male":Eval("gender").ToString()=="2" ? "female": "other" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Designation">
                                <ItemTemplate>
                                    <%#Eval("designation_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Salary">
                                <ItemTemplate>
                                    Rs. <%#Eval("salary") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <%#Eval("email") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <%#Eval("mobileno") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Qualification">
                                <ItemTemplate>
                                    <%#Eval("qualification_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <%#Eval("city_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Country">
                                <ItemTemplate>
                                    <%#Eval("country_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnedit" runat="server"  CommandName="EDT" CommandArgument=' <%#Eval("empid") %>' Text="Edit"></asp:LinkButton>
                                    <asp:LinkButton ID="btndelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete ?')" CommandName="DLT" CommandArgument=' <%#Eval("empid") %>' Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView></td>
                </tr>
            </table>
                   </center>
        </div>
    </form>
</body>
</html>
