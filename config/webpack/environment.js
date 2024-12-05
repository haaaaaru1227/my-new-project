const { environment } = require('@rails/webpacker');

// エントリポイントを明示的に追加
environment.config.merge({
  entry: {
    application: './app/javascript/packs/application.js', // 必要なエントリポイントを追加
  },
});

module.exports = environment;
