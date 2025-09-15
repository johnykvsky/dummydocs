# The Container

Container holds definitions - definitions are classes that can be used for generation stuff you need.
Each item you can generate has own interface and implementation and you can change if needed.

Available definitions interfaces are in `src/Definitions` directory and their implementation is in `src/Extensions`.

Each of them can be added to container and passed to `DummyGenerator`.

To make it easier there is `DefinitionContainerBuilder` that uses `DefinitionPack` with 3 predefined definitions packages:

* **Base**: [AnyDateTime](../extensions/anydatetime.md), [Enum](../extensions/enum.md), [Lorem](../extensions/lorem.md), [Number](../extensions/number.md), [Strings](../extensions/strings.md), [Uuid](../extensions/uuid.md) 
* **Default**, all from Base plus: [Coordinates](../extensions/coordinates.md), [Country](../extensions/country.md), [Hash](../extensions/hash.md), [Internet](../extensions/internet.md), [Language](../extensions/language.md), [Person](../extensions/person.md)
* **All**, all from Default plus: [Address](../extensions/address.md), [Barcode](../extensions/barcode.md), [Biased](../extensions/biased.md), [Blood](../extensions/blood.md), [Color](../extensions/color.md), [Company](../extensions/company.md), [DateTime](../extensions/datetime.md), [File](../extensions/file.md), [Payment](../extensions/payment.md), [PhoneNumber](../extensions/phone_number.md), [UserAgent](../extensions/user_agent.md), [Version](../extensions/version.md)

Sample usage of `DefinitionContainerBuilder` looks like this:
```php
$container = DefinitionContainerBuilder::all(); // to get all extensions
```

# Replacing Strategy or Clock

You can create `DummyGenerator` with given strategy or clock, but you can also change strategy or clock in currently used generator:
```php
$generator = new DummyGenerator(DefinitionContainerBuilder::all(), new SimpleStrategy(), new SystemClock());
$clock = new SystemClock(new \DateTimeZone('UTC'));
$strategy = new UniqueStrategy(retries: 500);
$generator = $generator->withClock($clock)->withStrategy($strategy);

```
