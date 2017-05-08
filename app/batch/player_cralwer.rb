module Batch
  class PlayerCrawler
    def run(url, account_id)
      page = Crawler.new.get(url)
      page.css("#modSoccerPlayerList tbody tr").each do |tr|
        tds = tr.css("td")
        height, weight = tds[4].text.split("/").map(&:to_i)
        Player.create!(
          position: tds[0].text,
          number: tds[1].text.to_i,
          name: tds[2].text,
          name_alias: tds[2].text.delete("　"),
          birth_date: tds[3].text.to_date,
          height: height,
          weight: weight,
          hometown: tds[5].text,
          former_team: tds[6].text,
          account_id: account_id
        )
      end
    end
  end
end

if $0 == __FILE__
  Batch::PlayerCrawler.new.run("https://soccer.yahoo.co.jp/jleague/teams/players/86", 1)
end
