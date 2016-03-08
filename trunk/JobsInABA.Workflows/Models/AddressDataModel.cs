﻿using System;

namespace JobsInABA.Workflows.Models
{
    public class AddressDataModel
    {
        public int AddressID { get; set; }
        public string Title { get; set; }
        public string Line1 { get; set; }
        public string Line2 { get; set; }
        public string Line3 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public Nullable<int> CountryID { get; set; }
        public Nullable<int> AddressTypeID { get; set; }

        public string AddressCountryName { get; set; }
        public string AddressCountryAbbreviation { get; set; }
        public string AddressCountryCode { get; set; }
        public string AddressCountryPhoneCode { get; set; }

        public string AddressTypeCodeName { get; set; }
        public string AddressTypeCode { get; set; }
        public string AddressTypeCodeDescription { get; set; }
        public int AddressTypeCodeClassTypeID { get; set; }
        public Nullable<int> AddressTypeCodeParentTypeCodeID { get; set; }
    }
}
