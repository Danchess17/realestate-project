create or replace view private_account as (
    select replace(first_name, substring(first_name, 2, length(first_name) - 2), repeat('*', 3)) as hidden_firstname,
    replace(second_name, substring(second_name, 2, length(second_name) - 2), repeat('*', 3)) as hidden_secondname 
	from real_estate.account
);

create or replace view private_numbers as (
    select replace(telephone_no, substring(telephone_no, 4, length(telephone_no) - 3), repeat('*', 5)) 
	as hidden_phone from real_estate.account
);