# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Adicione diretórios customizados se quiser
# Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")
Rails.application.config.assets.paths << Rails.root.join("node_modules")

# Pré-compilar arquivos adicionais, se necessário
Rails.application.config.assets.precompile += %w[ cable.js
                                                  welcome.js
                                                  coins.js
                                                  mining_types.js
                                                ]

Rails.application.config.assets.precompile += %w[ welcome.css
                                                  coins.css
                                                  mining_types.css
                                                  scaffold.css
                                                ]
