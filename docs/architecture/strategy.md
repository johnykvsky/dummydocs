# The Strategy

Strategy tells DummyGenerator how to generate things. You have 4 predefined strategies ready to be used: 

* `SimpleStrategy` default one, just generates data, no validation/checks are applied
* `UniqueStrategy` makes sure generated data is unique
* `ValidStrategy` allow to pass a callback validator that will check generated data
* `ChanceStrategy` let you get data with given percentage chance

For `Unique` and `Valid` strategy there is fixed amount of retries after which exception will be throws - to make sure it will not try to generate unique value forever.

Sample strategies looks like:
```php
$simple = new SimpleStrategy();
$unique = new UniqueStrategy(retries: 500); // we have 500 retries to get unique value
$chance = new ChanceStrategy(weight: 50); // 50% chance to get value
$valid = new ValidStrategy(fn($x) => $x <= 50); // generated value has to be lower or equal than 50 
```
