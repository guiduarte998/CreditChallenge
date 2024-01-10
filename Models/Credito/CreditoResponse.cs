using Utils.Enums;

namespace Models.Credito
{
    public class CreditoResponse
    {
        public StatusCredito StatusCredito { get; set; }
        public decimal ValorTotalComJuros { get; set; }
        public decimal ValorJuros { get; set; }
    }
}
