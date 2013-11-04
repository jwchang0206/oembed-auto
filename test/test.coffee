should = require("chai").should()
oembed = require "../lib/oembed"

describe "oEmbed request", ->
	describe "with a YouTube url", ->
		it "should response", (done) ->
			oembed "http://www.youtube.com/watch?v=9bZkp7q19f0", (err, data) ->
				data.provider_name.should.equal "YouTube"
				data.type.should.equal "video"
				should.exist data.title
				should.exist data.html
				should.exist data.provider_url
				should.exist data.thumbnail_url
				should.exist data.thumbnail_width
				should.exist data.thumbnail_height
				done()
	
	describe "with an invalid YouTube url", ->
		it "should raise error", (done) ->
			oembed "http://www.youtube.com/watch?v=invalidUrl", (err, data) ->
				should.exist err
				done()

	describe "with a Flickr url", ->
		it "should response", (done) ->
			oembed "http://www.flickr.com/photos/dillemma/10279362226", (err, data) ->
				data.provider_name.should.equal "Flickr"
				data.type.should.equal "photo"
				should.exist data.title
				should.exist data.width
				should.exist data.height
				should.exist data.url
				should.exist data.thumbnail_url
				should.exist data.thumbnail_width
				should.exist data.thumbnail_height
				done()

	describe "with an invalid Flickr url", ->
		it "should raise error", (done) ->
			oembed "http://www.flickr.com/photos/something/12345", (err, data) ->
				should.exist err
				done()

	describe "with a Vimeo url", ->
		it "should response", (done) ->
			oembed "http://vimeo.com/38370036", (err, data) ->
				data.provider_name.should.equal "Vimeo"
				data.type.should.equal "video"
				should.exist data.title
				should.exist data.html
				should.exist data.provider_url
				should.exist data.thumbnail_url
				should.exist data.thumbnail_width
				should.exist data.thumbnail_height
				done()

	describe "with an invalid Vimeo url", ->
		it "should raise error", (done) ->
			oembed "http://vimeo.com/00000", (err, data) ->
				should.exist err
				done()

	describe "with an boolean type of url", ->
		it "should raise error", (done) ->
			oembed true, (err, data) ->
				should.exist err
				done()

	describe "with an empty url", ->
		it "should raise error", (done) ->
			oembed "", (err, data) ->
				should.exist err
				done()

	describe "with fake url", ->
		it "should raise error", (done) ->
			oembed "http://does.notexist/asdf", (err, data) ->
				should.exist err
				done()