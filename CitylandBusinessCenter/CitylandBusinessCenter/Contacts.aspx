<%@ Page Language="C#" MasterPageFile="~/MasterPages/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="CitylandBusinessCenter.Contacts" %>

<asp:Content ID="Contacts" ContentPlaceHolderID="MainMasterPageContentPlaceHolder" runat="server">
    <link href="Styles/Contacts.css" rel="stylesheet" />
    <div>
        <br />
        <br />
        <p class="paraContacts" id="Company">CITYLAND BUSINESS CENTER PVT. LTD.</p>
        <br />
        <p class="paraContacts">628/1, 1st Floor, Nr BDA Complex, Ab. Canara Bank</p>
        <p class="paraContacts">1st Stage, Indiranagar, Bangalore - 560038</p>
        <br />
        <br />
        <p class="paraContacts">Phone:+91 080 4217 1543, Mobile: +91 98451 55440</p>
        <p class="paraContacts">Email: contact@citylandtech.com</p>
        <br />
        <br />
        <table class="tblContacts">
            <tr>
                <td class="PaddingTd">
                    <p class="paraContacts">Mr. Srinivasrao Kanneganti</p>
                    <p class="paraContacts">Managing Director</p>
                    <p class="paraContacts">srinivas@citylandtech.com</p>
                </td>
                <td>
                    <p class="paraContacts">Mr. Rachuri Sreedhar</p>
                    <p class="paraContacts">C# Developer</p>
                    <p class="paraContacts">Sreedhar@citylandtech.com</p>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
    <br />
    <div class="googleMap">
        <iframe width="500" height="300" frameborder="0" scrolling="no" marginheight="0"
            marginwidth="0"
            src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=bangalore,indiara+nagar,bda++complex&amp;sll=37.0625,-95.677068&amp;sspn=56.200193,79.013672&amp;vpsrc=6&amp;ie=UTF8&amp;hq=,indiara+nagar,bda+complex&amp;hnear=Bangalore,+Bangalore+Urban,+Karnataka,+India&amp;ll=12.98175,77.636609&amp;spn=0.022333,0.092502&amp;t=m&amp;output=embed"></iframe>
        <br />
        <small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=bangalore,indiara+nagar,bda++complex&amp;sll=37.0625,-95.677068&amp;sspn=56.200193,79.013672&amp;vpsrc=6&amp;ie=UTF8&amp;hq=,indiara+nagar,bda+complex&amp;hnear=Bangalore,+Bangalore+Urban,+Karnataka,+India&amp;ll=12.98175,77.636609&amp;spn=0.022333,0.092502&amp;t=m"
            style="color: #0000FF; text-align: center;">View Larger Map</a></small>
    </div>
    <br />
    <br />
</asp:Content>
