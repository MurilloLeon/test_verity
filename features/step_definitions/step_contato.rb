Dado("que eu acessei a home page da Verity Group") do
    visit(DATA[$ambiente]['site'])
end

Quando("eu clicar na opção de menu {string}") do |contato|
    assert_selector(EL['botao_carrossel'], visible:true)
    Comum.new.clica_elemento("breadcrumbs_#{contato}")
end

Quando("preencher os campos Empresa, Nome, Email, Telefone, Assunto e Mensagem") do
    Contato.new.formulario_contato
end

Quando("apago o campo {string}") do |contato|
    find(EL["box_#{contato}"]).set("")
end

Quando("clicar no botão {string}") do |enviar|
    Comum.new.clica_elemento("botao_#{enviar}")
end

Então("o site irá registrar o envio apresentando uma mensagem de faltando campos obrigatorios") do
    assert_selector(EL["label_envio_mensaagem"], text: "Faltando preenchiemnto de campo obrigatório", visible:true)
end

Então("o site irá registrar o envio apresentando uma mensagem de que a mensagem foi enviada com sucesso") do
    assert_selector(EL["label_envio_mensaagem"], text: "Sua mensagem foi enviado com sucesso!", visible:true)
    p "Mensagem enviada com sucesso."
end