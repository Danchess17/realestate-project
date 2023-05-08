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
	cnt integer;
begin 
	select transaction_cnt into cnt from real_estate.account where $1 = account_id;
	return cnt;
end;
$$ language plpgsql;
