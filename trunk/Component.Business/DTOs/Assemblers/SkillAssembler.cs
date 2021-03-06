//-------------------------------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by EntitiesToDTOs.v3.2 (entitiestodtos.codeplex.com).
//     Timestamp: 2016/02/22 - 20:58:49
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
    /// Assembler for <see cref="Skill"/> and <see cref="SkillDTO"/>.
    /// </summary>
    public static partial class SkillAssembler
    {
        /// <summary>
        /// Invoked when <see cref="ToDTO"/> operation is about to return.
        /// </summary>
        /// <param name="dto"><see cref="SkillDTO"/> converted from <see cref="Skill"/>.</param>
        static partial void OnDTO(this Skill entity, SkillDTO dto);

        /// <summary>
        /// Invoked when <see cref="ToEntity"/> operation is about to return.
        /// </summary>
        /// <param name="entity"><see cref="Skill"/> converted from <see cref="SkillDTO"/>.</param>
        static partial void OnEntity(this SkillDTO dto, Skill entity);

        /// <summary>
        /// Converts this instance of <see cref="SkillDTO"/> to an instance of <see cref="Skill"/>.
        /// </summary>
        /// <param name="dto"><see cref="SkillDTO"/> to convert.</param>
        public static Skill ToEntity(this SkillDTO dto)
        {
            if (dto == null) return null;

            var entity = new Skill();

            entity.SkillID = dto.SkillID;
            entity.Skill1 = dto.Skill1;
            entity.UserID = dto.UserID;

            dto.OnEntity(entity);

            return entity;
        }

        /// <summary>
        /// Converts this instance of <see cref="Skill"/> to an instance of <see cref="SkillDTO"/>.
        /// </summary>
        /// <param name="entity"><see cref="Skill"/> to convert.</param>
        public static SkillDTO ToDTO(this Skill entity)
        {
            if (entity == null) return null;

            var dto = new SkillDTO();

            dto.SkillID = entity.SkillID;
            dto.Skill1 = entity.Skill1;
            dto.UserID = entity.UserID;

            entity.OnDTO(dto);

            return dto;
        }

        /// <summary>
        /// Converts each instance of <see cref="SkillDTO"/> to an instance of <see cref="Skill"/>.
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public static List<Skill> ToEntities(this IEnumerable<SkillDTO> dtos)
        {
            if (dtos == null) return null;

            return dtos.Select(e => e.ToEntity()).ToList();
        }

        /// <summary>
        /// Converts each instance of <see cref="Skill"/> to an instance of <see cref="SkillDTO"/>.
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public static List<SkillDTO> ToDTOs(this IEnumerable<Skill> entities)
        {
            if (entities == null) return null;

            return entities.Select(e => e.ToDTO()).ToList();
        }

    }
}
