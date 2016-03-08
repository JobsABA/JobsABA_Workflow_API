//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JobsInABA.Component.AddressBook.ef
{
    using System;
    using System.Collections.Generic;
    
    public partial class TypeCode
    {
        public TypeCode()
        {
            this.Addresses = new HashSet<Address>();
            this.Emails = new HashSet<Email>();
            this.Phones = new HashSet<Phone>();
            this.TypeCodes1 = new HashSet<TypeCode>();
        }
    
        public int TypeCodeID { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public int ClassTypeID { get; set; }
        public Nullable<int> ParentTypeCodeID { get; set; }
    
        public virtual ICollection<Address> Addresses { get; set; }
        public virtual ClassType ClassType { get; set; }
        public virtual ICollection<Email> Emails { get; set; }
        public virtual ICollection<Phone> Phones { get; set; }
        public virtual ICollection<TypeCode> TypeCodes1 { get; set; }
        public virtual TypeCode TypeCode1 { get; set; }
    }
}
