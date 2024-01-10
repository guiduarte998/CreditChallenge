using Utils.Enums;

namespace Models.Credito
{
    public class CreditoRequest
    {
        public decimal ValorCredito { get; set; }
        public TipoCredito TipoCredito { get; set; }
        public int Parcelas { get; set; }
        public DateTime DataEntrada { get; set; }
    }
}
