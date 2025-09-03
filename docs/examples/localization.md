# Localization

### How can I add my own localised definitions (languages)

```php
$container = DefinitionContainerBuilder::default();
$container->add(AddressExtensionInterface::class, \My\Custom\Provider\pl_PL\Address::class, ;
$container->add(LicensePlate::class, \My\Custom\Provider\pl_PL\LicensePlate::class);
$generator = new DummyGenerator($container);
```

In this example two things happened:
* `Address` extension will be overwritten with our custom `Address` made for `pl_PL` language
* new extensions `LicensePlate` is added, so we can now use `$generator->licensePlate()` as it is defined in given class

### How can I use localised definitions

Other way to work with localised extensions is to load them all and use by hand-picking:

```php
$container = DefinitionContainerBuilder::default();
$container->add(AddressPL::class, \My\Custom\Provider\AddressPL::class);
$container->add(AddressDE::class, \My\Custom\Provider\AddressDE::class);
$generator = new DummyGenerator($container);
echo $generator->firstName(); // default (English) first name
echo $generator->ext(AddressPL::class)->firstName(); // Polish first name
echo $generator->ext(AddressDE::class)->firstName(); // German first name
```

but this way we skip `__call` in `DummyGenerator` so it won't work with any other strategy than `Simple`. It's not bad, just keep that in mind.

### How can I use providers with language pack

Please look at [readme](https://github.com/johnykvsky/dummyproviders) in providers repository. In same way you can create and use your own language providers.