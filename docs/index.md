# DummyGenerator

[![Software License][ico-license]](LICENSE)

## Installation

```shell
composer require johnykvsky/dummygenerator --dev
```

## About

**DummyGenerator** is dummy/fake data generator for PHP. It's a fork of Faker, heavily rewritten at core, but overall is same easy to use. In example:

```php
$generator = DummyGeneratorFactory::create(); // all extensions are loaded
echo $generator->firstName();
```

## But why...?

Faker died because of being hard to maintain as mentioned in [sunsetting-faker](https://marmelab.com/blog/2020/10/21/sunsetting-faker.html).
Faker 2.0 seems to be dead because of ["death by committee"](https://github.com/FakerPHP/Faker/discussions/15#discussioncomment-7787434) kind of stuff.

I needed simple dummy data generator for PHP 8.3, with modern architecture in mind. This is how **DummyGenerator** came to life.

## Changes (vs Faker)

* required PHP >= 8.3
* PHPStan level 8 friendly
* PHPUnit tests for core and extensions (yep, some just check for not empty, but hey, it's random data)
* all `mt_rand` / `array_rand` replaced with `\Random\Randomizer`
* no static methods, only one magic method (`__call()` in generator)
* interfaces and dependency injection for everything (all core implementations can be replaced with different ones)
* implementations can be changed on the fly with `addDefinition()`
* language providers removed from core, that makes generator ~9.5Mb smaller
* changed `DateTime` extension, it supports `DateTimeInterface` for methods params (not only strings)
* changed `Uuid`, it supports `v4` only, use `uuid4()`
* removed database providers (core is only for dummy data generation)
* removed `HmlLorem`
* removed `File::filePath()` since it was interacting with system, not only generating dummy data
* added `Enum`, to get random values from PHP enums
* added `String`, to generate random string from given pool
* added support for `SystemClock`, PSR-20 implementation of Clock

This package also fixes problem with FakerPHP `__destruct()` messing up with `seed()`, plus various other issues.

There are two Randomizer implementations available: 
* default `Randomizer` 
* additional `XoshiroRandomizer`, which supports `seed()` - to be used in tests

## Why PHP >= 8.3

Because of introduced in PHP 8.3:

* `Randomizer::getFloat()`
* `Randomizer::getBytesFromString()`
* and not so important but nice: typed class constants

## Other stuff

There is `script\ExtensionsDocs.php` that can be used to generate list of available extensions and their methods (look at `generate-spec.php`)

Since PHPUnit is still missing `--repeat`, in repository [phpunit-repeat](https://github.com/johnykvsky/phpunit-repeat) you can find Linux shell script for running tests multiple times.


[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square
