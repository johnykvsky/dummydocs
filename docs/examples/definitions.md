# Working with Definitions

### What are definitions

`DummyGenerator` was build with one idea - allow anyone to eaisly replace any extension. This is why all internals are kept in container.

Container is a storage for definitions, with it's name as a key and value can be class name or object. So you can do this:

```php
$container->add(CompanyExtensionInterface::class, MyCustomCompany::class);
$luhhCalculator = new LuhnCalculator();
$container->add(LuhnCalculatorInterface::class, $luhhCalculator);
$container->add(AddressExtensionInterface::class, MyAddressExtension::create());
```

Definitions is an information about name and implementation. It can be extension (like `Adddress`) but also `Randomizer` (used internally for randomness), or calculator (like for Luhn).

Apart from extensions those are definitions stored in container, that an be replaced:

* RandomizerInterface
* ReplacerInterface
* TransliteratorInterface

And as a support for extensions:

* EanCalculatorInterface
* IbanCalculatorInterface
* IsbnCalculatorInterface
* LuhnCalculatorInterface

### How can I remove definition from container

You can do that either by calling 

```php
$generator->removeDefinition(PersonExtensionInterface::class);
```

or

```php
$container->remove(PersonExtensionInterface::class);
```

### How can I change definition on the fly

To change definition to your own implementations you have use `addDefinition()` passing original definition identifier and your custom class name:

```php
$generator->firstName(); // will generate i.e. "Harry"
$generator->addDefinition(PersonExtensionInterface::class, ElvesPerson::class);
$generator->firstName(); // will generate i.e. "Fingolfin"
```

**Beware**, this will clear internal cache for all extensions, so they will be resolved again. Not a big deal, but worth keeping in mind.

If you want you can do that at container initialization via `add()` method:

```php
$container = DefinitionContainerBuilder::all(); // all extensions
$container->add(CompanyExtensionInterface::class, MyCustomCompany::class); // now MyCustomerCountry will be used ie. for $generator->company()
$container->add(RandomizerInterface::class, MyRandomizer::class); // now MyRandomizer will be used for every internal call ie. to randomElement()
$container->add(TransliteratorInterface::class, TransliteratorOnSteroids::class); // now TransliteratorOnSteroids will be used for transliterate()  
$container->add(LuhnCalculatorInterface::class, ProperLuhnCalculator::class); // now ProperLuhnCalculator will be used Luhn operations 
$generator = new DummyGenerator($container);
```

### How can I use generator or randomizer in my custom extension

There are just 2 things to remember:

* your extension need to implement proper extension interface
* you need to use proper trait matched with interface

And those pairs look like this:

* `RandomizerAwareExtensionInterface` matched with `RandomizerAwareExtensionTrait`
* `ReplacerAwareExtensionInterface` matched with `ReplacerAwareExtensionTrait`
* `EanCalculatorExtensionInterface` matched with `EanCalculatorAwareExtensionTrait`
* `IbanCalculatorExtensionInterface` matched with `IbanCalculatorAwareExtensionTrait`
* `IsbnCalculatorExtensionInterface` matched with `IsbnCalculatorAwareExtensionTrait`
* `LuhnCalculatorExtensionInterface` matched with `LuhnCalculatorAwareExtensionTrait`

And that's all. Behind the scenes when fetching definition, container check if it implements one of those interfaces and add proper dependency. 

If in your extension you implement `RandomizerAwareExtensionInterface`, add trait `RandomizerAwareExtensionTrait` - you can use `$this->randomizer` as implementation of either default `Randomizer` or any other service you have put in `DefinitionContainer` under the name `RandomizerInterface::class`

One notice - there is also `TransliteratorAwareReplacerInterface` and `TransliteratorAwareReplacerTrait` since `Replacer` itself does `transliterate()` and needs this dependency.
