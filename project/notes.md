# Notes

- The derived attribute `number_of_accounts` in `software_resource` would better be computed on the fly instead of saving it in the table. That is because it can be derived by counting the number of records in the `rents` relationship that are related to the `software_resource` and its `rent_period` is still active and didn’t expire.
- The `contact_information` composite attribute attributes were represented as separate attributes since the modern relational databases don’t support composite attributes, but they are represented as composite in the ER diagram. When we translate it to the Relational Model, we need to split it to its basic parts.
- `rent_period` in the `rents` relation on its own can’t tell us when the rent ends since we don’t know when it started. We need to know when it started to calculate that. So, we decided to use two properties instead of `rent_period` to be able to know when it ends accurately. The two properties are:
  - `start_date`
  - `end_date`
