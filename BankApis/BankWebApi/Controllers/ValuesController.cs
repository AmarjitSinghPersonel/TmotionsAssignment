using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BankWebApi.Controllers
{
    public class ValuesController : ApiController
    {
        Banking_Solutions.BankSol bankSol = new Banking_Solutions.BankSol();
        [HttpPost]
        [Route("Accounts/balance")]
        public string GetBalance(int accNo)
        {
            var bal = bankSol.GetBalance(accNo);
            return string.Format("Your current balance is: {0}", bal);
        }
        [HttpPost]
        [Route("Accounts/deposit")]
        public string Deposit(int AccNo, int Amt)
        {
            var i = bankSol.Deposit(AccNo, Amt);
            return string.Format(i);
        }
        [HttpPost]
        [Route("Account/withdraw")]
        public string Withdraw([FromBody]string value)
        {
            var i = bankSol.Withdraw(123,100);
            return string.Format("You entered: {0}", 113);
        }




        // GET api/values
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
