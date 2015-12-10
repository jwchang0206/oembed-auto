/**
 * Testing
 * @ndaidong
 */

/* global describe it before */
/* eslint no-undefined: 0*/
/* eslint no-array-constructor: 0*/
/* eslint no-new-func: 0*/

'use strict';

var chai = require('chai');

chai.should();
var expect = chai.expect;

var AP = require('../../../src/oembed');
var extract = AP.extract;

let samples = [
  'https://www.youtube.com/watch?v=8jPQjjsBbIc',
  'https://vimeo.com/146753785',
  'https://twitter.com/ndaidong/status/674458092126388225',
  'http://www.ted.com/talks/tony_robbins_asks_why_we_do_what_we_do',
  'https://soundcloud.com/wlrn/1104am-local-government-opposed-to-bill-that-would-streamline-elections-1'
];


var testOne = (url) => {
  describe('.extract("' + url + '")', () => {

    let article;

    before((done) => {
      extract(url).then((art) => {
        article = art;
      }).catch((e) => {
        console.log(e);
        return false;
      }).finally(done);
    });

    describe('Checking result...', () => {

      it(' should be object', (done) => {
        expect(article).to.be.an('object');
        done();
      });

      it(' should have required properties', (done) => {
        expect(article).to.include.keys(['type', 'version', 'html', 'provider_url', 'provider_name']);
        done();
      });

      it(' type must be string, not empty', (done) => {
        expect(article.type).to.be.a('string');
        expect(article.type).to.have.length.at.least(1);
        done();
      });
      it(' html must be string, not empty', (done) => {
        expect(article.html).to.be.a('string');
        expect(article.html).to.have.length.at.least(1);
        done();
      });
      it(' provider_url must be string, not empty', (done) => {
        expect(article.provider_url).to.be.a('string');
        expect(article.provider_url).to.have.length.at.least(1);
        done();
      });
      it(' provider_name must be string, not empty', (done) => {
        expect(article.provider_name).to.be.a('string');
        expect(article.provider_name).to.have.length.at.least(1);
        done();
      });
    });
  });
}

samples.map(testOne);
