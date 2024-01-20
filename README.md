# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_year_id         | string | null: false               |
| birth_month_id        | string | null: false               |
| birth_day_id          | string | null: false               |  



### Association

- has_many :items



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | string     | null: false                    |
| comment            | text       | null: false                    |
| category_id        | references | null: false, foreign_key: true |
| condition_id       | references | null: false, foreign_key: true |
| delivery_charge_id | references | null: false, foreign_key: true |
| prefectures_id     | references | null: false, foreign_key: true |
| Shipping_days_id   | references | null: false, foreign_key: true |
| users              | references | null: false, foreign_key: true |


### Association

- has_many :comments
- belongs_to :users
- has_one :items





## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- has_one :delivery_address



## delivery_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postcode             | string     | null: false                    |
| prefectures_id       | references | null: false, foreign_key: true |
| municipalitiey       | string     | null: false                    |
| street_address       | string     | null: false                    |
| building_name        | string     |                                |
| phone_number         | string     | null: false                    |
| purchase             | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase







## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| comment            | text       | null: false                    |
| items              | references | null: false, foreign_key: true |


### Association
- belongs_to :items