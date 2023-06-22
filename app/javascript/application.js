import $ from 'jquery'
window.jQuery = $
window.$ = $

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// jQueryはturboと仲悪いのなんで！！
// import "@hotwired/turbo-rails"
import "controllers"
