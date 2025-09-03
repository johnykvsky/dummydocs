# Extensions How-To


### Using EnumExtension

Enum extension allows you to get random element or value from selected Enum object. It has two methods:

* enumValue(), that will get value from backed enums (which has to be string or int)
* enumCase(), that will get one of `cases()` element from enum (it will be `UnitEnum` object) 

`enumValue()` has to be used on backed enums, but `enumCase()` works for backed and non-backed enums.

For following enum:

```php
enum SuitBackedIntEnum: string
{
    case Hearts = 'Hearts';
    case Diamonds = 'Diamonds';
    case Clubs = 'Clubs';
    case Spades = 'Spades';
}
```

You can do following:

```php
$container = DefinitionContainerBuilder::base(); // base extensions 
$generator = new DummyGenerator($container);
$generator->enumCase(SuitBackedIntEnum::class); // it will get random element, i.e. SuitBackedIntEnum::Diamonds
// or
$generator->enumValue(SuitBackedIntEnum::class); // it will get random value, i.e. "Spades"
```

### Using StringsExtension

With `LoremExtension` you can generate `words()` or `text()`. You can generate single word too - with `word()`, it will give you random words from Lorem Ipsum sample.

In [dummyproviders](https://github.com/johnykvsky/dummyproviders) there is also `TextExtension` that allows you to generate random text with given length with `realText()`.

But sometimes you want just a simple random string, with given length or given structure: only letters, with some numbers, with capital letters. This is where `StringsExtension` can help you:

```php
$container = DefinitionContainerBuilder::base(); // base extensions 
$generator = new DummyGenerator($container);
$string1 = $generator->string(); // it will give you random string, lowercase, with length between 3 and 8
$string2 = $generator->string(3, 3); // it will give you random string, lowercase, with length equal to 3
$string4 = $generator->string(3, 10, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'); // it will give you random string, mixed case, with length from 3 to 10
```

As you can see you can pass any chars pool for generation. `StringsExtension` comes with 3 predefined pools:

 * `Strings::ALPHA_POOL` equals to `abcdefghijklmnopqrstuvwxyz`;
 * `Strings::ALPHA_CASE_POOL` equals to `abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`;
 * `Strings::ALPHA_NUM_POOL` equals to `0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`;

If you want to have string with possible spaces - just create your own pool, i.e. `abcdefghijkl mnopqrstuvwxyz`

At core, it uses `\Random\Randomizer::getBytesFromString()` to generate random string.

