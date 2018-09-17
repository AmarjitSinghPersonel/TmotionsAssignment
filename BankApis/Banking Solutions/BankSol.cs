using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Banking_Solutions
{
    public class BankSol
    {
        VanillaBankEntities VanillaBankEntities = new VanillaBankEntities();
        public String GetBalance(int AccountNumber)
        {
            var Result = VanillaBankEntities.SPBalance(AccountNumber).FirstOrDefault();
            //Conversion of currency will be handeled here.
            return Result.ToString();
        }
        public String Deposit(int AccountNumber, double Amount, string Currency)
        {
            try
            {
                var Status = VanillaBankEntities.SpDeposit(AccountNumber, Amount, Currency);
                if (Status == 1) { return "Amount of " + Amount + " credited successfully to the account no. " + AccountNumber + "."; }
                else { return "Something went wrong."; }
            }
            catch (Exception ex)
            {
                return ex.InnerException.Message;
            }

        }
        //Withdraw Method will check the current balance and withdraw the money only then
        //In case there aren't enough funds SP will return the respective output
        public String Withdraw(int AccountNumber, double Amount, string Currency = "Inr")
        {
            try
            {
                var Status = VanillaBankEntities.SpWithdraw(AccountNumber, Amount, Currency);
                if (Status == 1) { return "Amount of " + Amount + " debited successfully to the account no. " + AccountNumber + "."; }
                else { return "Something went wrong."; }

            }
            catch (Exception ex)
            {
                return ex.InnerException.Message;
            }


        }
    }
}
