using Microsoft.AspNetCore.Mvc;
using Models.Credito;
using Services.Credito;

namespace CreditoCodeChallenge.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CreditoController : ControllerBase
    {
        private readonly ICreditoService _creditoService;

        public CreditoController(ICreditoService creditService)
        {
            _creditoService = creditService;
        }

        [HttpPost]
        public ActionResult<CreditoResponse> Post(CreditoRequest request)
        {
            var response = _creditoService.ProcessaCredito(request);
            return Ok(response);
        }
    }
}
