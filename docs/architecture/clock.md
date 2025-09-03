# The Clock

Clock is simple implementation of PSR-20 Clock. It allows to set a clock with a timezone for generated dates.

Clock has a param to set timezone:
```php
$clock = new SystemClock('Europe/London')
```

Thanks to Clock in your extension (look at `DateTime` for example) you will have access to `$this->clock->now()` that will return `\DateTimeImmutable` object with current date time.

If no timezone param is passed it checks for `date_default_timezone_get()` and if it's missing then `UTC` timezone is used. But `date_default_timezone_get()` is returning `UTC` as default anyway.

Generator itself can return clock so you can do this to get current time:
```php
$generator->clock->now();
```

There is also `FrozenClock` ready to be used in tests - you can set it with fixed date:

```php
$clock = new FrozenClock(new \DateTimeImmutable('2025-08-11'), new \DateTimeZone('UTC'));
$generator = new DummyGenerator(DefinitionContainerBuilder::all(), new SimpleStragegy(), $clock)
// or
$generator = DummyGeneratorFactory::create();
$generator = $generator->withClock($clock);

```
