Dir[File.join(__dir__, 'modules', '*.rb')].each {|file| require file }

module Main
  class Worksection::Client
    include GettingData
    include Creating
    include Editing
#  include Files

    attr_accessor :domain, :apikey, :use_ssl

    def initialize(domain, apikey, use_ssl = true)
      @domain = domain
      @apikey = apikey
      @use_ssl = use_ssl
    end

    private

    def collect_params(**args)
      args.reduce(''){ |acc,(key,value)| acc + "&#{key}=#{value}" }
    end

    def perform_request(url)
      Net::HTTP.start(url.host, url.port, use_ssl: @use_ssl) do |http|
        request = Net::HTTP::Get.new(url)
        response = http.request request
        JSON.parse(response.body)
      end
    end

    def to_md5(method, page = '')
      Digest::MD5.hexdigest(page + method + @apikey)
    end
  end
end
