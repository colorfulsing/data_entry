const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')

const webpack = require('webpack');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}));

const aliasConfig = {
    // 'jquery': 'jquery/src/jquery',
    // //'jquery-ui': 'jquery-ui-dist/jquery-ui.min.js',
    // 'bootstrap-datepicker': 'bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js',
    // 'bootstrap-datepicker-locale': 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'
};
environment.config.set('resolve.alias', aliasConfig);

environment.loaders.prepend('coffee', coffee)
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})
module.exports = environment
