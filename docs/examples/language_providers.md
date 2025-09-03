# Language providers

One of main points of DummyGenerator is to keep core language agnostic. This is why all languages has been removed from core.

`Person` extension provides only ~15 names, 15 last names and so on than can be used as first name, last name, part of email etc. If you want more, check dummyproviders to get full providers for `en_US`, `en_GB` and `pl_PL`. I have created them to show how to make them / convert from old Faker, to allow anyone to work on other languages.

Keep in mind:

* core will stay language agnostic
* I have no current plans to support any language
* I have no current plans to work on extending/improving existing language providers.
* if someone like to make a PR to improve/extend one of mentioned languages - I will gladly look at it.
* I will not accept PRs with other languages - but I will gladly link in this readme to repositories with them.


Mentioned providers for `en_US`, `en_GB` and `pl_PL` can be found in [dummyproviders](https://github.com/johnykvsky/dummyproviders/) repository.