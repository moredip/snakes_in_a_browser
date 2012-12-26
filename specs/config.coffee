requirejs = require('requirejs')

requirejs.config
    #Pass the top-level main.js/index.js require
    #function to requirejs so that node modules
    #are loaded relative to the top-level JS file.
    nodeRequire: require
    baseUrl: './source/coffeescripts'
    paths:
      cs:'../../specs/cs'

chai = require('chai')
global.expect = chai.expect
sinonChai = require("sinon-chai")
chai.use(sinonChai)

global.sinon = require('sinon')
