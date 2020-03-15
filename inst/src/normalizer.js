let globalObj = require("get-global");
import NeologdNormalizer from "neologd-normalizer";

(function(global) {
    globalObj.normalizer = {
        normalize: function (str) {
            return NeologdNormalizer.normalize(str);
        }
    };
    Object.assign(global, globalObj);
})(global);
