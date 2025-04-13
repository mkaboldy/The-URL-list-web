CREATE TABLE lists (
    id integer,
    created_at time,
    title varchar,
    description text,
    slug text
);

CREATE TABLE links (
    id integer,
    list_id integer,  -- Foreign key to lists.id
    created_at timestamp,
    url varchar,
    image varchar,
    title varchar,
    description text
);