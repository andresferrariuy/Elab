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
    @driver.find_element(:id, "vSOL_NUMERO_FILTRO").send_keys("190404006")
    @driver.find_element(:id, "IMAGE1").click
    sleep 3
    @driver.find_element(:id, "vACC_RESULTADO_0001").click
    sleep 3
    @driver.find_element(:id, "vRESEST_RESULTADO_0002").send_keys("test")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vLIBERADO_0002")).select_by(:text, "SI")
    @driver.find_element(:id, "BTN_ENTER").click
    sleep 5
    @driver.find_element(:id, "BTN_CANCEL").click
    sleep 3
    @driver.find_element(:id, "vACC_IMPRIME_0001").click

    sleep 20


  end

end
