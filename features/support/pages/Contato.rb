class Contato
    include Capybara::DSL
  
    def formulario_contato
        assert_selector(EL['box_empresa'], visible:true)
        find(EL['box_empresa']).set("empresa teste")
        find(EL['box_nome']).set("Murillo Leon")
        find(EL['box_email']).set("murillo_bil@hotmail.com")
        find(EL['box_telefone']).set("(11)94980-9863")
        find(EL['dropbox_elogios']).click
        find(EL['box_mensagem']).set("Realizando teste.")
    end  
  end
  