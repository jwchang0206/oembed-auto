'use strict';

var bella = require('bellajs');
var Promise = require('bluebird');
var request = require('request');
var oembedList = require('./oembedList');

var extract = (str) => {
  return new Promise((resolve, reject) => {
    let oembedUrl, patternMatch;

    let urlRegEx = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/;

    if(!str || !bella.isString(str) || !urlRegEx.test(str)){
      return reject(new Error('Given url is not a valid url'));
    }

    let urls = Object.keys(oembedList);
    for(let i = 0; i < urls.length; i++){
      let url = urls[i];
      patternMatch = false;
      let ref = oembedList[url];
      for(let j = 0; j < ref.length; j++){
        let re = new RegExp(ref[j]);
        if(re.test(str)){
          patternMatch = true;
          break;
        }
      }
      if(patternMatch){
        let estr = escape(str);
        oembedUrl = `${url}?url=${estr}&format=json`;
        break;
      }
    }

    if(!oembedUrl){
      return reject(new Error('Given url is not supported by oembed-auto'));
    }
    return request(oembedUrl, (err, res, body) => {
      if(err){
        return reject(err);
      }
      if(res.statusCode !== 200){
        return reject(new Error('Request could not be made. ERROR: ' + res.statusCode));
      }
      try{
        let oem = JSON.parse(unescape(body));
        return resolve(oem);
      }
      catch(e){
        return reject(e);
      }
    });
  });
}

module.exports = {
  extract: extract
}
