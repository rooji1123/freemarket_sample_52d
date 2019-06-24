class DeliveryChoice < ActiveHash::Base
  self.data = [
      {id: 1, choice: '未定'}, {id: 2, choice: 'らくらくメルカリ便'}, {id: 3, choice: 'ゆうメール'},
      {id: 4, choice: 'レターパック'}, {id: 5, choice: '普通郵便(定型、定形外)'}, {id: 6, choice: 'クロネコヤマト'},
      {id: 7, choice: 'ゆうパック'}, {id: 8, choice: 'クリックポスト'}, {id: 9, choice: 'ゆうパケット'}
  ]
end