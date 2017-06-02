# DB設計

## users table


|Column|Type|Option|
|:--|--:|:--:|
|name |string|null: false,unique: true|
|mail|string|null: false,unique: true|
|pass|string|null: false,unique: true|
|nickname|string|null: false,index: true,unique: true|


### Association
・has_many:messages<br>
・belongs_to:group<br>



## messages table


|Column|Type|Option|
|:--|--:|:--:|
|body |text||
|image|string||
|group_id|integer|index: true|
|user_id|integer|index: true|


### Association
・belongs_to :user<br>
・belongs_to :group<br>

## groups table

|Column|Type|Option|
|:--|--:|:--:|
|user_id|integer|index: true|


### Association
・has_many :users <br>
・has_many :messages<br>

