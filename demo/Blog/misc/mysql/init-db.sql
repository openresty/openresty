-- Blog posts
drop table if exists posts;
create table posts (
    id serial,
    title text not null,
    content text not null,
    author varchar(64) not null,
    created timestamp(0) default now() not null,
    comments integer default 0 not  null,
    primary key (id)
);

-- Blog comments
drop table if exists comments;
create table comments (
    id serial,
    sender varchar(64) not null,
    email varchar(64),
    url varchar(1024),
    body text not null,
    created timestamp(0) default now() not null,
    post bigint not null,
    foreign key (post) references posts(id)
);

