create or replace view private_account as (
    select replace(first_name, substring(first_name, 2, length(first_name) - 2), repeat('*', 3)) as hidden_firstname,
    replace(second_name, substring(second_name, 2, length(second_name) - 2), repeat('*', 3)) as hidden_secondname 
	from real_estate.account
);

create or replace view private_numbers as (
    select replace(telephone_no, substring(telephone_no, 4, length(telephone_no) - 3), repeat('*', 5)) 
	as hidden_phone from real_estate.account
);

create or replace view transaction_members as
select t.seller_id as seller_id, concat(seller.first_name, ' ', seller.second_name) as seller, 
t.buyer_id as buyer_id, concat(buyer.first_name, ' ', buyer.second_name) as buyer from real_estate.transaction_history t, 
real_estate.account seller, real_estate.account buyer 
where t.seller_id = seller.account_id and t.buyer_id = buyer.account_id;
