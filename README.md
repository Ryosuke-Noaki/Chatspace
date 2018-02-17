# Chatspace

Ruby 2.3.1
Rails 5.0.6

## group_users table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key :true|
|group_id|references|null :false, foreign_key :true|

### Association
- belongs_to :user
- belongs_to :group

## messages table

|Column|Type|Options|
|------|----|-------|
|body|text|       |
|image|string|        |
|user_id|references|null :false, foreign_key :true|
|group_id|references|null :false, foreign_key :true|

### Association
- belongs_to :user
- belongs_to :group

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null :false, unique :true|
|email|string|null :false, unique :true|

### Association
- has_many :messages
- has_many :group_users
- has_many :group, through::group_users

## groups table

|Column|Type|Options|
|------|----|-------|
|name|string|null :false, unique :true, index|

### Association
- has_many :messages
- has_many :group_users
- belongs_to :users through::group_users

Jot something down
