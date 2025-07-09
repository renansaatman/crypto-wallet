namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB...") { %x(rails db:drop) }
      show_spinner("Criando DB...") { %x(rails db:create) }
      show_spinner("Migrando DB...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://toppng.com/public/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png",
          mining_type: MiningType.find_by(acronym: "PoW")
        },
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://tse1.mm.bing.net/th/id/OIP.IBhWVO2kN65S9fCcR2xWOwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          mining_type: MiningType.all.sample
        },
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://logodix.com/logo/629168.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://www.liblogo.com/img-logo/io1725icf2-iota-logo-iota-logo.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://cdn.freelogovectors.net/wp-content/uploads/2021/12/zcash-logo-freelogovectors.net_.png",
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {
          description: "Proof of Work",
          acronym: "PoW"
        },
        {
          description: "Proof of Stake",
          acronym: "PoS"
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC"
        }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end


  private
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
