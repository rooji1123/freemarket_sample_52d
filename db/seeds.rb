Category.delete_all

ladys = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
baby = Category.create(name: "ベビー・キッズ")
home = Category.create(name: "インテリア・住まい・小物")
book = Category.create(name: "本・音楽・ゲーム")
hoby = Category.create(name: "おもちゃ・ホビー・グッズ")
cosmetic = Category.create(name: "コスメ・香水・美容")
appliance = Category.create(name: "家電・スマホ・カメラ")
sport = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
automobile = Category.create(name: "自動車・オートバイ")
other = Category.create(name: "その他")


ladys_clothes = ladys.children.create(name: "服")
ladys_clothes.children.create([
  {name: "トップス"},
  {name: "ジャケット"},
  {name: "パンツ"},
  {name: "スカート"}
])

ladys_shoes = ladys.children.create(name: "靴")
ladys_shoes.children.create([
  {name: "ハイヒール"},
  {name: "サンダル"},
  {name: "スニーカー"},
  {name: "ローファー"}
])

ladys_accessories = ladys.children.create(name: "アクセサリー")
ladys_accessories.children.create([
  {name: "ネックレス"},
  {name: "ブレスレット"},
  {name: "ピアス"},
  {name: "イヤリング"}
])



mens_clothes = mens.children.create(name: "服")
mens_clothes.children.create([
  {name: "トップス"},
  {name: " ジャケット"},
  {name: "パンツ"},
  {name: "ジャージ"}
])

mens_shoes = mens.children.create(name: "靴")
mens_shoes.children.create([
  {name: "ブーツ"},
  {name: "サンダル"},
  {name: "スニーカー"},
  {name: "ビジネス"}
])

mens_accessories = mens.children.create(name: "アクセサリー")
mens_accessories.children.create([
  {name: "ネックレス"},
  {name: "ブレスレット"},
  {name: "ピアス"},
  {name: "リング"}
])



baby_clothes = baby.children.create(name: "服")
baby_clothes.children.create([
  {name: "トップス"},
  {name: " ジャケット"},
  {name: "パンツ"},
  {name: "ジャージ"}
])

baby_shoes = baby.children.create(name: "靴")
baby_shoes.children.create([
  {name: "ブーツ"},
  {name: "サンダル"},
  {name: "スニーカー"},
  {name: "長靴"}
])

baby_toy = baby.children.create(name: "おもちゃ")
baby_toy.children.create([
  {name: "ガラガラ"},
  {name: "オルゴール"},
  {name: "手押し車"},
  {name: "お風呂のおもちゃ"}
])



home_kitchen = home.children.create(name: "キッチン・食器")
home_kitchen.children.create([
  {name: "食器"},
  {name: "調理器具"},
  {name: "容器"},
  {name: "テーブル用品"}
])

home_bed = home.children.create(name: "ベッド")
home_bed.children.create([
  {name: "セミシングルベッド"},
  {name: "シングルベッド"},
  {name: "ダブルベッド"},
  {name: "ワイドダブルベッド"}
])

home_chair = home.children.create(name: "家具")
home_chair.children.create([
  {name: "椅子"},
  {name: "テーブル"},
  {name: "収納家具"},
  {name: "ライト"}
])



book_book = book.children.create(name: "本")
book_book.children.create([
  {name: "小説"},
  {name: "参考書"},
  {name: "旅行ガイド"},
  {name: "社会"}
])

book_manga = book.children.create(name: "漫画")
book_manga.children.create([
  {name: "少女漫画"},
  {name: "少年漫画"},
  {name: "青年漫画"},
  {name: "女性漫画"}
])

book_magazine = book.children.create(name: "雑誌")
book_magazine.children.create([
  {name: "アート"},
  {name: "スポーツ"},
  {name: "エンタメ"},
  {name: "趣味"}
])




hoby_toy = hoby.children.create(name: "おもちゃ")
hoby_toy.children.create([
  {name: "キャラクターグッズ"},
  {name: "ぬいぐるみ"},
  {name: "ミニカー"},
  {name: "プラモデル"}
])

hoby_figure = hoby.children.create(name: "フィギュア")
hoby_figure.children.create([
  {name: "アニメ"},
  {name: "特撮"},
  {name: "ゲームキャラクター"},
  {name: "SF"}
])

hoby_musical = hoby.children.create(name: "楽器")
hoby_musical.children.create([
  {name: "ギター"},
  {name: "打楽器"},
  {name: "管楽器"},
  {name: "和楽器"}
])



cosmetic_nail = cosmetic.children.create(name: "ネイルケア")
cosmetic_nail.children.create([
  {name: "ネイルカラー"},
  {name: "カラージェル"},
  {name: "ネイルパーツ"},
  {name: "手入れ用具"}
])

cosmetic_base = cosmetic.children.create(name: "ベースメイク")
cosmetic_base.children.create([
  {name: "ファンデーション"},
  {name: "化粧下地"},
  {name: "コントロールカラー"},
  {name: "クリーム"}
])

cosmetic_makeup = cosmetic.children.create(name: "メイクアップ")
cosmetic_makeup.children.create([
  {name: "アイシャドウ"},
  {name: "口紅"},
  {name: "チーク"},
  {name: "フェイスカラー"}
])



appliance_smartphone = appliance.children.create(name: "スマートフォン")
appliance_smartphone.children.create([
  {name: "スマートフォン本体"},
  {name: "バッテリー"},
  {name: "携帯電話"},
  {name: "PHS本体"}
])

appliance_pc = appliance.children.create(name: "PC/タブレット")
appliance_pc.children.create([
  {name: "ノートPC"},
  {name: "デスクトップ型PC"},
  {name: "ディスプレイ"},
  {name: "タブレット"}
])

appliance_appliance = appliance.children.create(name: "生活家電")
appliance_appliance.children.create([
  {name: "冷蔵庫"},
  {name: "洗濯機"},
  {name: "炊飯器"},
  {name: "電子レンジ"}
])



sport_baseball = sport.children.create(name: "野球")
sport_baseball.children.create([
  {name: "ウェア"},
  {name: "シューズ"},
  {name: "グローブ"},
  {name: "バット"}
])

sport_soccer = sport.children.create(name: "サッカー")
sport_soccer.children.create([
  {name: "ウェア"},
  {name: "シューズ"},
  {name: "アクセサリー"},
  {name: "ボール"}
])

spotr_outdoors = sport.children.create(name: "アウトドア")
spotr_outdoors.children.create([
  {name: "テント"},
  {name: "ランタン"},
  {name: "テーブル"},
  {name: "コンロ"}
])



handmade_accessories = handmade.children.create(name: "アクセサリー")
handmade_accessories.children.create([
  {name: "ピアス"},
  {name: "イヤリング"},
  {name: "ネックレス"},
  {name: "ブレスレット"}
])

handmade_fashion = handmade.children.create(name: "ファッション")
handmade_accessories.children.create([
  {name: "バッグ"},
  {name: "財布"},
  {name: "ファッション雑貨"},
  {name: "時計"}
])

handmade_necessitie = handmade.children.create(name: "日用品")
handmade_necessitie.children.create([
  {name: "キッチン用品"},
  {name: "家具"},
  {name: "アート"},
  {name: "アロマ"}
])



ticket_musical = ticket.children.create(name: "音楽")
ticket_musical.children.create([
  {name: "アイドル"},
  {name: "アーティスト"},
  {name: "音楽フェス"},
  {name: "アニメ"}
])

ticket_sport = ticket.children.create(name: "スポーツ")
ticket_sport.children.create([
  {name: "サッカー"},
  {name: "野球"},
  {name: "フィギュアスケート"},
  {name: "プロレス"}
])
