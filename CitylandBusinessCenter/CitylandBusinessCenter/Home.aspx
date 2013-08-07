<%@ Page Language="C#" MasterPageFile="~/MasterPages/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CitylandBusinessCenter.Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HomeHeader" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/HomePage.css" rel="stylesheet" />
    <script type="text/javascript">
        function checkDate(sender, args) {
            var dSubtract = new Date();
            var dsub = dSubtract.setMinutes(dSubtract.getMinutes() - 1200);
            var nextDates = document.getElementById("MainMasterPageContentPlaceHolder_txtCheckOut").value;

            if (nextDates != "dd/MM/Year") {
                if (sender._selectedDate < dsub) {
                    alert("You cannot select a CheckIn earlier than today!");
                    document.getElementById("MainMasterPageContentPlaceHolder_NoOfDays").innerHTML = "0 Days";
                    sender._textbox.set_Value("dd/MM/Year");
                    return false;
                }

                var selectdate = document.getElementById("MainMasterPageContentPlaceHolder_txtCheckOut").value;
                var dateofstring = selectdate.split("/");
                var day = dateofstring[0];
                var month = dateofstring[1];
                var year = dateofstring[2];
                var successDate = month + "/" + day + "/" + year;
                var formatDate = new Date(successDate);
                var calDate = formatDate.setMinutes(formatDate.getMinutes() - 1200);
                var daydiff = Math.floor((calDate - sender._selectedDate) / (24 * 60 * 60 * 1000) + 3);
                if (daydiff < 0) {
                    alert("you can't select CheckOut earliar than Check In");
                    document.getElementById("NoOfDays").innerHTML = "0 Days";
                    document.getElementById("MainMasterPageContentPlaceHolder_txtCheckOut").value = "CheckOut Date";
                    var txtCheck = document.getElementById("MainMasterPageContentPlaceHolder_txtCheckOut");
                    txtCheck.style.color = "gray";
                    txtCheck.style.backgroundColor = "#e6e6fa";
                    return false;
                }
                var noOfday = daydiff + " " + "Days";
                document.getElementById("NoOfDays").innerHTML = noOfday;
                return false;

            }

            if (sender._selectedDate < dsub) {
                alert("You cannot select a CheckIn earlier than today!");                               
                sender._textbox.set_Value("dd/MM/Year");
                document.getElementById("MainMasterPageContentPlaceHolder_txtCheckIn").style.color = "gray";
                return false;
            }
            document.getElementById("MainMasterPageContentPlaceHolder_txtCheckIn").style.color = "black";
            return false;
        }
        function checkPreDate(sender, args) {
            var preDates = document.getElementById("MainMasterPageContentPlaceHolder_txtCheckIn").value;
            var datestring = preDates.split("/");
            var dd = datestring[0];
            var mon = datestring[1];
            var ye = datestring[2];
            var alterdate = mon + "/" + dd + "/" + ye;
            var ds = new Date(alterdate);
            var dsub1 = ds.setMinutes(ds.getMinutes());
            if (preDates == "" || preDates == "dd/MM/Year") {
                alert("Please Select Check In ...");
                sender._textbox.set_Value("dd/MM/Year");
                var fontcolor = document.getElementById("MainMasterPageContentPlaceHolder_txtCheckOut");
                fontcolor.style.color = "gray";
                return false;
            }
            else if (sender._selectedDate < dsub1) {
                alert("You cannot select a CheckOut earlier than CheckIn day!");
                sender._textbox.set_Value("");
                return false;
            }
            var selectedDays = Math.floor((sender._selectedDate - ds) / (24 * 60 * 60 * 1000) + 1);
            var noOfdays = selectedDays + " " + "Days";
            document.getElementById("NoOfDays").innerHTML = noOfdays;
            return false;
        }
    </script>
    </asp:Content>
<asp:Content ID="homePage" ContentPlaceHolderID="MainMasterPageContentPlaceHolder" runat="server">
    <table>
        <tr>
            <td>
                <img src="Images/2 Room Images/Room1.jpg" alt="room 1" class="imageCyleHome" />
            </td>
            <td>
                <p class="descriptionHome">
                    <strong class="justifytext">Cityland Business Center</strong><br />
                    <br />
                    At the Cityland Business Center,
                     each day is a celebration and you are the celebrity.
                     The global presence of the Cityland Business Center
                     chain covers 93 centers across 55 locations in India,
                     UK, USA, Maldives, Australia, Malaysia, Sri Lanka, 
                    Middle East and Africa. With world-renowned landmarks,
                     idyllic beach resorts, modern business hotels and 
                    rustic safari lodges, the hospitality and
                     luxury offered by each of the Cityland Business Center
                     has become a way of life. Each guest is treated like a king.
                    <br />
                    The serene environment and intimate settings allow 
                    each of our guests to have their own privacy and comfort.
                     At each Cityland Business Center resort, fine dining and 
                    luxurious living are the norm.






                </p>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Repeater ID="repRoomName" runat="server">
                    <HeaderTemplate>
                        <br />
                        <b class="repeaterHeader">Room Name</b>
                        <ul class="unOrder">
                    </HeaderTemplate>

                    <ItemTemplate>

                        <li>
                            <asp:LinkButton ID="lbtnItems" CssClass="repeaterContent" ToolTip="View Image" runat="server"> <%#Eval("RoomName") %> </asp:LinkButton>
                        </li>

                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <li>
                            <asp:LinkButton ID="lbtnItems" CssClass="repeaterContent" ToolTip="View Image" runat="server"> <%#Eval("RoomName") %> </asp:LinkButton>
                        </li>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
        </tr>       
        <tr>
            <td colspan="2">
                <br />
                <table class="tblDates">
                    <tr class="trHeader">
                        <td><b class="calenderHeader">Book Your Room:</b></td>
                        <td colspan="4" style="position: relative; left: 0px;">
                            <asp:Label ID="lblCheck" CssClass="lblCheck" runat="server"
                                Text="Please...Check Room is available or not ??"></asp:Label>
                            <asp:Label ID="lblCheckStatus" runat="server" Text=""
                                Style="text-align: center; font-size: larger;"></asp:Label></td>
                    </tr>
                    <tr>
                        <td rowspan="2" style="width: 150px; border-right: 2px solid black;">
                            <asp:Label ID="Label2" runat="server" Style="text-align: center; font-size: large;" Text="Select Room"></asp:Label>
                            <br />
                            <br />
                            <asp:DropDownList ID="ddlRoomList"
                                DataTextField="RoomName" DataValueField="CostPerDay" Style="height: 25px; width: 130px; position: relative; top: 2px; text-align: center;"
                                runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td rowspan="2" style="width: 206px; position: relative; left: 10px; border-right: 2px solid black;">
                            <asp:Label ID="Label3" runat="server" Style="text-align: center; font-size: large;" Text="Check In"></asp:Label>
                            <br />
                            <br />
                            <asp:TextBox ID="txtCheckIn" runat="server"
                                Style="height: 20px; width: 150px; border-radius: 5px; background-color: #e6e6fa;" ReadOnly="True"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="txtCheckInWatermarkExtender"  runat="server" Enabled="True" TargetControlID="txtCheckIn" WatermarkCssClass="waterMark" WatermarkText="dd/MM/Year">
                            </asp:TextBoxWatermarkExtender>
                            <asp:ImageButton ID="imgCheckIn" runat="server"
                                ImageUrl="~/Images/OtherImages/calendar.jpg" Style="height: 23px; width: 25px; display: inline; border-radius: 5px; position: relative; top: 7px;" />
                            <asp:CalendarExtender ID="calExtenderCheckIn" TargetControlID="txtCheckIn" PopupButtonID="imgCheckIn" Format="dd/MM/yyyy" runat="server" OnClientDateSelectionChanged="checkDate"></asp:CalendarExtender>
                        </td>
                        <td rowspan="2" style="width: 206px; position: relative; left: 10px; border-right: 2px solid black;">
                            <asp:Label ID="Label4" runat="server" Style="text-align: center; font-size: large;" Text="Check Out"></asp:Label>
                            <br />
                            <br />
                            <asp:TextBox ID="txtCheckOut" runat="server" Style="height: 20px; width: 150px; border-radius: 5px; background-color: #e6e6fa;" ReadOnly="True" ViewStateMode="Enabled"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="txtCheckOutWatermarkExtender"   runat="server" Enabled="True" TargetControlID="txtCheckOut" WatermarkCssClass="waterMark" WatermarkText="dd/MM/Year">
                            </asp:TextBoxWatermarkExtender>
                            <asp:ImageButton ID="imgCheckOut" runat="server"
                                ImageUrl="~/Images/OtherImages/calendar.jpg" Style="height: 23px; width: 25px; display: inline; border-radius: 5px; position: relative; top: 7px;" />
                            <asp:CalendarExtender ID="calExtenderCheckOut" PopupButtonID="imgCheckOut" Format="dd/MM/yyyy" TargetControlID="txtCheckOut" PopupPosition="BottomLeft" runat="server" OnClientDateSelectionChanged="checkPreDate"></asp:CalendarExtender>
                        </td>
                        <td rowspan="2" style="width: 160px; position: relative; left: 10px; border-right: 2px solid black;">
                            <span id="NoOfDaysTitle" style="text-align: center; font-size: large;">No.Of Days:</span>
                            <span id="NoOfDays">0 Days</span><br />
                            <br />
                            <asp:Label ID="lblCostPerDayTitle" runat="server" Style="text-align: center; font-size: large; position: relative; left: 5px" Text="Cost Per Day:"></asp:Label>
                            <br />
                            <asp:Label ID="lblCostPerDay" Style="text-align: center; font-size: large; position: relative; left: 30px" runat="server" Text="Rs/-"></asp:Label>
                        </td>
                        <td rowspan="2" style="width: 160px; position: relative;">
                            <asp:Button ID="Button1" runat="server" Text="Check Availability"
                                Style="height: 23px; width: 130px; border-radius: 15px; box-shadow: 5px 5px 5px  #625454; position: relative; color: white; font-size: medium; background-color: black" OnClick="BtnCheckavalClick" />
                            <br />
                            <br />
                            <asp:Button ID="Button2" runat="server" Text="BOOK & PAY"
                                Style="height: 23px; width: 130px; border-radius: 15px; box-shadow: 5px 5px 5px  #625454; position: relative; color: white; font-size: medium; background-color: black" OnClick="BtnCheckavalClick" />

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
</asp:Content>
