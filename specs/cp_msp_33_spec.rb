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
    sleep 3
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:value, "35")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "ERUPTIVAS FEBRILES")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "GASTROENTERITIS VIRALES")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "INMUNOPREVENIBLES VIRALES")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "MENINGOENCEFALITIS VIRALES")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "SECUENCIACIÓN DE ÁCIDOS NUCLEICOS VIRALES")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "VIH BIOLOGÍA MOLECULAR")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "VIH SEROLOGÍA")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "VIRUS DE HEPATITIS")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "VIRUS EMERGENTES/REEMERGENTES")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "VIRUS RESPIRATORIOS")
    @driver.find_element(:id, "IMAGE1").click
    sleep 5
    @driver.find_element(:id, "vSEC_ID").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSEC_ID")).select_by(:text, "Toda la Unidad")
    @driver.find_element(:id, "IMAGE1").click
    sleep 20
  end

end
