
# README

## usersテーブル
|Column|Type|Options|
|------|-----|------|
|nickname|string|null:false|
|introduction|text|null: true|
|avatar_image|string|null: true|

### Assosiation
has_one :user_infomation, dependent: :destroy
has_one :user_address, dependent: :destroy
has_one :credit_card, dependent: :destroy
has_many :points, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :items, dependent: :destroy


## user_informationsテーブル
|Column|Type|Options|
|------|-----|------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|string|null:false|
|check_phonenumber|string|null:false|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user

## user_addressテーブル
|Column|Type|Options|
|------|-----|------|
|postal_code|string|null:false|
|country_id|interger|null:false|
|city|string|null:false|
|address|string|null:false|
|building_name|string|null: true|
|phone_number|string|null:false|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|-----|------|
|credit_token|string|null:false|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|-----|------|
|point|integer|null:true|
|expiration_date|integer|null_false|
|user|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null_false, index:true|
|introduction|text|null: false|
|price|integer|null: false|
|state|string|null: false|
|seller_id|references|foreign_key: true, null: false|
|buyer_id|references|foreign_key: true,null: true|
|brand|references|foreign_key: true|
|category|references|foreign_key: true|

### Assosiation
has_many :comments, dependent: :destroy
has_many :images, dependent: :destroy
has_one :delivery, dependent: :destroy
belongs_to :user
belongs_to :brand
belongs_to :category


## imagesテーブル
|Column|Type|Options|
|------|-----|------|
|image|string|null: false|
|item_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :item


## deliveriesテーブル
|Column|Type|Options|
|------|-----|------|
|burden|string|null:false|
|method|string|null:false|
|region|string|null:false|
|day|string|null:false|
|item_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|-----|------|
|comment|text|null: false|
|user_id|references|foreign_key: true, null: false|
|item_id|references|foreign_key: true, null: false|
|item_state|string|null: false|

### Assosiation
belongs_to :user
belongs_to :item


## categorysテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false, index: true|
|size|string|null:false|
|ancestry|string|null:false|

### Assosiation
has_many :items
has_ancestry


## brandsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false, index: true|

### Assosiation
has_many :brand_modules
has_many :brand_categorys, through: :brand_module
has_many :items


## brand_categorysテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false|

### Assosiation
has_many :brand_categorys
has_many :brands, through: :brand_categorys


## brand_moduleテーブル(中間)
|Column|Type|Options|
|------|-----|------|
|brand_id|references|foreign_key: true, null:false|
|brand_category_id|references|foreign_key: true, null: false|

### Assosiation
belongs_to :brand
belongs_to :brand_categry