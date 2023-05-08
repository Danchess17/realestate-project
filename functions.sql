create or replace function change_counter(
	change_id integer, 
	complaint_cnt_delta integer default 0, 
	transaction_cnt_delta integer default 0
)
returns table(
	account_id integer, 
	new_complaint_cnt integer,
	new_transaction_cnt integer
) as $$ 
select account_id, complaint_cnt, transaction_cnt 
from real_estate.account where account_id != $1 
union
select account_id, complaint_cnt + $2, transaction_cnt + $3
from real_estate.account where account_id = $1
$$ language sql;


create or replace function realtor_closed_affairs(realtor_id integer)
returns integer as $$
declare 
	cnt integer := 0;
begin 
	select count(transaction_id) into cnt from (
			select transaction_id, seller_realtor_id as r_id from real_estate.transaction_history
			where seller_realtor_id is not null
			union 
			select transaction_id, buyer_realtor_id as r_id from real_estate.transaction_history
			where buyer_realtor_id is not null
		) as realtors group by r_id having $1 = r_id;
	if (cnt is null) then return 0;
	else return cnt;
	end if;
end;
$$ language plpgsql;
