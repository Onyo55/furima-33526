# テーブル設計

## usersテーブル

| Column         | Type    | Option                   | 
| -------------- | ------- | ------------------------ | 
| nickname       | string  | null: false, unique: true| 
| email          | string  | null: false, unique: true| 
| password       | string  | null: false, unique: true| 

## Association

has_many :items
has_many :purchase
has_one :profile

## profilesテーブル

| first_name     | string  | null: false |
| last_name      | string  | null: false | 
| first_furigana | string  | null: false | 
| last_furigana  | string  | null: false | 
| birthday       | date    | null: false | 

## Association

belongs_to :user

## itemsテーブル

| Column       | Type       | Option            | 
| ------------ | ---------- | ----------------- | 
| name         | string     | null: false       | 
| price        | string     | null: false       | 
| text         | text       | null: false       | 
| category     | string     | null: false       | 
| state        | string     | null: false       | 
| ship_from    | string     | null: false       | 
| ship_day     | string     | null: false       | 
| user         | references | foreign_key: true | 

## Association

belongs_to :user
has_one :purchase

## addressテーブル

| Column       | Type    | Option      | 
| ------------ | ------- | ----------- | 
| postal_code  | integer | null: false | 
| prefecture   | string  | null: false | 
| city         | string  | null: false | 
| block        | string  | null: false | 
| building     | string  |             | 
| phone_number | integer | null: false | 

## Association

belongs_to :purchase

## purchase

| Column  | Type       | Option            | 
| ------- | ---------- | ----------------- | 
| user    | references | foreign_key: true | 
| item    | references | foreign_key: true | 
| address | references | foreign_key: true | 

## Association

has_many :users
belongs_to :item
has_one :address