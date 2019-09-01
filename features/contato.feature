# language: pt
# encode: UTF-8

Funcionalidade: Valida se a funcionalidade de contato esta funcionando corretamente.

@contato @envio_msg
Cenario: Validar o envio de mensagem corretamente.

    Dado que eu acessei a home page da Verity Group
    Quando eu clicar na opção de menu "contato"
    E preencher os campos Empresa, Nome, Email, Telefone, Assunto e Mensagem
    E clicar no botão "enviar"
    Então o site irá registrar o envio apresentando uma mensagem de que a mensagem foi enviada com sucesso

# Verificar com o PO:
#  - a regra de negocio para campos obrigatórios se aplica para esse formulário.
#  - o campo de telefone necessita ser preenchido por numeros ou se seria uma string.
#  - preencher o campo de email como uma formatação de email valido.

# @contato @campo_obrigatorio
# Esquema do Cenario: Validar os campos obrigatorios do formulario

#     Dado que eu acessei a home page da Verity Group
#     Quando eu clicar na opção de menu "contato"
#     E preencher os campos Empresa, Nome, Email, Telefone, Assunto e Mensagem
#     E apago o campo <contato>
#     E clicar no botão "enviar"
#     Então o site irá registrar o envio apresentando uma mensagem de faltando campos obrigatorios

# Exemplos:
#     | contato    |
#     | "empresa"  |
#     | "nome"     |
#     | "email"    |
#     | "telefone" |
#     | "mensagem" |