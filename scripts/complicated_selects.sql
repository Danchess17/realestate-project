select apartment_type, avg(total_area_amt) as average_total_area
from real_estate.apartment group by apartment_type having avg(total_area_amt) > 100;

select apartment_type, apartment_address, flat_cnt
from real_estate.apartment order by flat_cnt desc;

select rank() over(order by realtor_rate desc), first_name, second_name, realtor_rate 
from real_estate.realtor r, real_estate.account a
where r.realtor_id = a.account_id;

select rank() over (partition by announcement_type order by announcement_price_cnt), 
announcement_type, announcement_price_cnt from real_estate.announcement;

select distinct min(announcement_price_cnt) over (partition by announcement_type), 
announcement_type from real_estate.announcement;

select distinct first_value(announcement_price_cnt) over 
(partition by announcement_type order by announcement_price_cnt), 
announcement_type from real_estate.announcement;

