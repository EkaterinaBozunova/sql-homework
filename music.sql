-- Создание базы данных
CREATE DATABASE music_db;

-- Создание схемы
CREATE SCHEMA music;

-- Создание таблиц в схеме music
CREATE TABLE music.genre (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);

CREATE TABLE music.artist (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE music.album (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  year INT CHECK (year > 0)
);

CREATE TABLE music.track (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  album_id INT REFERENCES music.album(id),
  duration INT
);

CREATE TABLE music.collection (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  issue_year INT CHECK (issue_year > 0)
);

CREATE TABLE music.genre_to_artist (
  genre_id INT REFERENCES music.genre(id),
  artist_id INT REFERENCES music.artist(id)
);

CREATE TABLE music.artist_to_album (
  artist_id INT REFERENCES music.artist(id),
  album_id INT REFERENCES music.album(id)
);

CREATE TABLE music.track_to_collection (
  track_id INT REFERENCES music.track(id),
  collection_id INT REFERENCES music.collection(id)
);