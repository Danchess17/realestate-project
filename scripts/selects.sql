select realtor_flg, count(*) from real_estate.account group by realtor_flg;

select * from real_estate.apartment where flat_cnt = 2 and total_area > 60;

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

