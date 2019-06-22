class ItemState < ActiveHash::Base
  self.data = [
      {id: 1, state: '新品、未使用'}, {id: 2, state: '未使用に近い'}, {id: 3, state: '目立った傷や汚れなし'},
      {id: 4, state: 'やや傷や汚れあり'}, {id: 5, state: '傷や汚れあり'}, {id: 6, state: '全体的に状態が悪い'}
  ]
end