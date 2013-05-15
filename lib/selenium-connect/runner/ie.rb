module SeleniumConnect
  class Runner
    class InternetExplorer
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def match?
        config.browser == "firefox"
      end

      def execute
        init_browser
      end

      private

      def init_browser
        config.browser.to_sym
      end

    end #InternetExplorer
  end #Runner
end #SeleniumConnect
