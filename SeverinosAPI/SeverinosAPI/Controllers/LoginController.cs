using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TCCteste;

namespace SeverinosAPI.Controllers
{
    [Route("api/[controller]")]
    [Controller]
    public class LoginController : ControllerBase
    {
        // GET login/Login
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            DBModel.GetConexao();

            var pessoa = DBModel.GetReader("select nome from tb_pessoa ");

            pessoa.Read();
            var tes = pessoa["nome"].ToString();

            return new string[] { pessoa["nome"].ToString() };            
        }

        // GET login/Login/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST login/Login
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT login/Login/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE login/Login/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
