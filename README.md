# DB設計

## users table

|Column|Type|Option|
|:--|--:|:--:|
|name |string|null: false |
|mail|string|null: false , unique: true|
|pass|string|null: false |

### Association
・has_many :messages
・has_many :groups , through: group_users 


## messages table

|Column|Type|Option|
|:--|--:|:--:|
|body |text||
|image|string||
|group_id|integer|index: true , null: false , foreign_key: true|
|user_id|integer|index: true , null: false , foreign_key: true|

### Association
・belongs_to :user
・belongs_to :group


## groups table

|Column|Type|Option|
|:--|--:|:--:|
|name|string|index: true|

### Association
・has_many :users , through: group_users 
・has_many :messages


## group_users table

|Column|Type|Option|
|:--|--:|:--:|
|group_id |integer|index: true , null: false , foreign_key: true|
|user_id|integer|index: true , null: false , foreign_key: true|

### Association
・belongs_to :user
・belongs_to :group