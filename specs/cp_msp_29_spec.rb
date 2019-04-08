require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "UntitledTestCase" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://10.3.3.202:14241/elab/servlet/login"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_untitled_test_case" do
    @driver.get "http://10.3.3.202:14241/elab/servlet/login"
    sleep 2
    @driver.find_element(:id, "vUSUARIOID").send_keys "ADMIN"
    @driver.find_element(:id, "vPASSWORD").send_keys "123456AD"
    @driver.find_element(:id, "BTNLOGIN").click
    sleep 2
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vMENU")).select_by(:text, "VIROLOGIA")
    @driver.find_element(:id, "vMENU").click
    @driver.find_element(:id, "BTNCONFIRMAR").click
    sleep 3
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='.'])[1]/following::span[2]").click
    sleep 1
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Ayuda'])[1]/following::td[2]").click
    sleep 3
    @driver.find_element(:id, "vFECHADESDE").send_keys("01/04/18")
    FechaDate = DateTime.parse("01/04/2018", "%dd/%mm/%YYYY")
    @driver.find_element(:id, "IMAGE1").click
    sleep 3
    @driver.find_element(:id, "SolicitudesContainerRow_0001").displayed? == true
    FechaMenor = @driver.find_element(:id, "span_vSOL_FECHAHORA_0001").text
    FechaMenorDate = DateTime.parse(FechaMenor, "%dd/%mm/%YYYY %HH:%MM")
    FechaDate = FechaDate.strftime("%Y%m%d%H%M")
    FechaMenorDate = FechaMenorDate.strftime("%Y%m%d%H%M")
    FechaMenorDate.should >= FechaDate
  end

end
