# Физическая модель

---

Таблица `real_estate.account`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `account_id`    | Идентификатор      | `INTEGER`       | `PRIMARY KEY` |
| `online`        | Находится на сайте сейчас            | `BOOLEAN` | `NOT NULL`  |
| `telephone`     | Номер телефона                       | `VARCHAR(255)`  | `NOT NULL`    |
| `email`         | Почта                                | `VARCHAR(255)`  | `NOT NULL`    |
| `account_type`  | Клиент или риелтор                   | `VARCHAR(255)`      | `NOT NULL` |
| `registration_time`      | Дата регистрации в системе                     | `TIMESTAMP`    | `NOT NULL` |
| `complaint_counter`      | Счетчик жалоб на данный аккаунт                | `INTEGER`      | `NOT NULL` |
| `transaction_counter`    | Счетчик сделок, в которых принимал участие     | `INTEGER`      | `NOT NULL` |

Таблица `real_estate.account_version_history`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `change_id`    | Идентификатор изменения                        | `INTEGER`      | `PRIMARY KEY` |
| `change_time`      | Дата внесения изменений в системе          | `TIMESTAMP`    | `NOT NULL`    |
| `account_id`    | Идентификатор автора изменения                | `INTEGER`      | `FOREIGN KEY` |
| `new_online`        | Находится на сайте сейчас                 | `BOOLEAN`      | `NOT NULL`    |
| `new_telephone`     | Номер телефона                            | `VARCHAR(255)`  | `NOT NULL`    |
| `new_email`         | Почта                                     | `VARCHAR(255)`  | `NOT NULL`    |
| `new_account_type`  | Клиент или риелтор                        | `VARCHAR(255)`   | `NOT NULL` |
| `new_complaint_counter`    | Счетчик жалоб на данный аккаунт    | `INTEGER`      | `NOT NULL` |
| `new_transaction_counter`  | Счетчик сделок, в которых принимал участие     | `INTEGER`      | `NOT NULL` |


Таблица `real_estate.realtor`:

| Название             | Описание                                         | Тип данных     | Ограничение   |
|----------------------|--------------------------------------------------|----------------|---------------|
| `realtor_id`               | Идентификатор риелтора                           | `INTEGER`         | `PRIMARY KEY` |
| `first_name`               | Имя                                              | `VARCHAR(255)`    | `NOT NULL`    |
| `second_name`              | Фамилия                                          | `VARCHAR(255)`    | `NOT NULL`    |
| `from_company`             | Риелтор от компании или частный                  | `BOOLEAN`         | `NOT NULL`    |
| `checked_realtor`          | Проверенный (сертифицированный) риэлтор или нет  | `BOOLEAN`       | `NOT NULL`    |
| `request_got_amount`     | Счетчик полученных запросов помощи от клиентов     | `INTEGER`       | `NOT NULL` |
| `rating`                  | Рейтинг риелтора  (от 0 до 10)                    | `DECIMAL`   | `IS NULL OR BETWEEN 0 AND 10` |

Таблица `real_estate.realtor_history`:

| Название             | Описание                                         | Тип данных     | Ограничение   |
|----------------------|--------------------------------------------------|----------------|---------------|
| `сhange_id`               | Идентификатор изменения                           | `INTEGER`      | `PRIMARY KEY` |
| `change_time`             | Дата внесения изменений в системе                 | `TIMESTAMP`    | `NOT NULL`    |
| `realtor_id`               | Идентификатор риелтора                           | `INTEGER`      | `FOREIGN KEY` |
| `new_first_name`               | Имя                                              | `VARCHAR(255)` | `NOT NULL` |
| `new_second_name`              | Фамилия                                          | `VARCHAR(255)` | `NOT NULL` |
| `new_from_company`             | Риелтор от компании или частный                  | `BOOLEAN`      | `NOT NULL` |
| `new_checked_realtor`          | Проверенный (сертифицированный) риелтор или нет  | `BOOLEAN`      | `NOT NULL` |
| `new_request_got_amount`     | Счетчик полученных запросов помощи от клиентов     | `INTEGER`   | `NOT NULL` |
| `new_rating`                  | Рейтинг риелтора  (от 0 до 10)                    | `DECIMAL`   | `IS NULL OR BETWEEN 0 AND 10` |

Таблица `real_estate.client`:

| Название    | Описание                        | Тип данных  | Ограничение   |
|-------------|---------------------------------|-------------|---------------|
| `client_id`    | Идентификатор клиента                                        | `INTEGER`        | `PRIMARY KEY` |
| `first_name`               | Имя                                              | `VARCHAR(255)`      | `NOT NULL` |
| `second_name`              | Фамилия                                          | `VARCHAR(255)`      | `NOT NULL` |
| `request_sent_amount`     | Счетчик исходящих риелторам запросов о помощи     | `INTEGER`           | `NOT NULL` |

Таблица `real_estate.client_history`:

| Название    | Описание                        | Тип данных  | Ограничение   |
|-------------|---------------------------------|-------------|---------------|
| `сhange_id`               | Идентификатор изменения                           | `INTEGER`      | `PRIMARY KEY` |
| `change_time`             | Дата внесения изменений в системе                 | `TIMESTAMP`    | `NOT NULL`    |
| `client_id`               | Идентификатор клиента                             | `INTEGER`   | `FOREIGN KEY` |
| `new_first_name`               | Имя                                          | `VARCHAR(255)` | `NOT NULL`    |
| `new_second_name`              | Фамилия                                      | `VARCHAR(255)`      | `NOT NULL`    |
| `new_request_sent_amount`     | Счетчик исходящих риелторам запросов о помощи  | `INTEGER`   | `NOT NULL` |

Таблица `real_estate.apartment`:

| Название    | Описание                        | Тип данных  | Ограничение   |
|-------------|---------------------------------|-------------|---------------|
| `apartment_id`                | Идентификатор                       | `INTEGER`      | `PRIMARY KEY` |
| `apartment_type`              | Тип объекта недвижимости               | `VARCHAR(255)`      | `NOT NULL` |
| `total_area`                  | Общая площадь объекта                  | `INTEGER`    | `NOT NULL`    |
| `living_area`                 | Жилая площадь объекта                  | `INTEGER`    | -    |
| `kitchen_area`                | Площадь кухни                          | `INTEGER`    | -    |
| `apartment_address`           | Идентификатор клиента                  | `INTEGER`    | `NOT NULL` |
| `flat_counter`                | Количество комнат                      | `INTEGER`    | `NOT NULL` |
| `balcony_counter`             | Количество комнат                      | `INTEGER`    | `NOT NULL` |

Таблица `real_estate.announcement`:

| Название    | Описание                        | Тип данных  | Ограничение   |
|-------------|---------------------------------|-------------|---------------|
| `announcement_id`               | Идентификатор объявления                     | `INTEGER`      | `PRIMARY KEY` |
| `apartment_id`              | Идентификатор объекта недвижимости          | `INTEGER`      | `FOREIGN KEY` |
| `apartment_description`   | Описание объекта                                 | `VARCHAR(1000)`  | - |
| `announcement_type`             | Аренда или продажа               | `VARCHAR(255)`    | `NOT NULL`    |
| `announcement_price`               | Цена объекта недвижимости               | `INTEGER`   |`NOT NULL` |
| `made_by_realtor`              | Объявление сделано риелтором или нет       | `BOOLEAN`      | `NOT NULL` |
| `active`              | Объявление активно или нет (снято с продажи)      | `BOOLEAN`      | `NOT NULL` |

Таблица `real_estate.transaction_history`:

| Название    | Описание                        | Тип данных  | Ограничение   |
|-------------|---------------------------------|-------------|---------------|
| `transaction_id`               | Идентификатор сделки                             | `INTEGER`       | `PRIMARY KEY` |
| `transaction_time`             | Дата сделки                                      | `TIMESTAMP`     | `NOT NULL`    |
| `apartment_id`                 | Идентификатор объекта недвижимости               | `INTEGER`       | `FOREIGN KEY` |
| `seller_id`            | Идентификатор продавца                           | `INTEGER`       | `FOREIGN KEY` |
| `seller_realtor_id`            | Идентификатор риелтора продавца (при наличии)    | `INTEGER`       | `FOREIGN KEY` |
| `buyer_id`             | Идентификатор покупателя                         | `INTEGER`       | `FOREIGN KEY` |
| `buyer_realtor_id`             | Идентификатор риелтора покупателя (при наличии)  | `INTEGER`       | `FOREIGN KEY` |
| `transaction_type`             | Аренда или продажа    | `VARCHAR(255)`  | `NOT NULL` |
| `transaction_price`            | Сумма сделки    | `INTEGER`       | `NOT NULL` |

---
Таблица `real_estate.account`:
```postgresql
create table real_estate.account (
    account_id int not null, 
    online boolean not null, 
    telephone varchar(255) not null,
    email varchar(255) not null,
    account_type varchar(255) not null,
    registration_time timestamp without time zone not null,
    complaint_counter int not null,
    transaction_counter int not null,

    constraint account_pk primary key (account_id)
);
```
Таблица `real_estate.account_version_history`:
```postgresql
create table real_estate.account_version_history (
    change_id int not null,
    change_time timestamp without time zone not null,
    account_id int not null, 
    new_online boolean not null, 
    new_telephone varchar(255) not null,
    new_email varchar(255) not null,
    new_account_type varchar(255) not null,
    new_complaint_counter int not null,
    new_transaction_counter int not null,

    constraint change_account_pk primary key (change_id), 

    constraint fk_account foreign key (account_id) 
    references real_estate.account(account_id) 
    on delete set null
);
```
Таблица `real_estate.realtor`:
```postgresql
create table real_estate.realtor (
    realtor_id int not null, 
    first_name varchar(255) not null,
    second_name varchar(255) not null, 
    from_company boolean not null, 
    checked_realtor boolean not null, 
    request_got_amount int not null, 
    rating int,

    constraint realtor_pk primary key (realtor_id)
);
```

Таблица `real_estate.realtor_history`:
```postgresql
create table real_estate.realtor_history (
    change_id int not null, 
    change_time timestamp without time zone not null,
    realtor_id int not null, 
    new_first_name varchar(255) not null,
    new_second_name varchar(255) not null, 
    new_from_company boolean not null, 
    new_checked_realtor boolean not null, 
    new_request_got_amount int not null, 
    new_rating int,

    constraint change_realtor_pk primary key (change_id), 

    constraint fk_realtor foreign key (realtor_id) 
    references real_estate.realtor(realtor_id) 
    on delete set null
);
```

Таблица `real_estate.client`:
```postgresql
create table real_estate.client (
    client_id int not null, 
    first_name varchar(255) not null, 
    second_name varchar(255) not null, 
    request_sent_amount int not null,

    constraint client_pk primary key (client_id)
);
```

Таблица `real_estate.client_history`:
```postgresql
create table real_estate.client_history (
    change_id int not null, 
    change_time timestamp without time zone not null,
    client_id int not null, 
    new_first_name varchar(255) not null, 
    new_second_name varchar(255) not null, 
    new_request_sent_amount int not null,

    constraint change_client_pk primary key (change_id), 

    constraint fk_client foreign key (client_id) 
    references real_estate.client(client_id) 
    on delete set null
);
```

Таблица `real_estate.apartment`:
```postgresql
create table real_estate.apartment (
    apartment_id int not null,
    apartment_type varchar(255) not null, 
    total_area int not null, 
    living_area int, 
    kitchen_area int, 
    apartment_address varchar(255) not null,
    flat_counter int not null, 
    balcony_counter int not null,

    constraint appartment_pk primary key (apartment_id)
);
```

Таблица `real_estate.announcement`:
```postgresql
create table real_estate.announcement (
    announcement_id int not null, 
    apartment_id int not null, 
    apartment_description varchar(1000),
    announcement_type varchar(255) not null, 
    announcement_price varchar(255) not null, 
    made_by_realtor boolean not null,
    active boolean not null,

    constraint announcement_pk primary key (announcement_id),

    constraint fk_apartment foreign key (apartment_id) 
    references real_estate.apartment(apartment_id) 
    on delete set null
);
```

Таблица `real_estate.transaction_history`:
```postgresql
create table real_estate.transaction_history (
    transaction_id int not null,
    transaction_time timestamp without time zone not null,
    apartment_id int not null, 
    seller_id int not null, 
    seller_realtor_id int, 
    buyer_id int not null, 
    buyer_realtor_id int, 
    transaction_type varchar(255) not null, 
    transaction_price int not null,

    constraint transaction_pk primary key (transaction_id),

    constraint fk_trans_apartment foreign key (apartment_id) 
    references real_estate.apartment(apartment_id) 
    on delete set null,

    constraint fk_seller_id foreign key (seller_id) 
    references real_estate.client(client_id) 
    on delete set null,

    constraint fk_seller_realtor_id foreign key (seller_realtor_id) 
    references real_estate.account(account_id) 
    on delete set null,

    constraint fk_buyer_id foreign key (buyer_id) 
    references real_estate.client(client_id) 
    on delete set null,

    constraint fk_buyer_realtor_id foreign key (buyer_realtor_id) 
    references real_estate.account(account_id) 
    on delete set null
);
```
