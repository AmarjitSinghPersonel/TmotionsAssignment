<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsumeAPI.aspx.cs" Inherits="BankUI.ConsumeAPI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <script type="text/javascript" src="jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // I had put the localhost URL here where I hosted my application 
            // All your svc url where you have hosted the services to run this on machine
            var url = 'http://localhost:52582/Bank.svc';
            $('#btnBal').click(function () {
                $.ajax({
                    type: 'POST',
                    contentType : "application/soap+xml",
                    data: { accNo: $('#txtAccNo').val() },                    
                    url: url + "/GetBalance",
                    dataType: 'json',
                    async: false,
                    success: function (data) {
                        $('#lblBal').text(data);
                    }
                });
            });

            $('#btnCr').click(function () {               
                    $.ajax({
                        type: 'POST',
                        contentType : "application/soap+xml",
                        data: { accNo: $('#txtAccNo').val(), amt: $('#txtAmt').val() },
                        url: url + "/Deposit",
                        dataType: 'json',
                        async: false,
                        success: function (data) {
                            alert(data);
                        }
                    });             
            });
            $('#btnDb').click(function () {                   
                        $.ajax({
                            type: 'POST',
                            data: { accNo: $('#txtAccNo').val(), amt: $('#txtAmt').val() },
                            url: url + "/Withdraw",
                            dataType: 'json',
                            async: false,
                            success: function (data) {
                                alert(data);
                            }
                        });                    
            });
        });
        
</script>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Account No</td>
                    <td>
                        <input type="text" id="txtAccNo" /></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td>
                        <input type="text" id="txtAmt" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Get balance" id="btnBal" /></td>
                    <td>
                        <input type="button" id="btnCr" value="Deposit" /></td>
                    <td>
                        <input type="button" id="btnDb" value="Withdraw" /></td>
                </tr>
                <tr>
                    <td colspan="2"><label id="lblBal"></label> </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
