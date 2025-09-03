# Seed

DummyGenerator generate random data. Which is fine, but sometimes (i.e.: in tests) you want it to generate same data each time. This is where `seed()` comes to the rescue.

Method `seed()` accepts param with a seed number. If you initialize generator with `seed(1434)`  it will always return same name for `->firstName()`, same address for `->buildingNumber()`, same color for `->hexColor()` and so on.

### How can I use seed()

You have to change default randomizer to `XoshiroRandomizer` with desired seed number, i.e. for `seed=123` it would be:

```php
    // standard initialization, adapt this to your needs
    $container = \DummyGenerator\Container\DefinitionContainerBuilder::base();
    $generator = new \DummyGenerator\DummyGenerator($container);  
    // replace randomizer with XoshiroRandomizer, which supports seed
    $generator->addDefinition(
        \DummyGenerator\Definitions\Randomizer\RandomizerInterface::class,
        new \DummyGenerator\Core\Randomizer\XoshiroRandomizer(seed: 123)
    );
    // and from now on generator will use fixed seed to get data
```
