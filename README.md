# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_date            | date    | null: false               |



### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type       | Options       |
| ------------------ | ---------- | ------------- |
| name               | string     | null: false   |
| price              | integer    | null: false   |
| comment            | text       | null: false   |
| category_id        | integer    | null: false   |
| condition_id       | integer    | null: false   |
| delivery_charge_id | integer    | null: false   |
| prefecture_id      | integer    | null: false   |
| shipping_day_id    | integer    | null: false   |
| user               | references | null: false   |


### Association

- has_many :comments
- belongs_to :user
- has_one :item





## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address



## delivery_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postcode             | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
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
| item               | references | null: false, foreign_key: true |


### Association
- belongs_to :items