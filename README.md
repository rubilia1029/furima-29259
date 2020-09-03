# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
|family_name| string | null: false |
|first_name | string | null: false |
|family_name_kana| string | null: false |
|first_name_kana| string | null: false |
|birthdate  | date   | null: false |

### Association

- has_many :purchases
- has_many :items




## items テーブル

| Column  | Type   | Options     |
| ------  | ------ | ----------- |
| name    | string | null: false |
| explain | text   | null: false |
|category | integer| null: false |
|condition| integer| null: false |
|   fee   | integer| null: false |
|   area  | integer| null: false |
|   day   | integer| null: false |
| price   | integer| null: false |
| user_id | integer| null: false |

### Association

- belongs_to :user

- has_one : purchase



## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address

## addresses テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| postcode   | string     | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| number     | string     | null: false                    |
| building   | string     |                                |
| phone      | string     | null: false                    |
|purchase_id | integer    | null: false                    |

### Association

- belongs_to :purchase