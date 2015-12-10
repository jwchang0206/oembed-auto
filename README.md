# oembed-auto-es6
oEmbed extractor, based on [oembed-auto](https://github.com/inspiredjw/oembed-auto) by JeongWoo Chang

 [![NPM](https://badge.fury.io/js/oembed-auto-es6.svg)](https://badge.fury.io/js/oembed-auto-es6)
 ![Travis](https://travis-ci.org/techpush/oembed-auto-es6.svg?branch=master)

### Installation

```
npm install oembed-auto-es6
```

### Usage

```
import oEmbed from 'oembed-auto-es6';

let url = 'https://www.youtube.com/watch?v=8jPQjjsBbIc';

oEmbed.extract(url).then((data) => {
  console.log(data);
}).catch((err) => {
  console.log(err);
});
```


## Test

```
npm install
mocha
```

 _* Ensure that you have [mocha](https://mochajs.org/) installed_
