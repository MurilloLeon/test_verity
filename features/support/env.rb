require 'rspec'
require 'yaml'
require 'pry'
require 'capybara/cucumber'
require 'ffaker'
require 'selenium-webdriver'
require 'json'
require 'report_builder'

Capybara.default_max_wait_time = 60

EL = YAML.load_file('data/elementos.yml')
DATA = YAML.load_file('data/data.yml')

if ENV['ti']
  $ambiente = "ti"
elsif ENV['qa']
  $ambiente = "qa"
elsif ENV['prod']
  $ambiente = "prod"
else
  $ambiente = "prod"
end

$report_time = Time.now.strftime("%d-%m %H:%M")
$report_title = "Data: #{Time.now.strftime("%d/%m")}, Hora: #{Time.now.strftime("%H:%M")}"

  if ENV['chrome']
    Capybara.default_driver = :chrome
    Capybara.register_driver :chrome do |app|
      caps = Selenium::WebDriver::Remote::Capabilities.chrome
      caps['pageLoadStrategy'] = 'none'
    Capybara::Selenium::Driver.new(app,browser: :chrome,port: 9922,desired_capabilities: caps,switches: ['--disable-web-security','--disable-print-preview','--reduce-security-for-testing','--repl','--incognito'])
  end
  elsif ENV['chrome_headless']
    Capybara.default_driver = :chrome_headless
     Capybara.register_driver :chrome_headless do |app|
       Capybara::Selenium::Driver.new(app,browser: :chrome,switches: ['--disable-web-security','--disable-print-preview','--reduce-security-for-testing','--incognito','--headless','window-size=1280x720', '--no-sandbox'])
    end
  elsif ENV['firefox']
    Capybara.default_driver = :firefox
    Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
  elsif ENV['headless_debug']
    Capybara.default_driver = :poltergeist_debug
    Capybara.register_driver :poltergeist_debug do |app|
      Capybara::Poltergeist::Driver.new(app, inspector: true)
    end
    Capybara.javascript_driver = :poltergeist_debug
  elsif ENV['headless']
    Capybara.javascript_driver = :poltergeist
    Capybara.default_driver = :poltergeist
  else
    Capybara.default_driver = :selenium
  end
