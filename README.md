# アプリケーション名
HABITS

# アプリケーション概要
習慣化のお手伝いアプリケーション

# URL
https://github.com/ryusen1000/habits

# テスト用アカウント
名前  テスト太郎
メールアドレス  test@test.com
パスワード  test00

# 利用方法
## ログイン機能
ログインもしくは新規登録でログイン、ログアウトでログアウトできます。
### プロフィール登録
トップページのユーザー名をクリックするとプロフィール登録機能へ遷移します。年齢と体重を入力できます。
## 習慣化機能
### 目的と目標
ログイン状態で習慣化したい目的と最終的に習慣化したい行動を入力して登録できます。
入力した目標と目的の右がわの行動リンクから行動登録機能へ遷移、削除で入力した目標と目的を削除できます。
### 行動登録機能
行動登録機能への遷移先で具体的な行動の種目と量を登録できます。
目標へ近づくために必要な理想の行動と、それができない場合の少し楽な行動を登録することができます、削除で入力した目標と目的を削除できます。

# 目指した課題解決
ダイエットしたくても続かない時に習慣化できるように管理することを目的としています。
特に運動は習慣化しづらいということで、運動の習慣化を目的にしたアプリケーションを作成しました。

# 洗い出した要件
ユーザー登録機能
目標設定機能
行動登録機能
プロフィール登録機能
見た目で習慣化できているかどうかチェックができる

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
カレンダー機能
習慣化チェック機能

# ローカルでの動作方法

Ruby on Rails ver.6.0.0
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
