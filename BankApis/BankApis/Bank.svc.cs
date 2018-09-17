using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace BankApis
{
    public class Bank : IBankApi
    {
        Banking_Solutions.BankSol bankSol = new Banking_Solutions.BankSol();

        public string GetBalance(int AccountNumber)
        {
            var Balance = bankSol.GetBalance(AccountNumber);
            return string.Format("Your current balance is: {0}", Balance);
        }
        public string Deposit(int AccountNumber, int Amount, string Currency = "Inr")
        {
            var Status = bankSol.Deposit(AccountNumber, Amount, Currency);
            return Status;
        }
        public string Withdraw(int AccountNumber, int Amount)
        {
            var Status = bankSol.Withdraw(AccountNumber, Amount);
            return Status;
        }
    }
}
