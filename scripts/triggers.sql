create sequence serial start 1;

create or replace function real_estate.insert_into_account_history_on_update()
returns trigger as $$
begin
    insert into real_estate.account_version_history values (
        nextval('serial'),
        now(), 
        old.account_id,
        old.online_flg,
        old.telephone_no,
        old.email,
        old.realtor_id,
        old.complaint_cnt,
        old.transaction_cnt, 
        old.first_name, 
        old.second_name
    );
    return old;
end;
$$ language plpgsql;

create or replace trigger account_history_update_on_delete after update on real_estate.account
for each row execute function real_estate.insert_into_account_history_on_update();
