# テーブル設計

## usersテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| user_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

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
- has_one: task

## tasksテーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| task_name    | string    | null: false                    |
| content      | text      |                                |
| target_date  | datetime  |                                |
| report       | string    |                                |
| final_report | string    |                                |
| list         | reference | null: false, foreign_key: true |

### Association
- belongs_to: list
- has_many: comments

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| task    | references | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: task