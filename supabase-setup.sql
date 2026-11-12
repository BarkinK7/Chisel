-- Chisel friends database. Run this once in Supabase: SQL Editor > New query > paste > Run.
-- One row per player: a public card (name, rank, streaks, today's public tasks) and a private secret.

create table if not exists public.profiles (
  code text primary key check (code ~ '^[A-Z2-9]{6,12}$'),
  secret text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;

-- The app may read the public card of any code, but never the secret.
revoke all on public.profiles from anon, authenticated;
grant select (code, data, updated_at) on public.profiles to anon, authenticated;
drop policy if exists "anyone can read cards" on public.profiles;
create policy "anyone can read cards" on public.profiles for select to anon, authenticated using (true);

-- Writing goes only through this function. It checks the player's secret, so nobody can overwrite your card.
create or replace function public.save_profile(p_code text, p_secret text, p_data jsonb)
returns text
language plpgsql
security definer
set search_path = public
as $$
declare cur text;
begin
  if p_code is null or p_code !~ '^[A-Z2-9]{6,12}$' or length(coalesce(p_secret, '')) < 16 or pg_column_size(p_data) > 20000 then
    return 'bad';
  end if;
  select secret into cur from profiles where code = p_code;
  if not found then
    insert into profiles (code, secret, data) values (p_code, p_secret, p_data);
    return 'created';
  elsif cur = p_secret then
    update profiles set data = p_data, updated_at = now() where code = p_code;
    return 'ok';
  else
    return 'taken';
  end if;
end;
$$;

revoke all on function public.save_profile(text, text, jsonb) from public;
grant execute on function public.save_profile(text, text, jsonb) to anon, authenticated;
