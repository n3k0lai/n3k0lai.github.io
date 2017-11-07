const path = require('path')

module.exports = {
  target: 'node',
  entry: {
    javascript: './src/app.js',
    html: './src/index.html'
  },
  output: {
    path: path.resolve(__dirname, 'build'),
    filename: 'main.bundle.js'
  },
  devtool: 'source-map',
  module: {
    loaders: [
      {
        test: /\.js$/,
        include: path.join(__dirname, 'src'),
        exclude: /node_modules/,
        use: [{
          loader: 'babel-loader',
          query: {
            presets: ['es2015-node4']
          }
        }, {
          loader: 'react-hot-loader'
        }]
      }, {
        test: /\.html$/,
        loader: 'file-loader?name=[name].[ext]'
      }, {
        test: /\.md$/,
        include: path.join(__dirname, 'posts'),
        loader: 'babel-loader!react-markdown'
      }
    ]
  },
  stats: {
    colors: true
  }
}
