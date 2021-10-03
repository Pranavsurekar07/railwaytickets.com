<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print-ticket.aspx.cs" Inherits="RailwayTicketingProject.print_ticket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Railway Ticketing System</title>
    <link rel="stylesheet" href="css/style.css" />
    <script type="text/javascript">

        var gAutoPrint = true;

        function processPrint() {
            if (document.getElementById != null) {
                var html = '<html>\n<head>\n';
                if (document.getElementsByTagName != null) {
                    var headTags = document.getElementsByTagName("head");
                    if (headTags.length > 0) html += headTags[0].innerHTML;
                }
                html += '\n</head>\n<body>\n';
                var printReadyElem = document.getElementById("PrintArea");
                if (printReadyElem != null) html += printReadyElem.innerHTML;
                else {
                    alert("Error, no contents.");
                    return;
                }
                html += '\n</body>\n</html>';
                var printWin = window.open("", "processPrint");
                printWin.document.open();
                printWin.document.write(html);
                printWin.document.close();
                if (gAutoPrint) printWin.print();
            } else alert("Browser not supported.");
        }
    </script>
</head>
<body>
    <form runat="server">
    <div class="PContainer">
        <div class="first-column-flex">
            <img src="images/railway-logo-edi1.jpg" alt="logo.png" />
        </div>
        <div class="second-column-flex">
            <h3>*****************HAPPY JOURNEY*****************</h3>
            <p>
                Congratulations! You have successfully booked a ticket. 
                Please carry ticket print along with a relevant photo ID card while travelling
                                            Thank You !!
            </p>
        </div>
    </div>
    <hr />
    <div class="P2Container">
        <div class="Section2-first-column-flex">
            <p>Ticket Number: <span runat="server" id="spTicketNumber"></span></p>
            <p>Name: <span runat="server" id="spName"></span></p>
            <p>Source: <span runat="server" id="spSource"></span></p>
            <p>Journey Date: <span runat="server" id="spJourneyDate"></span></p>
            <p>Total Fare: <span runat="server" id="spFare"></span></p>
        </div>
        <div class="Section2-second-column-flex">
            <p>Train Name: <span runat="server" id="spTrainName"></span></p>
            <p>Booking Date: <span runat="server" id="spDate"></span></p>
            <p>Train Number: <span runat="server" id="spTrainNumber"></span></p>
            <p>Destination: <span runat="server" id="spDestination"></span></p>
            <p>Departure Time: <span runat="server" id="spDepTime"></span></p>
        </div>
    </div>
    <hr />
    <div class="btnPrint">
        <asp:Button runat="server" OnClientClick="javascript:window.print();" ID="btnPrint" Text="Print" OnClick="btnPrint_Click" />
    </div>
    </form>
</body>
</html>
