class Size < ActiveHash::Base
  self.data = [
      {id: 1, size: 'XXS以下'}, {id: 2, size: 'XS(SS)'}, {id: 3, size: 'S'},
      {id: 4, size: 'M'}, {id: 5, size: 'L'}, {id: 6, size: 'XL(LL)'},
      {id: 7, size: '2XL(3L)'}, {id: 8, size: '3XL(4L)'}, {id: 9, size: '4XL(5L)以上'},
      {id: 10, size: 'FREE SIZE'}
  ]
end