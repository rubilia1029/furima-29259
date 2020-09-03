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
|familyname | string | null: false |
|firstname  | string | null: false |
|family-kana| string | null: false |
|first-kana | string | null: false |
|birthdate  | date   | null: false |

### Association

- has_many :purchases
- has_many :items
- has_many :comments



## items テーブル

| Column  | Type   | Options     |
| ------  | ------ | ----------- |
| name    | string | null: false |
| image   | string | null: false |
| explain | text   | null: false |
|category | integer| null: false |
|condition| integer| null: false |
|   fee   | integer| null: false |
|   area  | integer| null: false |
|   day   | integer| null: false |
| price   | integer| null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one : purchase

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| content| text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
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

### Association

- belongs_to :purchase