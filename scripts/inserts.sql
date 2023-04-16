insert into real_estate.account (
    account_id, 
    online_flg, 
    telephone_no,
    email,
    realtor_flg,
    registration_dttm,
    complaint_cnt,
    transaction_cnt,
    first_name,
    second_name
) values 
(1, true, '+7 (929) 337-03-39', 'tutoviy@yandex.ru', false, '2009-06-04 18:25:08', 0, 0, 'Арсений',  'Шелкопрядов'), 
(2, true, '+7 (929) 335-07-52', 'seriezen@yandex.ru', true, '2010-06-05 19:25:08', 0, 0, 'Михаил',  'Зиновьев'),
(3, true, '+7 (929) 301-00-30', 'daddywho@gmail.com', true, '2011-06-06 22:25:08', 0, 0, 'Сергей',  'Богатов'), 
(4, true, '+7 (926) 375-13-25', 'alistermorgan@gmail.com', false, '2015-05-08 23:25:08', 0, 0, 'Николай',  'Поселенцев'),
(5, true, '+7 (929) 337-93-67', 'originalno@yandex.ru', false, '2015-06-08 23:29:08', 0, 0, 'Владимир',  'Дьяченко'), 
(6, true, '+7 (926) 431-17-52', 'lazovod@yandex.ru', true, '2015-06-09 23:37:08', 0, 0, 'Александр',  'Водолазов'),
(7, true, '+7 (929) 034-01-19', 'rykov17@yandex.ru', false, '2017-06-10 18:27:08', 0, 0, 'Никита',  'Рыков'), 
(8, true, '+7 (925) 335-07-72', 'ki9dy@gmail.com', true, '2019-07-14 18:29:08', 0, 0, 'Сергей',  'Добрынин'),
(9, true, '+7 (925) 337-03-30', 'fifty50cent@yandex.ru', false, '2019-07-15 19:26:08', 0, 0, 'Роман',  'Пятин'), 
(10, true, '+7 (926) 137-07-58', 'armyboy15@yandex.ru', true, '2019-08-23 18:57:08', 0, 0, 'Александр',  'Ручкин');


insert into real_estate.account_version_history (
    change_id, 
    change_dttm, 
    account_id, 
    new_online_flg, 
    new_telephone_no,
    new_email,
    new_realtor_flg,
    new_complaint_cnt,
    new_transaction_cnt,
    new_first_name,
    new_second_name
) values 
(1, '2009-06-04 18:25:08', 1, true, '+7 (929) 337-03-39', 'tutoviy@yandex.ru', false, 0, 0, 'Арсений',  'Шелкопрядов'), 
(2, '2010-06-05 19:25:08', 2, true, '+7 (929) 335-07-52', 'seriezen@yandex.ru', true, 0, 0, 'Михаил',  'Зиновьев'),
(3, '2011-06-06 22:25:08', 3, true, '+7 (929) 301-00-30', 'daddywho@gmail.com', true, 0, 0, 'Сергей',  'Богатов'), 
(4, '2015-05-08 23:25:08', 4, true, '+7 (926) 375-13-25', 'alistermorgan@gmail.com', false, 0, 0, 'Николай',  'Поселенцев'),
(5, '2015-06-08 23:29:08', 5, true, '+7 (929) 337-93-67', 'originalno@yandex.ru', false, 0, 0, 'Владимир',  'Дьяченко'), 
(6, '2015-06-09 23:37:08', 6, true, '+7 (926) 431-17-52', 'lazovod@yandex.ru', true, 0, 0, 'Александр',  'Водолазов'),
(7, '2017-06-10 18:27:08', 7, true, '+7 (929) 034-01-19', 'rykov17@yandex.ru', false, 0, 0, 'Никита',  'Рыков'), 
(8, '2019-07-14 18:29:08', 8, true, '+7 (925) 335-07-72', 'ki9dy@gmail.com', true, 0, 0, 'Сергей',  'Добрынин'),
(9, '2019-07-15 19:26:08', 9, true, '+7 (925) 337-03-30', 'fifty50cent@yandex.ru', false, 0, 0, 'Роман',  'Пятин'), 
(10, '2019-08-23 18:57:08', 10, true, '+7 (926) 137-07-58', 'armyboy15@yandex.ru', true, 0, 0, 'Александр',  'Ручкин'),
(11, '2020-05-08 23:25:08', 4, true, '+7 (926) 375-13-25', 'alistermorgan@gmail.com', false, 0, 1, 'Николай',  'Поселенцев'),
(12, '2020-07-09 23:21:08', 4, true, '+7 (929) 555-35-35', 'daddywho@gmail.com', true, 0, 0, 'Сергей',  'Богатов'), 
(13, '2020-08-15 19:26:08', 9, true, '+7 (925) 337-03-30', 'fivtycent@yandex.ru', false, 0, 0, 'Роман',  'Пятин');
