class HomeController < ApplicationController
  def index
    url = 'https://github.com/pcm-dpc/COVID-19/blob/master/schede-riepilogative/regioni/dpc-covid19-ita-scheda-regioni-latest.pdf'
    p GetPdfCommand.process(url)
  end
end
