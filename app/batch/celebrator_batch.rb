class CelebratorBatch
  class << self
    def celebrate_birth_of_month
      Account.all.each do |account|
        celebs = account.players.select { |pl| pl.birth_date.month == Date.today.month }.sort_by { |pl| pl.birth_date.strftime("%m%d") }
        body = celebs.map do |player|
          number = "%2d" % player.number
          "#{player.position} #{number} #{player.name} 選手(#{player.birth_date})"
        end
        msg = generate_birth_of_month_message(body)
        client = TwitterClient.new(account)
        client.tweet(msg)
      end
    end

    def celebrate_birth
      Account.all.each do |account|
        celebs = account.players.select { |pl| pl.birth_date.month == Date.today.month && pl.birth_date.day == Date.today.day }
        body = celebs.map do |player|
          number = "%2d" % player.number
          "#{player.position} #{number} #{player.name} 選手"
        end
        msg = generate_birth_message(body)
        client = TwitterClient.new(account)
        client.tweet(msg)
      end
    end

    private
      def generate_birth_of_month_message(body)
        return "" if body.empty?
        "今月お誕生日を迎える選手です！\n" +
        "おめでとうございます。\n" +
        "\n" +
        body.join("\n") + "\n"
      end

      def generate_birth_message(body)
        return "" if body.empty?
        "お誕生日おめでてとうございます！\n" +
        "\n" +
        body.join("\n")
      end
    end
end
