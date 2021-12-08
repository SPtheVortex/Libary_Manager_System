function querystring2obj(url) {
    var queryArr = (url && url.substr(url.indexOf("?") + 1).split("&")) || location.search.substr(1).split("&"),
        query = {};
    for (var i = 0, len = queryArr.length; i < len; i++) {
        var key = queryArr[i].split("=")[0],
            val = queryArr[i].split("=")[1];
        if (query.hasOwnProperty(key)) {
            if (!Array.isArray(query[key])) {
                query[key] = [query[key]];
                query[key].push(val);
            } else {
                query[key].push(val);
            }
            continue;
        }
        query[key] = val;
    }
    return query;
}
var queryString = querystring2obj();