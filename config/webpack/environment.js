const { environment } = require('@rails/webpacker');
const babelLoader = require('./loaders/babel'); // Babel ローダーの読み込み

environment.loaders.append('babel', babelLoader);

module.exports = environment;
