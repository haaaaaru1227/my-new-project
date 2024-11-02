pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "application", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"
