const { environment } = require('@rails/webpacker');

// nodeの設定を削除する
delete environment.config.node;

module.exports = environment.toWebpackConfig();
