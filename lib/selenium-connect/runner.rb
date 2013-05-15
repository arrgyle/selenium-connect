require 'selenium-connect/runners/firefox'
require 'selenium-connect/runners/ie'
require 'selenium-connect/runners/chrome'
require 'selenium-connect/runners/no_browser'

module SeleniumConnect
  class Runner
    attr_reader :driver, :config

    def initialize(config)
      @config = config
      @driver = init_driver
    end

    private

    def set_server_url
      "http://#{config.host}:#{config.port}/wd/hub"
    end

    def init_driver
      Selenium::WebDriver.for(
        :remote,
        :url => set_server_url,
        :desired_capabilities => get_browser)
    end

    def get_browser
      browser = browsers.find { |browser| browser.match? }
      browser.launch
    end

    def browsers
      firefox     = Firefox.new(config)
      ie          = InternetExplorer.new(config)
      chrome      = Chrome.new(config)
      no_browser  = NoBrowser.new(config)

      browsers = [ firefox, ie, chrome, no_browser ]
    end

  end #Runner
end #SeleniumConnect
