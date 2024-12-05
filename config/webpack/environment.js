const { environment } = require('@rails/webpacker')
const { resolve } = require('path')

const customConfig = {
  resolve: {
    alias: {
      '@': resolve('app/javascript')
    }
  }
}

environment.config.merge(customConfig)

module.exports = environment
