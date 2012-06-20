clean-my-vomit
==============

Ruby gem that makes nested hashes and big hashes derived from JSON more readable in IRB.

To install:

`gem install clean-my-vomit`

To use: 

```
require 'clean-my-vomit'

> {"1"=>"2"}.polish
#=> 1 => 2

> {"1" => [2,3,4]}.polish
#=> 1 =>[
#=>    2
#=>    3
#=>    4
#=>    ]
```

This gem is really intended for long JSON hashes that you tend to get from external APIs. To really see this guy in action, here's an example you can use:

```
url = "https://graph.facebook.com/98423808305"

JSON.parse(open(url).read).polish
```

Now what JSON vomits out is prettier!