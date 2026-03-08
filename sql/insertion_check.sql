select relname as table_name,
n_live_tup as estimated_rows
from pg_stat_user_tables
