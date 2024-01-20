# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| name                  | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |


### Association

- has_many :items



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | string     | null: false                    |
| comment            | text       | null: false                    |
| users              | references | null: false, foreign_key: true |


### Association

- has_many :comments
- belongs_to :users
- has_one :items





## purchases テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| users               | references | null: false, foreign_key: true |
| items               | references | null: false, foreign_key: true |


### Association

- belongs_to :items
- has_one :delivery_addresses



## delivery_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postcode             | string     | null: false                    |
| municipalitiey       | string     | null: false                    |
| street_address       | string     | null: false                    |
| building_name        | string     | null: false                    |
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