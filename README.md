## アプリケーション名
task-Bdash<br>
スーパーマリオのBダッシュのようにタスクを駆け抜けることを手助けできるWebアプリケーションを作ります。

### URL
https://task-bdash.herokuapp.com/

### ID/Pass
ID:admin<br>
Pass:2222

### テスト用アカウント
mail:test@gmail.com<br>
pass:abc123

### 利用方法
ログイン後、チーム作成、リスト作成、タスク作成と順に行う。必要に応じて編集、削除を行ってください。


## 目指した課題解決
私が別Webアプリケーションでタスク管理を行っていた際に出来なかった作業中や完了時の思い付きをタスク内に別で記録することができる。

## 要件定義
https://docs.google.com/spreadsheets/d/1TzMPe5POlO6QnnP0ZJmWfQHBmhRCoWso_fOYegzotBs/edit?usp=sharing
色が変わっている所は未実装です。頑張ります。

## 機能について
ログイン後、チームを作成しましょう。<br>
チーム作成：https://gyazo.com/b7a69f001eb519f974428f4834c2da34<br>
task-Bdashはチームを基準にタスク管理を行います。チーム名とチームメンバーを選択します。<b>この時、自分1人で進めたい場合はユーザーを選択しない状態で作成を行うと1人のチームを作成することができます。</b><br><br>

チーム詳細:https://gyazo.com/dabdc2bca5c49e0d8d90d959dd7e4a58<br>
チームの詳細はチームを選択後、リスト一覧の最上部に表示されるチーム名をクリックすることでチームメンバーの一覧やチームの編集、削除を行うことができます。チームの編集からチーム名、メンバーの変更を行えます。また、<b>チーム情報を新たに追加できます。</b>チーム内での分担やチームの紹介文にお使いください。<br>
また、チームを削除するとチームに従属するリスト、タスク全てが削除されてしまうので注意してください。<br><br>

リスト作成:https://gyazo.com/1337b93ed7581ea98f1383059175055d<br>
その後、リストを作成します。リストはタスクのファイルのような物です。リスト内にタスクを作成するため、分かりやすいリスト名を付けましょう。リストはチーム内に複数作成できるため、分かりやすく管理できます。<br><br>

リスト詳細:https://gyazo.com/910fa3d42bc6a607b28ddc89ad853b40<br>
リストの詳細はリストを選択後、タスク一覧の最上部に表示されるリスト名をクリックすることでリスト名やリスト製作者の表示、リストの編集、削除を行うことができます。リストの削除はチーム同様、従属するタスクを削除してしまうため注意してください。<br><br>

タスク作成:https://gyazo.com/698c713080581a5f43e977d8fbb6abac<br>
タスク詳細:https://gyazo.com/15a500b2e44949ed3160f680a4c3dd1d<br>
その後、タスクを作成していきます。タスク名、タスク内容、タスク完了目標日、タスク要点を入力します。この際、タスク名以外は空の状態でも作成することができます。タスク詳細はタスクを選択することで編集、削除を行えます。また、タスクの作業報告、完了報告を編集から追加でき、タスクを作業した際の報告用にお使いください。

### データベース設計
![](https://i.gyazo.com/5226c9b21db1456055e6a58c8527961e.png)

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
| item_check | boolean   | default: "false"               |
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
