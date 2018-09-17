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
        public String GetBalance(int accNo)
        {
            var i = VanillaBankEntities.SPBalance(accNo).FirstOrDefault();
            //Conversion of currency will be handeled here.
            return i.ToString();
        }
        public String Deposit(int accNo,double amt)
        {
            try
            {
                var i = VanillaBankEntities.SpDeposit(accNo, amt, "Inr");
                if (i == 1) { return "Amount of " + amt + " credited successfully to the account no. " + accNo + "."; }
                else { return "Something went wrong."; }
            }
            catch (Exception ex)
            {

                return ex.InnerException.Message;
            }
            
        }
        public String Withdraw(int accNo,double amt)
        {
            try
            {
                var i = VanillaBankEntities.SpWithdraw(accNo, amt, "Inr");
                if (i == 1) { return "Amount of " + amt + " debited successfully to the account no. " + accNo + "."; }
                else { return "Something went wrong."; }
                
            }
            catch (Exception ex)
            {

               return ex.InnerException.Message;
            }
           
            
        }
    }
}
