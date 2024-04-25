use RestaurantBD

UPDATE DishAndDrink
SET Foto = REPLACE(Foto, 'D:\Violetta_PP\Violetta\', '')
WHERE Foto LIKE 'D:\Violetta_PP\Violetta\%';

UPDATE DishAndDrink
SET Foto = CONCAT('D:\Violetta_PP\Violetta\', Foto);