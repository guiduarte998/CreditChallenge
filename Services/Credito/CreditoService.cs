using Models.Credito;
using Utils.Enums;

namespace Services.Credito
{
    public class CreditoService : ICreditoService
    {
        public CreditoResponse ProcessaCredito(CreditoRequest request)
        {
            var response = new CreditoResponse();

            // Validações
            if (!RequestValido(request))
            {
                response.StatusCredito = StatusCredito.Recusado;
                return response;
            }

            // Cálculo dos juros
            decimal interestRate = (decimal)request.TipoCredito / 100;
            decimal interestAmount = request.ValorCredito * interestRate;

            // Configurando a resposta
            response.ValorTotalComJuros = request.ValorCredito + interestAmount;
            response.ValorJuros = interestAmount;
            response.StatusCredito = StatusCredito.Aprovado;

            return response;
        }

        private bool RequestValido(CreditoRequest request)
        {
            // Validação do valor máximo
            if (request.ValorCredito > 1000000)
            {
                return false;
            }

            // Validação da quantidade de parcelas
            if (request.Parcelas < 5 || request.Parcelas > 72)
            
            {
                return false;
            }

            // Validação específica para Pessoa Jurídica
            if (request.TipoCredito == TipoCredito.PessoaJuridica && request.ValorCredito < 15000)
            {
                return false;
            }

            // Validação da data do primeiro vencimento
            var dataPrimeiroVencimento = (request.DataEntrada - DateTime.Today).Days;
            if (dataPrimeiroVencimento < 15 || dataPrimeiroVencimento > 40)
            {
                return false;
            }

            return true;
        }
    }
}
