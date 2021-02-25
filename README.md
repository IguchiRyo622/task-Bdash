## アプリケーション名🏃🏻
task-Bdash<br>
スーパーマリオのBダッシュのようにタスクを駆け抜けることを手助けできるWebアプリケーションを作ります。

### URL🔗
http://54.248.25.73

### ID/Pass👨🏻‍💻
ID:admin<br>
Pass:2222

### テスト用アカウント👩🏻‍💻
mail:test@com<br>
pass:abc123

## 目指した課題解決
チームでのタスク管理を行える友達登録機能。
タスクを進めていく中で出たアイデアをメモ書きとして残すことができる機能。

## 要件定義
https://docs.google.com/spreadsheets/d/1TzMPe5POlO6QnnP0ZJmWfQHBmhRCoWso_fOYegzotBs/edit?usp=sharing<br>
色が変わっている所は未実装です。

## 機能について

###チーム開発機能🚀
友達登録機能を用いたチームでのタスク管理ができるようにしました。
チーム作成時には友達登録から一緒にタスクを進めるユーザーの候補を出します。

###タスク管理🚀
①チームの作成
↪︎個人でも複数人でも作成できます。複数人で進める場合は友達登録をしてください。
↪︎何を目的にしたチームか詳細から書き記してもいいかもしれません。

②タスクをまとめる「リスト」を作成
↪︎詳細を書くスペースがない為、「勉強」「ゲーム」「夏季課題」など、リストは分かりやすい名前にしてください。

③タスク
↪︎タスクの内容は「タスク名」「タスクの内容」「タスクの達成目標」「レポート」「完了報告」と細かく書き記せます。
↪︎「完了報告」をするとタスクを完了したことがタスク一覧から分かり、完了時間を残します。

###メモ機能🚀
タスク詳細画面に書き込める欄を作成しました。
タスクを進める中で出たアイデアや次の作業時に取り組みたいことなど自由に使っていただきたいです。
↪︎チェック機能を付けました。アイデアやメモが完了したらクリックするとチェックマーク✔︎が付きます。

###コメント機能🚀
チームで開発を進める中で他のユーザーが書き込みができる欄です。
複数人での開発で完成度の高いものに成っていくと期待しています。

###閲覧履歴🚀
閲覧履歴をマイページから見ることができるようにしました。


### データベース設計
![](https://i.gyazo.com/80f67f0859ebd6ac4e147a2676ad94f0.png)


### ローカルでの動作方法
ruby 2.6.5<br>
rails 6.0.0<br>
mysql2 0.5.3<br>
rspec-rails 4.0.0


# テーブル設計

## usersテーブル

| Column    | Type   | Options                   |
| --------- | ------ | ------------------------- |
| nickname  | string | null: false               |
| user_name | string | null: false, unique: true |
| email     | string | null: false               |
| password  | string | null: false               |

### Association
- has_many: lists
- has_many: comments
- has_many: team_users
- has_many: team, through: team_users


## teamsテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| team_name | string | null: false |
| team_info | text   |             |

### Association
- has_many: team_users
- has_many: user, through: team_users
- has_many: lists


## team_usersテーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| team    | reference | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: team

## listsテーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| list_name | string    | null: false                    |
| user      | reference | null: false, foreign_key: true |
| team      | reference | null: false, foreign_key: true |

### Association
- belongs_to: user
- has_many: tasks


## tasksテーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| task_name    | string    | null: false                    |
| content      | text      |                                |
| target_date  | datetime  |                                |
| report       | string    |                                |
| final_report | string    |                                |
| user         | reference | null: false, foreign_key: true |
| list         | reference | null: false, foreign_key: true |

### Association
- belongs_to: list
- has_many: items
- has_many: comments


## itemsテーブル

| Column     | Type      | Option                         |
| ---------- | --------- |------------------------------- |
| check      | boolean   | default: "false"               |
| task_item  | string    |                                |
| user       | reference | null: false, foreign_key: true |
| task       | reference | null: false, foreign_key: true |

### Association
- belongs_to: task


## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| task    | references | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: task
