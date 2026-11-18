
-- SOCIAL+ INITIAL DATABASE
-- More Than Social.

create extension if not exists pgcrypto;

-- 1. USER PROFILES
create table public.profiles (
    id uuid primary key references auth.users(id) on delete cascade,
    username text unique,
    display_name text,
    bio text,
    avatar_url text,
    created_at timestamptz default now()
);

-- 2. POSTS
create table public.posts (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references public.profiles(id) on delete cascade,
    body text not null check (char_length(body) <= 5000),
    created_at timestamptz default now()
);

-- 3. FOLLOWERS
create table public.follows (
    follower_id uuid references public.profiles(id) on delete cascade,
    followed_id uuid references public.profiles(id) on delete cascade,
    created_at timestamptz default now(),
    primary key (follower_id, followed_id),
    check (follower_id <> followed_id)
);

-- 4. ENABLE ROW LEVEL SECURITY
alter table public.profiles enable row level security;
alter table public.posts enable row level security;
alter table public.follows enable row level security;

-- 5. PROFILE SECURITY
create policy "Authenticated users can view profiles"
on public.profiles for select
to authenticated
using (true);

create policy "Users can create their own profile"
on public.profiles for insert
to authenticated
with check (auth.uid() = id);

create policy "Users can update their own profile"
on public.profiles for update
to authenticated
using (auth.uid() = id)
with check (auth.uid() = id);

-- 6. POST SECURITY
create policy "Authenticated users can view posts"
on public.posts for select
to authenticated
using (true);

create policy "Users can create their own posts"
on public.posts for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users can update their own posts"
on public.posts for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users can delete their own posts"
on public.posts for delete
to authenticated
using (auth.uid() = user_id);

-- 7. FOLLOW SECURITY
create policy "Authenticated users can view follows"
on public.follows for select
to authenticated
using (true);

create policy "Users can follow others"
on public.follows for insert
to authenticated
with check (auth.uid() = follower_id);

create policy "Users can unfollow others"
on public.follows for delete
to authenticated
using (auth.uid() = follower_id);
