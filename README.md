# README

## users

| Column          | Type    | Options     |
|-----------------|---------|-------------|
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| last-name       | string  | null: false |
| first-name      | string  | null: false |
| last-name-kana  | string  | null: false |
| first-name-kana | string  | null: false |
| birth-date      | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                   | Type           | Options                        |
|--------------------------|----------------|--------------------------------|
| user                     | references     | null: false, foreign_key: true |
| item-name                | text           | null: false                    |
| item-info                | text           | null: false                    |
| item-category            | text           | null: false                    |
| item-sales-status        | text           | null: false                    |
| item-shipping-fee-status | text           | null: false                    |
| item-scheduled-delivery  | text           | null: false                    |
| user                     | string         | null: false                    |
| item-price               | integer        | null: false                    |
| add-tax-price            | integer        | null: false                    |
| profit                   | integer        | null: false                    |

### Association

- belongs_to :items
- has_one :address
- has_one :orders

## orders テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| date   | integer    | null: false                    |
| item   | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## addresses テーブル

| Column       | Type    | Option      |
|--------------|---------|-------------|
| postal-code  | integer | null: false |
| prefecture   | text    | null: false |
| city         | text    | null: false |
| address      | text    | null: false |
| building     | text    | null: false |
| phone-number | integer | null: false |

### Association

- belongs_to :items
- belongs_to :address