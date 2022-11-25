--название и год выхода альбомов, вышедших в 2018 году;
select title as "Название", release as "Дата выпуска" from albums where extract(year from release) = 2018;
--название и продолжительность самого длительного трека;
select title as "Название", duration as "Продолжительность" from tracks where duration = (select max(duration) from tracks);
--название треков, продолжительность которых не менее 3,5 минуты;
select title as "Название", duration as "Продолжительность" from tracks where duration > (3.5 * 60);
--названия сборников, вышедших в период с 2018 по 2020 год включительно;
select title as "Название" from compilations where extract(year from release) >= 2018 AND extract(year from release) <= 2020;
--исполнители, чье имя состоит из 1 слова;
select name from authors where (LENGTH(name) - LENGTH(replace(name, ' ', ''))) = 0;
--название треков, которые содержат слово "мой"/"my".
-- 1 вариант (результат более правдоподобный, так как ищем слово, а не слог):
--select title as "Название" from tracks where regexp_like (title,'^my | my');
-- 2 вариант:
select title as "Название" from tracks where title like '%my%';
