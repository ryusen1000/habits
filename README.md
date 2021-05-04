# テーブル設計

## USERSテーブル

| Column             | Type       | Options                   |
|--------------------|------------|---------------------------|
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |

### Association
- has_many :tasks
- has_many :profiles

## TASKSテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| theme  | string     | null: false                    |
| goal   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- has_many :actions
- belongs_to :user

## PROFILESテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| weight | string     | null: false                    |
| age    | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## ACTIONSテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| act        | string     | null: false                    |
| amount     | integer    | null: false                    |
| if_then    | string     | null: false                    |
| completion | string     | null: false                    |
| task       | references | null: false, foreign_key: true |

### Association
- belongs_to :task
