-- Blog posts
create table posts (
    id serial,
    title varchar(128) not null,
    content text not null,
    author varchar(64) not null,
    created timestamp(0) default now() not null,
    comments integer default 0 not  null,
    primary key (id)
);

-- Blog comments
create table comments (
    id serial,
    sender varchar(64) not null,
    email varchar(64) not null,
    url carchar(1024),
    body text,
    created timestamp(0) deafult now() not null,
    foreign key (post) references posts(id)
);

