let globalObj = require("get-global");
const tm = require("text-miner");
const corpus = new tm.Corpus([]);

(function(global) {
    globalObj.corpus = corpus;
    globalObj.tm = {
        documentTermMatrix: function(corpus){ return new tm.DocumentTermMatrix(corpus) },
        expandContractions: tm.expandContractions,
        weightTfIdf: tm.weightTfIdf
    };
    Object.assign(global, globalObj);
})(global);
