oembedList = require "./oembedList"
request = require "request"

module.exports = (str, callback) ->
	urls = Object.keys oembedList

	for url in urls
		patternMatch = false
		for pattern in oembedList[url]
			re = new RegExp pattern
			if re.test(str)
				patternMatch = true
				break

		if patternMatch
			oembedUrl = "#{url}?url=#{escape str}&format=json"
			break

	request oembedUrl, (err, res, body) ->
		if err
			callback?(err)

		else
			if res.statusCode is 200
				body = JSON.parse unescape body
				callback?(err, body)
			
			else
				callback?(new Error "request could not be made. ERROR: #{res.statusCode}")
