# What is this fake / dummy data

When writing tests or populating test database you need to came up with various data, like first name, last name, some dates, maybe description, location coordinates and so on. When you deal with multi-language site and want to have it also multilanguage - you need to came up with every language names or address format.

All of that can be done by hand, but it's much easier to do `$generator->firstName()` and just don't care about what name it will be. Load provider and don't care about given locale names or phone formats.

Another use case - imagine you have description with 100 chars limit and want to test if it properly gives error when more is passed - instead of copying some text you can just use `$generator->text(150)` to get ~150 characters long text.

Last but not least - it make sure your tests will get random data on each run, not every single time same value. If your code is good and tests correct - then it should be no problem. If tests start failing from time to time - then what you think, where is the problem:

* with code
* with tests
* with random data, it should not be random

I leave answer to you. And yes, there might be cases when data should not be random, but usually it's not that case ;)
