﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Banking_Solutions
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class VanillaBankEntities : DbContext
    {
        public VanillaBankEntities()
            : base("name=VanillaBankEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BankTransaction> BankTransactions { get; set; }
    
        public virtual ObjectResult<Nullable<double>> SPBalance(Nullable<int> accNo)
        {
            var accNoParameter = accNo.HasValue ?
                new ObjectParameter("accNo", accNo) :
                new ObjectParameter("accNo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<double>>("SPBalance", accNoParameter);
        }
    
        public virtual int SpDeposit(Nullable<int> accNo, Nullable<double> amt, string curr)
        {
            var accNoParameter = accNo.HasValue ?
                new ObjectParameter("accNo", accNo) :
                new ObjectParameter("accNo", typeof(int));
    
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(double));
    
            var currParameter = curr != null ?
                new ObjectParameter("curr", curr) :
                new ObjectParameter("curr", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SpDeposit", accNoParameter, amtParameter, currParameter);
        }
    
        public virtual int SpWithdraw(Nullable<int> accNo, Nullable<double> amt, string curr)
        {
            var accNoParameter = accNo.HasValue ?
                new ObjectParameter("accNo", accNo) :
                new ObjectParameter("accNo", typeof(int));
    
            var amtParameter = amt.HasValue ?
                new ObjectParameter("amt", amt) :
                new ObjectParameter("amt", typeof(double));
    
            var currParameter = curr != null ?
                new ObjectParameter("curr", curr) :
                new ObjectParameter("curr", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SpWithdraw", accNoParameter, amtParameter, currParameter);
        }
    }
}
