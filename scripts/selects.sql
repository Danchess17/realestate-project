select (realtor_id is not null) as realtor, count(*) from real_estate.account 
group by (realtor_id is not null)

select * from real_estate.apartment where flat_cnt = 2 and total_area_amt > 60;

select realtor_rate from real_estate.realtor where realtor_id in (
    select distinct seller_realtor_id from real_estate.transaction_history
    union 
    select distinct buyer_realtor_id from real_estate.transaction_history
) order by realtor_rate desc;

select distinct apartment_id, announcement_price_cnt from real_estate.announcement where active_flg = true;

select * from real_estate.apartment where flat_cnt = 3 and apartment_id in (
    select apartment_id from real_estate.announcement where announcement_price_cnt > 15000000 
);

select * from real_estate.apartment where kitchen_area_amt = (
    select max(kitchen_area_amt) from real_estate.apartment
);

select * from real_estate.transaction_history 
where extract(year from transaction_dttm) between 2019 and 2022;
