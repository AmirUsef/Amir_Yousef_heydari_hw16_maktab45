SELECT w.*,count(w.id) FROM blog.writers as w
join blog.articles as a on w.id = a.Writer_id group by(Writer_id);

SELECT w.first_name,w.last_name,a.* FROM blog.writers as w
join blog.articles as a on w.id = a.Writer_id where w.id = 2;

SELECT a.*,cat.title FROM blog.writers as w
join blog.articles as a on w.id = a.Writer_id
join blog.categories as cat on a.Category_id = cat.id where w.id = 2 && cat.title = 'commentarie';

SELECT t.title,count(t.id) FROM blog.tags as t
join blog.articles_has_tags as aht on t.id = aht.Tag_id
join blog.articles as a on aht.Article_id = a.id group by(Tag_id);

SELECT cat.title FROM blog.categories as cat where cat.id NOT IN (SELECT Category_id FROM blog.articles);

SELECT w.first_name,w.last_name FROM blog.writers as w where w.id NOT IN
(SELECT Writer_id from blog.articles as a 
join blog.categories as cat on a.Category_id = cat.id where cat.title = 'perspectives');



