create index person on real_estate.account
using btree(first_name, second_name);

create index reg_time on real_estate.account 
using btree(registration_dttm);

create index apartment_area on real_estate.apartment
using btree(total_area_amt, living_area_amt, kitchen_area_amt);

create index apartment_flat on real_estate.apartment 
using btree(flat_cnt);

create index realtor_announcement on real_estate.announcement
using btree(made_by_realtor_flg);

create index transaction on real_estate.transaction_history
using btree(seller_id, buyer_id, apartment_id, transaction_dttm, transaction_price_cnt);
