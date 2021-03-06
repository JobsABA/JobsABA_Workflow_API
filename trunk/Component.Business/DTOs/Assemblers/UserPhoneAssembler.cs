//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2016/02/22 - 20:58:50
//
//     Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
// </auto-generated>
//-------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Linq;
using JobsInABA.BL.DTOs;
using JobsInABA.DAL.Entities;

namespace JobsInABA.BL.DTOs.Assemblers
{

    /// <summary>
    /// Assembler for <see cref="UserPhone"/> and <see cref="UserPhoneDTO"/>.
    /// </summary>
    public static partial class UserPhoneAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="UserPhoneDTO"/> converted from <see cref="UserPhone"/>.</param>
        static partial void OnDTO(this UserPhone entity, UserPhoneDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="UserPhone"/> converted from <see cref="UserPhoneDTO"/>.</param>
        static partial void OnEntity(this UserPhoneDTO dto, UserPhone entity);

        /// <summary>
        /// Converts this instance of <see cref="UserPhoneDTO"/> to an instance of <see cref="UserPhone"/>.
        /// </summary>
        /// <param name="dto"><see cref="UserPhoneDTO"/> to convert.</param>
        public static UserPhone ToEntity(this UserPhoneDTO dto)
        {
            if (dto == null) return null;

            var entity = new UserPhone();

            entity.UserPhoneID = dto.UserPhoneID;
            entity.UserID = dto.UserID;
            entity.PhoneID = dto.PhoneID;
            entity.IsPrimary = dto.IsPrimary;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="UserPhone"/> to an instance of <see cref="UserPhoneDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="UserPhone"/> to convert.</param>
        public static UserPhoneDTO ToDTO(this UserPhone entity)
        {
            if (entity == null) return null;

            var dto = new UserPhoneDTO();

            dto.UserPhoneID = entity.UserPhoneID;
            dto.UserID = entity.UserID;
            dto.PhoneID = entity.PhoneID;
            dto.IsPrimary = entity.IsPrimary;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="UserPhoneDTO"/> to an instance of <see cref="UserPhone"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<UserPhone> ToEntities(this IEnumerable<UserPhoneDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="UserPhone"/> to an instance of <see cref="UserPhoneDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<UserPhoneDTO> ToDTOs(this IEnumerable<UserPhone> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
