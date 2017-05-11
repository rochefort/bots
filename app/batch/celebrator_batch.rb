class CelebratorBatch
  def self.celebrate_birth_of_month
    Account.all.each do |account|
      account = Account.first
      celebs = account.players.select { |pl| pl.birth_date.month == Date.today.month }.sort_by { |pl| pl.birth_date.strftime("%m%d") }
      messages = celebs.map do |player|
        number = "%2d" % player.number
        "#{player.position} #{number} #{player.name} 選手(#{player.birth_date})"
      end

      unless messages.empty?
        puts "今月お誕生日を迎える選手です！"
        puts
        puts messages.join("\n")
        puts
        puts "おめでとうございます。"
      end
    end
  end

  def self.celebrate_birth
    Account.all.each do |account|
      account = Account.first
      celebs = account.players.select { |pl| pl.birth_date.month == Date.today.month && pl.birth_date.day == Date.today.day }
      messages = celebs.map do |player|
        number = "%2d" % player.number
        "#{player.position} #{number} #{player.name} 選手(#{player.birth_date})"
      end

      unless messages.empty?
        puts "お誕生日おめでてとうございます！"
        puts
        puts messages.join("\n")
      end
    end
  end
end
