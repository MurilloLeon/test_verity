require 'selenium-webdriver'
require 'report_builder'

  Before do |scn|
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    page.driver.quit
    Capybara.page.driver.browser.manage.window.maximize
  end


  ReportBuilder.configure do |config|
    config.json_path = 'data/reports/report.json'
    config.report_path = "data/reports/report-#{$report_time}"
    config.report_types = [:html]
    config.report_title = "UI Verity - #{$report_title}"
    config.color = "blue"
  end

at_exit do
  ReportBuilder.build_report
end

# AfterStep do |step|
#  data = "#{Time.now.strftime('%Y/%B/%d')}"
#  hora = "#{Time.now.strftime('%H-%M-%S')}"
#  save_screenshot("data/screenshots/#{@scn_name}/#{hora}.png")
# end

# After do |scn|
#   if scn.failed?
#     binding.pry
#   end
# end
