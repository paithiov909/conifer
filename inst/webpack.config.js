const path = require('path');

module.exports = {
  mode: 'production',
  target: 'web',
  entry: {
    elasticlunr: './src/elasticlunr.js',
    normalizer: './src/normalizer.js',
    textminer: './src/textminer.js'
  },
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'js'),
    libraryTarget: 'var'
  },
  resolve: {
    mainFields: ['browser', 'module', 'main']
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components|lunr-languages)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: [
              ['@babel/preset-env', { useBuiltIns: 'usage', corejs: 3 }]
            ],
          }
        }
      }
    ]
  }
};
