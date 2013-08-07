<%@ Page Language="C#" MasterPageFile="~/MasterPages/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="QuesAns.aspx.cs" Inherits="CitylandBusinessCenter.QuesAns" %>

<asp:Content ID="QuesAns" ContentPlaceHolderID="MainMasterPageContentPlaceHolder" runat="server">
    <script src="Scripts/Jquery%20Main.js"></script>
    <script src="Scripts/Jquery%20UI%20Main.js"></script>
    <link href="Styles/AccodionStyles.css" rel="stylesheet" />
    <link href="Styles/QuestionAns.css" rel="stylesheet" />
     <script type="text/javascript">
        $(document).ready(
          function () {
              $("#accordion").accordion({
                  header: "h3",
                  autoheight: false,
                  accordion:true,
                  active: false,
                  alwaysOpen: false,
                  fillspace: false,
                  collapsible: true,
                  //heightStyle: content   //auto, fill, content
              });
          });
    </script>

    <div>
        <br />
        <strong class="quesHeader">Booking and payment</strong>
        <p class="paraQues">
            Do you have a question about your Room reservation or payment?
             Do you wish to cancel a reservation?<br />
            Select the 
            relevant question and follow the instructions.
        </p>
        <br />
    </div>
    <div class="repDiv">
        <asp:Repeater ID="repQuesAndAns" runat="server">
            <HeaderTemplate>
                <b class="repeaterHeader">Frequently asked questions and answers</b>
                
                <div id="accordion">
                    <br />
            </HeaderTemplate>
            <ItemTemplate>                
                     <h3><asp:Label CssClass="lblQuestion" ID="lblSno" runat="server" Text='<%#Eval("Sno") %>'></asp:Label>
                      <asp:Label CssClass="lblQuestion" ID="lblQuestion" runat="server" Text='<%#Eval("Question") %>'></asp:Label> 
                     </h3>                     
                     <div>
                        <p class="paraAns">
                            <asp:Label CssClass="lblAns" ID="lblAns" runat="server" Text='<%#Eval("Answer") %>'></asp:Label>
                        </p>
                    </div>                
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>
        </asp:Repeater>
    </div>
    <br />
    <br />
</asp:Content>
