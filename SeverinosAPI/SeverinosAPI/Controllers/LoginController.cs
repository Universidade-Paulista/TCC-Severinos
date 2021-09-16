using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SeverinosAPI.Models;
using TCCteste;

namespace Severinoslogin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class LoginController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public LoginController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [AllowAnonymous]
        [HttpPost]

        public IActionResult RequestLogin([FromBody] Usuarios request)
        {

            DBModel.GetConexao();

            var pessoa = DBModel.GetReader("select nome from tb_pessoa ");

            pessoa.Read();
            var tes = pessoa["nome"].ToString();            

            if (pessoa["nome"].ToString() == "teste")
            {
                return Ok(new string[] {"Usuario Encontrado"});

                //var claims = new[]
                //{
                //    new Claim(ClaimTypes.Name, request.Nome)
                //};

                //var key = new SymmetricSecurityKey(
                //    Encoding.UTF8.GetBytes(_configuration["SecurityKey"]));

                //var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                //var token = new JwtSecurityToken(
                //    issuer: "Severinos",
                //    audience: "Severinos",
                //    claims: claims,
                //    expires: DateTime.Now.AddMonths(30),
                //    signingCredentials: creds);

                //return Ok(new
                //{
                //    token = new JwtSecurityTokenHandler().WriteToken(token)
                //});
            }
            return BadRequest("Usuario não encontrado");
        }
    }
}
