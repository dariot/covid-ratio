class GetPdfCommand < Kimurai::Base
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    viewer_url = response.xpath("//iframe[@title='File display']").attr('src').value
    commit = viewer_url.scan(/commit=\d*\w*/).first.gsub('commit=', '')

    p "https://raw.githubusercontent.com/pcm-dpc/COVID-19/#{commit}/schede-riepilogative/regioni/dpc-covid19-ita-scheda-regioni-latest.pdf"
  end
end
