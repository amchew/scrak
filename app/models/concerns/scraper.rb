class Scraper

	def self.scrape

		data = HTTParty.get('http://www.brainyquote.com/quotes/authors/d/dr_seuss.html')
		response_body = data.response.body

		doc = Nokogiri::HTML(response_body)
		
		# keep link.content in the quotes
		quotes = []
		doc.css('.bqQuoteLink a').each do |link|
			quotes << link.content
			
		end

		element = rand(quotes.count - 1)
		quotes[element]
	
	end
end