﻿using JobsInABA.BL.DTOs;
using JobsInABA.BL.DTOs.Assemblers;
using JobsInABA.DAL.Entities;
using JobsInABA.DAL.Repositories;
using System;

namespace JobsInABA.BL
{
    public class BusinessUserMapBL : IDisposable
    {
        BusinessUserMapsRepo _BusinessUserMapRepos;

        private BusinessUserMapsRepo businessUserMapRepos
        {
            get
            {
                if (_BusinessUserMapRepos == null) _BusinessUserMapRepos = new BusinessUserMapsRepo();
                return _BusinessUserMapRepos;
            }
        }

        public BusinessUserMapDTO Get(int id)
        {
            BusinessUserMapDTO oBusinessUserMapDTO = null;
            if (id > 0)
            {
                BusinessUserMap oBusinessUserMap = businessUserMapRepos.GetBusinessUserMap(id);
            }

            return oBusinessUserMapDTO;
        }

        public BusinessUserMapDTO Create(BusinessUserMapDTO modelDTO)
        {
            if (modelDTO != null)
            {
                return BusinessUserMapAssembler.ToDTO(businessUserMapRepos.CreateBusinessUserMap(BusinessUserMapAssembler.ToEntity(modelDTO)));
            }

            return null;
        }

        public BusinessUserMapDTO Update(BusinessUserMapDTO modelDTO)
        {
            BusinessUserMapDTO returnUserMap = null;
            if (modelDTO != null && modelDTO.BusinessUserMapID > 0)
            {
                businessUserMapRepos.UpdateBusinessUserMap(0, BusinessUserMapAssembler.ToEntity(modelDTO));
                returnUserMap = modelDTO;
            }

            return returnUserMap;
        }

        public bool Delete(int id)
        {
            Boolean isDeleted = false;

            if (id > 0)
            {
                try
                {
                    businessUserMapRepos.DeleteBusinessUserMap(id);
                }
                catch
                {
                    return false;
                }
            }
            return isDeleted;
        }

        public void Dispose()
        {
            _BusinessUserMapRepos.Dispose();
        }
    }
}