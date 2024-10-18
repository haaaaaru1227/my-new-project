threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

port ENV.fetch("PORT", 3000)

# SSL設定
ssl_bind '0.0.0.0', '3001', {
  key: "server.key",
  cert: "server.crt",
  verify_mode: 'none'
}

plugin :tmp_restart
