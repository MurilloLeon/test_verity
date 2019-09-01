class Comum
    include Capybara::DSL
  
    def preenche_campo(campo, texto, index = 0)
      assert_selector(EL[campo], visible: true)
      all(EL[campo])[index].set(texto)
    end
  
    def foco_browser
      result = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.window(result)
    end
  
    def clica_elemento(elemento, index = 0)
      assert_selector(EL[elemento], visible: true)
      all(EL[elemento])[index].click
    end
  
    def clica_elemento_texto(elemento, texto, index = 0)
      assert_selector(EL[elemento], visible: true)
      all(EL[elemento], text: texto)[index].click
    end  
  end
  