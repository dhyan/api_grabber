require File.dirname(__FILE__) + "/../automation_script/sample_app.rb"

class Basic_Validation

  describe "Validation for Homepage" do

  	before (:all) do
      @object = User_Interface.new
      @object.load_yaml
      @object.selenium_browser_setup
    end

    after (:all) do
      @object.close_browser
    end
    
    it "should inclue all components" do
      @object.welcome_text.displayed?
      @object.latest_tweets_text.displayed?
      @object.username_field.displayed?
      @object.go_button.displayed?
    end

    it "should enter values and click go button" do
      @object.username_field.send_keys "dhyan"
      @object.go_button.click
    end

    it "should redirect to listing results page and include all components" do
      sleep 10
      @object.listing_contents.displayed?
      @object.github_repositories.displayed?
      @object.date_of_joining.displayed?
      @object.download_link.displayed?
    end

    [1,2,3,4,5,6].each do |i|

      it "should include the results list" do
        @object.results_list(i)
      end

    end

  end

end