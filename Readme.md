# oEmbed Auto

[![Build Status](https://secure.travis-ci.org/inspiredjw/oembed-auto.png)](http://travis-ci.org/inspiredjw/oembed-auto)

Make an [oEmbed][0] request with a content url

Just request with a single content url and you will get a proper [oEmbed][0] response

## Installation
```bash
$ npm install oembed-auto
```

## Usage (JavaScript)
```javascript
var oembed = require("oembed-auto");

oembed("http://www.youtube.com/watch?v=9bZkp7q19f0", function (err, data) {
  console.log(data);
});
```

## Usage (CoffeeScript)
```coffeescript
oembed = require "oembed-auto"

oembed "http://www.youtube.com/watch?v=9bZkp7q19f0", (err, data) ->
  console.log data
```

## Result
```javascript
{
  thumbnail_width: 480,
  height: 270,
  author_url: 'http://www.youtube.com/user/officialpsy',
  title: 'PSY - GANGNAM STYLE (강남스타일) M/V',
  author_name: 'officialpsy',
  html: '<iframe width="480" height="270" src="http://www.youtube.com/embed/9bZkp7q19f0?feature=oembed" frameborder="0" allowfullscreen></iframe>',
  provider_name: 'YouTube',
  version: '1.0',
  thumbnail_height: 360,
  type: 'video',
  width: 480,
  thumbnail_url: 'http://i1.ytimg.com/vi/9bZkp7q19f0/hqdefault.jpg',
  provider_url: 'http://www.youtube.com/'
}
```

## Run Tests
```bash
make test
```

## How to Contribute
More [oEmbed][0] request rules are welcomed :)

- Firstly, you should `npm install -d` after cloning this repo.
- Add more rules in `src/oembedList.json`
- Run `make compile` and pull-request your version

## License

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[0]: http://oembed.com