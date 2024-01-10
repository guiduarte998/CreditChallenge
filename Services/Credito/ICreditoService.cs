
using Models.Credito;

namespace Services.Credito
{
    public interface ICreditoService
    {
        CreditoResponse ProcessaCredito(CreditoRequest request);
    }
}
