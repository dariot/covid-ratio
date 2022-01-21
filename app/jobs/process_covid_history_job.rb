class ProcessCovidHistoryJob < ApplicationJob
  uri = URI('https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale.json')
  p 'Getting json data'
  res = Net::HTTP.get_response(uri)
  if res.is_a?(Net::HTTPSuccess)
    p 'Got response from server'
    output = JSON.parse(res.body)

    output.each do |day|
      date = Date.parse day['data']
      new_positives = day['nuovi_positivi']
      total_tampons = day['tamponi']
      last_day = date - 1.day

      if Reading.where(date: last_day).count == 0
        p 'Writing first record on DB'
        Reading.create(
          date: date,
          new_positives: new_positives,
          total_tampons: total_tampons,
          new_tampons: 0,
          ratio: 0
        )
        p 'Write successful'
      else
        last_reading = Reading.find_by(date: last_day)
        new_tampons = total_tampons - last_reading.total_tampons
        p 'Updating DB'
        Reading.create(
          date: date,
          new_positives: new_positives,
          total_tampons: total_tampons,
          new_tampons: new_tampons,
          ratio: (new_positives.to_f / new_tampons.to_f * 100).round(2)
        )
        p 'Update successful'
      end
    end
  end
end
