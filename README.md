# README

# テーブル設計

## usersテーブル

| Column                   | Type    | Option                   | 
| ------------------------ | ------- | ------------------------ | 
| nickname                 | string  | null: false              | 
| email                    | string  | null: false, unique: true| 
| encrypted_password       | string  | null: false              | 
| first_name               | string  | null: false              |
| last_name                | string  | null: false              | 
| first_furigana           | string  | null: false              | 
| last_furigana            | string  | null: false              | 
| birthday                 | date    | null: false              | 

## Association
+ has_many :items
+ has_many :purchases

## itemsテーブル

| Column        | Type       | Option            | 
| ------------- | ---------- | ----------------- | 
| name          | string     | null: false       | 
| price         | integer    | null: false       | 
| text          | text       | null: false       | 
| category_id   | integer    | null: false       | 
| state_id      | integer    | null: false       | 
| prefecture_id | integer    | null: false       | 
| ship_day_id   | integer    | null: false       | 
| ship_fee_id   | integer    | null: false       | 
| user          | references | foreign_key: true | 

## Association

+ belongs_to :user
+ has_one :purchase

## purchasesテーブル

| Column       | Type       | Option            | 
| ------------ | ---------- | ----------------- | 
| user         | references | foreign_key: true | 
| item         | references | foreign_key: true | 

## Association

+ belongs_to :user
+ belongs_to :item
+ has_one :address

## addressesテーブル

| Column        | Type       | Option            | 
| ------------- | ---------- | ----------------- | 
| postal_code   | string     | null: false       | 
| prefecture_id | integer    | null: false       | 
| city          | string     | null: false       | 
| block         | string     | null: false       | 
| building      | string     |                   | 
| phone_number  | string     | null: false       | 
| purchase      | references | foreign_key: true | 

## Association

+ belongs_to :purchase

