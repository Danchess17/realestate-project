select realtor_flg, count(*) from real_estate.account group by realtor_flg;

select * from apartment where flat_cnt = 2 and total_area > 60;

select realtor_rate from real_estate.realtor where realtor_id in (
    select distinct seller_realtor_id from real_estate.transaction_history
    union 
    select distinct buyer_realtor_id from real_estate.transaction_history
) order by realtor_rate desc;

