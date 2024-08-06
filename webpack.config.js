const webpack = require('webpack');

module.exports = {
    // your existing webpack configuration
    resolve: {
        fallback: {
            "http": require.resolve("stream-http"),
            "zlib": require.resolve("browserify-zlib"),
            "querystring": require.resolve("querystring-es3"),
            "path": require.resolve("path-browserify"),
            "crypto": require.resolve("crypto-browserify"),
            "fs": false,
            "stream": require.resolve("stream-browserify"),
            "net": false,
        }
    },
    plugins: [
        new webpack.ProvidePlugin({
            process: 'process/browser',
            Buffer: ['buffer', 'Buffer'],
        }),
    ]
};
