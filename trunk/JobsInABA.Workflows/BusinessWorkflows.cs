using System.Collections.Generic;
using System.Linq;
using JobsInABA.BL;
using JobsInABA.Workflows.Models;
using JobsInABA.Workflows.Models.Assemblers;
using JobsInABA.BL.DTOs;
using System;

namespace JobsInABA.Workflows
{
    public class BusinessWorkflows : IDisposable
    {
        BusinessBL _BusinessBL;
        AddressBL _AddressBL;
        EmailsBL _EmailsBL;
        PhonesBL _PhonesBL;

        public BusinessDataModel Get(int id)
        {
            BusinessDataModel BusinessDataModel = null;
            if (id > 0)
            {
                BusinessDTO businessDTO = businessBL.Get(id);

                if (businessDTO != null)
                {
                    BusinessDataModel = Get(businessDTO);
                }
            }
            return BusinessDataModel;
        }

        public BusinessDataModel Get(BusinessDTO modelDTO)
        {
            BusinessDataModel BusinessDataModel = null;
            if (modelDTO != null)
            {
                //List<BusinessAddressDTO> BusinessAddressDTO = (modelDTO.BusinessAddresses != null) ? modelDTO.BusinessAddresses.Select(p => p) : null;
                //AddressDTO oPrimaryAddressDTO = (BusinessAddressDTO != null) ? BusinessAddressDTO.Addres : null;

                List<AddressDTO> oPrimaryAddressDTO = (modelDTO.BusinessAddresses != null) ? modelDTO.BusinessAddresses.Where(p => p.BusinessID == modelDTO.BusinessID).Select(p => p.Addres).ToList() : null;

                List<AchievementDTO> oPrimaryAchievementDTO = (modelDTO.Achievements != null) ? modelDTO.Achievements.Where(p => p.BusinessID == modelDTO.BusinessID).Select(p => p).ToList() : null;

                List<ServiceDTO> oPrimaryServiceDTO = (modelDTO.Services != null) ? modelDTO.Services.Where(p => p.BusinessID == modelDTO.BusinessID).Select(p => p).ToList() : null;

                BusinessPhoneDTO BusinessPhoneDTO = (modelDTO.BusinessPhones != null) ? modelDTO.BusinessPhones.Where(o => o.IsPrimary).FirstOrDefault() : null;
                PhoneDTO oPrimaryPhoneDTO = (BusinessPhoneDTO != null) ? BusinessPhoneDTO.Phone : null;

                //BusinessImageDTO BusinessImageDTO = (modelDTO.BusinessImages != null) ? modelDTO.BusinessImages.Where(o => o.IsPrimary).FirstOrDefault() : null;
                //ImageDTO oPrimaryImageDTO = (BusinessImageDTO != null) ? BusinessImageDTO.Image : null;

                ImageDTO oPrimaryImageDTO = (modelDTO.BusinessImages != null) ? modelDTO.BusinessImages.Where(o => o.IsPrimary).Select(p => p.Image).FirstOrDefault() : null;

                BusinessEmailDTO BusinessEmailDTO = (modelDTO.BusinessEmails != null) ? modelDTO.BusinessEmails.Where(o => o.IsPrimary).FirstOrDefault() : null;
                EmailDTO oPrimaryEmailDTO = (BusinessEmailDTO != null) ? BusinessEmailDTO.Email : null;

                BusinessDataModel = BusinessDataModelAssembler.ToDataModel(modelDTO, oPrimaryAddressDTO, oPrimaryPhoneDTO, oPrimaryEmailDTO, oPrimaryImageDTO, oPrimaryAchievementDTO, null, oPrimaryServiceDTO);
                BusinessDataModel.PrimaryAddressID = (modelDTO.BusinessAddresses != null) ? modelDTO.BusinessAddresses.FirstOrDefault(p => p.IsPrimary == true).AddressID : 0;
                //BusinessDataModel.BusinessAddressID = (BusinessAddressDTO != null) ? BusinessAddressDTO.BusinessAddressID : 0;
                BusinessDataModel.BusinessPhoneID = (BusinessPhoneDTO != null) ? BusinessPhoneDTO.BusinessPhoneID : 0;
                BusinessDataModel.BusinessEmailID = (BusinessEmailDTO != null) ? BusinessEmailDTO.BusinessEmailID : 0;
            }
            return BusinessDataModel;
        }

        public IEnumerable<BusinessDataModel> Get()
        {
            List<BusinessDTO> businessDTOs = businessBL.Get();

            return businessDTOs.Select(businessdto => Get(businessdto));
        }

        public BusinessDataModel Create(BusinessDataModel dataModel)
        {
            if (dataModel != null)
            {
                BusinessDTO businessDTO = new BusinessDTO();
                List<AddressDTO> addressDTO = new List<AddressDTO>();
                PhoneDTO phoneDTO = new PhoneDTO();
                EmailDTO emailDTO = new EmailDTO();
                BusinessUserMapDTO businessUserMapDTO = new BusinessUserMapDTO();

                businessDTO = BusinessDataModelAssembler.ToBusinessDTO(dataModel);
                phoneDTO = BusinessDataModelAssembler.ToPhoneDTO(dataModel);
                emailDTO = BusinessDataModelAssembler.ToEmailDTO(dataModel);
                addressDTO = BusinessDataModelAssembler.ToAddressDTO(dataModel);
                businessUserMapDTO = BusinessDataModelAssembler.ToBusinessUserMapDTO(dataModel);

                if (businessDTO != null)
                {
                    businessDTO = businessBL.Create(businessDTO);
                }
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO,null);
                new BusinessUserMapBL().Create(new BusinessUserMapDTO()
                {
                    BusinessID = dataModel.BusinessID,
                    UserID = dataModel.BusinessUserId,
                    BusinessUserTypeID=dataModel.BusinessUserMapTypeCodeId,
                    IsOwner = true
                });
                addressDTO = BusinessDataModelAssembler.ToAddressDTO(dataModel);
                if (addressDTO != null)
                {
                    List<AddressDTO> addressList = new List<AddressDTO>();
                    //addressDTO = addressDTO.Select(p => addressBL.Create(p)).ToList();
                    foreach (var item in addressDTO)
                    {
                        addressList.Add(addressBL.Create(item));
                    }

                    addressDTO = addressList;
                }
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO,null);
                new BusinessAddressBL().Create(new BusinessAddressDTO()
                {
                    BusinessID = dataModel.BusinessID,
                    AddressID = dataModel.Addresses.FirstOrDefault().AddressID,
                    IsPrimary = true
                });
                phoneDTO = BusinessDataModelAssembler.ToPhoneDTO(dataModel);
                if (phoneDTO != null)
                {
                    phoneDTO.AddressbookID = addressDTO.FirstOrDefault().AddressID;
                    phoneDTO = phonesBL.Create(phoneDTO);
                }
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
                new BusinessPhoneBL().Create(new BusinessPhoneDTO()
                {
                    BusinessID = dataModel.BusinessID,
                    PhoneID = dataModel.BusinessPhoneID,
                    IsPrimary = true
                });
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
                emailDTO = BusinessDataModelAssembler.ToEmailDTO(dataModel);
                if (emailDTO != null)
                {
                    emailDTO = emailsBL.Create(emailDTO);
                }
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
                new BusinessEmailBL().Create(new BusinessEmailDTO()
                {
                    BusinessID = dataModel.BusinessID,
                    EmailID = dataModel.BusinessEmailID,
                    IsPrimary = true
                });
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
            }

            return dataModel;
        }

        public BusinessDataModel Update(BusinessDataModel dataModel)
        {
            if (dataModel != null)
            {
                BusinessDTO businessDTO = new BusinessDTO();
                List<AddressDTO> addressDTO = new List<AddressDTO>();
                PhoneDTO phoneDTO = new PhoneDTO();
                EmailDTO emailDTO = new EmailDTO();
                BusinessUserMapDTO businessUserMapDTO = new BusinessUserMapDTO();

                businessDTO = BusinessDataModelAssembler.ToBusinessDTO(dataModel);
                phoneDTO = BusinessDataModelAssembler.ToPhoneDTO(dataModel);
                emailDTO = BusinessDataModelAssembler.ToEmailDTO(dataModel);
                addressDTO = BusinessDataModelAssembler.ToAddressDTO(dataModel);
                businessUserMapDTO = BusinessDataModelAssembler.ToBusinessUserMapDTO(dataModel);

                if (businessDTO != null)
                {
                    businessDTO = businessBL.Update(businessDTO);
                }
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
                if (phoneDTO != null)
                {
                    phoneDTO = phonesBL.Update(phoneDTO);
                }
                new BusinessPhoneBL().Update(new BusinessPhoneDTO()
                {
                    BusinessID = dataModel.BusinessID,
                    BusinessPhoneID = dataModel.BusinessPhoneID,
                    IsPrimary = true
                });
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
                if (emailDTO != null)
                {
                    emailDTO = emailsBL.Update(emailDTO);
                }
                new BusinessEmailBL().Update(new BusinessEmailDTO()
                {
                    BusinessID = dataModel.BusinessID,
                    BusinessEmailID = dataModel.BusinessEmailID,
                    IsPrimary = true
                });
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
                if (addressDTO != null)
                {
                    addressDTO = addressDTO.Select(p => addressBL.Update(p)).ToList();
                }
                dataModel = BusinessDataModelAssembler.ToDataModel(businessDTO, addressDTO, phoneDTO, emailDTO, null, null, businessUserMapDTO, null);
                new BusinessAddressBL().Update(new BusinessAddressDTO()
                {
                    BusinessID = dataModel.BusinessID,
                    BusinessAddressID = dataModel.BusinessAddressID,
                    IsPrimary = true
                });
            }

            return dataModel;
        }

        public bool Delete(int id)
        {
            return businessBL.Delete(id);
        }

        private BusinessBL businessBL
        {
            get
            {
                if (_BusinessBL == null) _BusinessBL = new BusinessBL();
                return _BusinessBL;
            }
        }

        private AddressBL addressBL
        {
            get
            {
                if (_AddressBL == null) _AddressBL = new AddressBL();
                return _AddressBL;
            }
        }

        private EmailsBL emailsBL
        {
            get
            {
                if (_EmailsBL == null) _EmailsBL = new EmailsBL();
                return _EmailsBL;
            }
        }

        private PhonesBL phonesBL
        {
            get
            {
                if (_PhonesBL == null) _PhonesBL = new PhonesBL();
                return _PhonesBL;
            }
        }

        public void Dispose()
        {
            _BusinessBL.Dispose();
            _AddressBL.Dispose();
            _EmailsBL.Dispose();
            _PhonesBL.Dispose();
        }

        public IList<BusinessDataModel> GetBusinessesBySearch(string companyname, string city, int? from, int? to)
        {
            List<BusinessDataModel> businessDataModels = new List<BusinessDataModel>();
            List<BusinessDTO> businessDTOs = businessBL.GetBusinessesBySearch(companyname,city, from, to);
            businessDataModels = businessDTOs.Select(userdto => Get(userdto)).ToList();
            return businessDataModels;
        }

        
    }
}
