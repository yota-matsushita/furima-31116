# README

## users

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last-name-kana     | string | null: false |
| first-name-kana    | string | null: false |
| birth-date         | date   | null: false |

### Association

- has_one :item
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| user                | references | null: false, foreign_key: true |
| name                | text       | null: false                    |
| info                | text       | null: false                    |
| category            | integer    | null: false                    |
| sales-status        | integer    | null: false                    |
| shipping-fee-status | integer    | null: false                    |
| scheduled-delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| date   | references | null: false                    |
| item   | references | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type     | Option      |
|---------------|----------|-------------|
| postal-code   | string   | null: false |
| prefecture_id | integer  | null: false |
| city          | text     | null: false |
| address       | text     | null: false |
| building      | text     |             |
| phone-number  | string   | null: false |

### Association

- belongs_to :order