create schema real_estate;

create table real_estate.realtor (
    realtor_id int not null, 
    from_company_flg boolean not null, 
    checked_realtor_flg boolean not null, 
    request_got_cnt int not null, 
    realtor_rate decimal,

    constraint realtor_rate_range_check
    check(realtor_rate is null or realtor_rate between 0 and 10),

    constraint realtor_pk primary key (realtor_id)
);

create table real_estate.realtor_history (
    change_id int not null, 
    change_dttm timestamp without time zone not null,
    realtor_id int not null, 
    new_from_company_flg boolean not null, 
    new_checked_realtor_flg boolean not null, 
    new_request_got_cnt int not null, 
    new_realtor_rate decimal,

    constraint new_realtor_rate_range_check
    check(new_realtor_rate is null or new_realtor_rate between 0 and 10),

    constraint change_realtor_pk primary key (change_id), 

    constraint fk_realtor foreign key (realtor_id) 
    references real_estate.realtor(realtor_id) 
    on delete set null
);

create table real_estate.client (
    client_id int not null, 
    request_sent_cnt int not null,

    constraint client_pk primary key (client_id)
);

create table real_estate.client_history (
    change_id int not null, 
    change_dttm timestamp without time zone not null,
    client_id int not null, 
    new_request_sent_cnt int not null,

    constraint change_client_pk primary key (change_id), 

    constraint fk_client foreign key (client_id) 
    references real_estate.client(client_id) 
    on delete set null
);

create table real_estate.account (
    account_id int not null, 
    online_flg boolean not null, 
    telephone_no varchar(255) not null,
    email varchar(255) not null,
    client_id int not null,
    realtor_id int,
    registration_dttm timestamp without time zone not null,
    complaint_cnt int not null,
    transaction_cnt int not null,
    first_name varchar(255) not null,
    second_name varchar(255) not null, 

    constraint account_pk primary key (account_id), 

    constraint fk_client foreign key (client_id) 
    references real_estate.client(client_id) 
    on delete set null,

    constraint fk_realtor foreign key (realtor_id) 
    references real_estate.realtor(realtor_id) 
    on delete set null
);

create table real_estate.account_version_history (
    change_id int not null,
    change_dttm timestamp without time zone not null,
    account_id int not null, 
    new_online_flg boolean not null, 
    new_telephone_no varchar(255) not null,
    new_email varchar(255) not null,
    new_realtor_id int,
    new_complaint_cnt int not null,
    new_transaction_cnt int not null,
    new_first_name varchar(255) not null,
    new_second_name varchar(255) not null, 

    constraint change_account_pk primary key (change_id), 

    constraint fk_account foreign key (account_id) 
    references real_estate.account(account_id) 
    on delete set null, 

    constraint fk_new_realtor foreign key (new_realtor_id) 
    references real_estate.realtor(realtor_id) 
    on delete set null
);

create table real_estate.apartment (
    apartment_id int not null,
    apartment_type varchar(255) not null, 
    total_area_amt int not null, 
    living_area_amt int, 
    kitchen_area_amt int, 
    apartment_address varchar(255) not null,
    flat_cnt int not null, 
    balcony_cnt int not null,

    constraint apartment_pk primary key (apartment_id)
);

create table real_estate.announcement (
    announcement_id int not null, 
    apartment_id int not null, 
    apartment_desc varchar(1000),
    announcement_type varchar(255) not null, 
    announcement_price_cnt int not null, 
    made_by_realtor_flg boolean not null,
    active_flg boolean not null,

    constraint announcement_pk primary key (announcement_id),

    constraint fk_apartment foreign key (apartment_id) 
    references real_estate.apartment(apartment_id) 
    on delete set null
);

create table real_estate.transaction_history (
    transaction_id int not null,
    transaction_dttm timestamp without time zone not null,
    apartment_id int not null, 
    seller_id int not null, 
    seller_realtor_id int, 
    buyer_id int not null, 
    buyer_realtor_id int, 
    transaction_type varchar(255) not null, 
    transaction_price_cnt int not null,

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

