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
    /// Assembler for <see cref="User"/> and <see cref="UserDTO"/>.
    /// </summary>
    public static partial class UserAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="UserDTO"/> converted from <see cref="User"/>.</param>
        static partial void OnDTO(this User entity, UserDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="User"/> converted from <see cref="UserDTO"/>.</param>
        static partial void OnEntity(this UserDTO dto, User entity);

        /// <summary>
        /// Converts this instance of <see cref="UserDTO"/> to an instance of <see cref="User"/>.
        /// </summary>
        /// <param name="dto"><see cref="UserDTO"/> to convert.</param>
        public static User ToEntity(this UserDTO dto)
        {
            if (dto == null) return null;

            var entity = new User();

            entity.UserID = dto.UserID;
            entity.UserName = dto.UserName;
            entity.FirstName = dto.FirstName;
            entity.MiddleName = dto.MiddleName;
            entity.LastName = dto.LastName;
            entity.DOB = dto.DOB;
            entity.IsActive = dto.IsActive;
            entity.IsDeleted = dto.IsDeleted;
            entity.insuser = dto.insuser;
            entity.insdt = dto.insdt;
            entity.upduser = dto.upduser;
            entity.upddt = dto.upddt;
            entity.Description = dto.Description;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="User"/> to an instance of <see cref="UserDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="User"/> to convert.</param>
        public static UserDTO ToDTO(this User entity)
        {
            if (entity == null) return null;

            var dto = new UserDTO();

            dto.UserID = entity.UserID;
            dto.UserName = entity.UserName;
            dto.FirstName = entity.FirstName;
            dto.MiddleName = entity.MiddleName;
            dto.LastName = entity.LastName;
            dto.DOB = entity.DOB;
            dto.IsActive = entity.IsActive;
            dto.IsDeleted = entity.IsDeleted;
            dto.insuser = entity.insuser;
            dto.insdt = entity.insdt;
            dto.upduser = entity.upduser;
            dto.upddt = entity.upddt;
            dto.Description = entity.Description;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="UserDTO"/> to an instance of <see cref="User"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<User> ToEntities(this IEnumerable<UserDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="User"/> to an instance of <see cref="UserDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<UserDTO> ToDTOs(this IEnumerable<User> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
