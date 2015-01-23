require 'rubygems'
require 'selenium-webdriver'
require 'selenium/client'
require 'yaml'

class User_Interface
  def selenium_browser_setup
    @Test1 = Selenium::WebDriver.for @browser
    @wait = Selenium::WebDriver::Wait.new(:timeout => 3)
    @Test1.manage.window.maximize
    @Test1.get @url
  end
  def welcome_text
  	@wait.until{@Test1.find_element(:xpath, "//*[contains(text(), 'Welcome')]")}
  end
  def latest_tweets_text
  	@wait.until{@Test1.find_element(:xpath, "//*[contains(text(), 'Find your latest')]")}
  end
  def username_field
  	@wait.until{@Test1.find_element(:xpath, "//*[@id='username']")}
  end
  def go_button
  	@wait.until{@Test1.find_element(:xpath, "//input[@name='commit']")}
  end
  def listing_contents
  	@wait.until{@Test1.find_element(:xpath, "//*[contains(text(), 'Listing results')]")}
  end
  def download_link
  	@wait.until{@Test1.find_element(:xpath, "//*[@href='#']")}
  end
  def github_repositories
  	@wait.until{@Test1.find_element(:xpath, "//*[contains(text(), 'Github repositories')]")}
  end
  def date_of_joining
  	@wait.until{@Test1.find_element(:xpath, "//*[contains(text(), 'Date of Joining')]")}
  end
  def results_list(a)
  	@wait.until{@Test1.find_element(:xpath, "//html/body/div[1]/div/ul/li[#{a}]")}
  end
  def load_yaml
    @hash = YAML.load_file(File.dirname(__FILE__) + '/../automation_script/Input.yml')
    @browser = @hash["Browser"]
    @url = @hash["Url"]
  end
  def close_browser
  	@Test1.close
  end
end

