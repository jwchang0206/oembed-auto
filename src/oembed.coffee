oembedList = require "./oembedList"
request = require "request"

module.exports = (str, callback) ->
	urlRegEx = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
	if str? and typeof str is "string" and urlRegEx.test(str)
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

		options = {
			url: oembedUrl,
			headers: {
				'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
			}
		}

		if oembedUrl?
			request options, (err, res, body) ->
				if err
					callback?(err)

				else
					if res.statusCode is 200
						body = JSON.parse unescape body
						callback?(err, body)

					else
						callback?(new Error "request could not be made. ERROR: #{res.statusCode}")

		else
			callback?(new Error "given url is not supported by oembed-auto")

	else
		callback?(new Error "given url is not a valid url")
