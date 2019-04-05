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
    @driver.find_element(:id, "vMENU").click
    sleep 2
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vMENU")).select_by(:text, "RECEPCION")
    @driver.find_element(:id, "vMENU").click
    @driver.find_element(:id, "BTNCONFIRMAR").click
    sleep 3
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='.'])[1]/following::span[2]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Recepción'])[1]/following::td[2]").click
    sleep 3
    @driver.find_element(:id, "INSERT").click
    sleep 3
    @driver.find_element(:id, "vPEST_ID").clear
    @driver.find_element(:id, "vPEST_ID").send_keys("1430", :tab)
    sleep 3
    @driver.find_element(:id, "CTLSELECCIONA_0001").click
    @driver.find_element(:id, "BUTTON1").click
    sleep 3
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "vSOL_PACIENTETIPODOCD")).select_by(:text, "PASAPORTE")
    @driver.find_element(:id, "BTN_ENTER").click
    @driver.switch_to().alert().text. should == "Ingrese Pais, Tipo Documento y Nº de Documento"
    @driver.switch_to().alert().accept()
    sleep 3
    @driver.switch_to().alert().text. should == "Debe especificar un paciente"
    @driver.switch_to().alert().accept()
  end

end
