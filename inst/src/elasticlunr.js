let globalObj = require("get-global");

const elasticlunr = require('elasticlunr');
require('../lunr-languages/lunr.stemmer.support.js')(elasticlunr);
require('../lunr-languages/lunr.jp.js')(elasticlunr);

const index = elasticlunr(function() {
    this.use(elasticlunr.jp);
    this.addField('body');
    this.setRef('id');
});

(function(global) {
  globalObj.elasticlunr = index;
  Object.assign(global, globalObj);
})(global);
