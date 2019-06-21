class DeliveryChoiceSub < ActiveHash::Base
  self.data = [
      {id: 1, choice: '未定'}, {id: 2, choice: 'クロネコヤマト'}, {id: 3, choice: 'ゆうパック'},
      {id: 4, choice: 'ゆうメール'}
  ]
end