class Reading < ApplicationRecord
  # def self.update_db
  #   uri = URI('https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale-latest.json')
  #   p 'Getting json data'
  #   res = Net::HTTP.get_response(uri)
  #   if res.is_a?(Net::HTTPSuccess)
  #     p 'Got response from server'
  #     output = JSON.parse(res.body).first
  #     date = Date.parse output['data']
  #     new_positives = output['nuovi_positivi']
  #     total_tampons = output['tamponi']
  #     last_day = date - 1.day

  #     if Reading.where(date: date).count == 0
  #       p 'Latest data not found on DB'
  #       if Reading.where(date: last_day).count == 0
  #         p 'Writing first record on DB'
  #         Reading.create(date: date,
  #           new_positives: new_positives,
  #           total_tampons: total_tampons,
  #           new_tampons: 0
  #         )
  #         p 'Write successful'
  #       else
  #         last_reading = Reading.find_by(date: last_day)
  #         new_tampons = total_tampons - last_reading.total_tampons
  #         p 'Updating DB'
  #         Reading.create(date: date,
  #           new_positives: new_positives,
  #           total_tampons: total_tampons,
  #           new_tampons: new_tampons
  #         )
  #         p 'Update successful'
  #       end
  #     else
  #       p 'Latest data already present on DB'
  #     end
  #   end
  # end
end
