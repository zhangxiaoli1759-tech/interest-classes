-- 兴趣班课时管理 · 数据表
-- 在 Supabase 控制台 → SQL Editor 里粘贴执行一次即可
-- （或由 AI 通过数据库直连自动执行）

-- 1) 兴趣班表
create table if not exists public.interest_classes (
  id             bigint generated always as identity primary key,
  name           text not null,               -- 兴趣班名称
  recharge_amount numeric default 0,          -- 最近一次充值金额
  recharge_time  text,                        -- 充值时间（YYYY-MM-DD）
  lesson_count   integer not null default 0,  -- 剩余课时数
  created_at     timestamptz default now()
);

-- 2) 消课记录表
create table if not exists public.lesson_records (
  id           bigint generated always as identity primary key,
  class_id     bigint not null,               -- 关联兴趣班 id
  class_name   text not null,                 -- 兴趣班名称（冗余，便于展示）
  consume_time text,                          -- 消课时间（YYYY-MM-DD）
  deduct_count integer not null default 1,    -- 扣除课时数
  note         text default '',               -- 备注
  created_at   timestamptz default now()
);

create index if not exists idx_lesson_records_class on public.lesson_records(class_id);

-- 3) 开启行级安全（RLS）
alter table public.interest_classes enable row level security;
alter table public.lesson_records enable row level security;

-- 4) 允许匿名（前端 anon key）读写整张表
-- 适合家庭内部私密使用；如需防外人，可后续加口令校验
drop policy if exists "allow anon all" on public.interest_classes;
create policy "allow anon all" on public.interest_classes for all using (true) with check (true);

drop policy if exists "allow anon all" on public.lesson_records;
create policy "allow anon all" on public.lesson_records for all using (true) with check (true);
