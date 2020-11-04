# README

## users

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| lastname_kana      | string | null: false |
| firstname_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| user                   | references | null: false, foreign_key: true |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| sales-status_id        | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| shipping-fee-status_id | integer    | null: false                    |
| scheduled-delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Option                         |
|---------------|------------|--------------------------------|
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :order