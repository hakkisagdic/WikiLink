CALL apoc.periodic.iterate(
"MATCH (c:Category {subcatsFetched: false, level: 0}) 
CALL apoc.load.json('https://' + apoc.text.urlencode(c.language) + '.wikipedia.org/w/api.php?format=json&action=query&list=categorymembers&cmtype=subcat&cmtitle=Category:' + apoc.text.urlencode(c.catName) + '&cmprop=ids%7Ctitle&cmlimit=5000') 
YIELD value as results 
UNWIND results.query.categorymembers AS subcat 
WITH subcat, c 
MERGE (sc:Category {catID: subcat.pageid}) 
ON CREATE SET sc.catName = substring(subcat.title,9), 
              sc.subcatsFetched = false, 
              sc.pagesFetched = false, 
			  sc.language = c.language, 
			  sc.dateCreated = TIMESTAMP(),  
			  sc.dateLastProcessed = TIMESTAMP(), 
              sc.level = (c.level + 1), 
			  sc.countSubCat = 0, 
			  sc.countParentCat = 0, 
			  sc.countPages = 0, 
			  c.countPages = coalesce(c.countPages, 0), 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
ON MATCH SET  sc.dateLastProcessed = TIMESTAMP(), 
              sc.levelSubCat = case when coalesce(sc.levelSubCat, 0) < (c.level + 1) then (c.level + 1) else sc.levelSubCat end, 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
WITH sc, c 
CALL apoc.create.addLabels(sc,['Level ' + (sc.level)]) YIELD node 
MERGE (sc)-[r:SUBCAT_OF]->(c) 
ON CREATE SET r.levelSubCat = sc.level, r.levelParentCat = c.level,  
			  sc.countParentCat = coalesce(sc.countParentCat, 0) + 1 ",
"WITH DISTINCT c SET c.subcatsFetched = true; ",
{batchSize:1000, parallel:false});

CALL apoc.periodic.iterate(
"MATCH (c:Category {subcatsFetched: false, level: 1}) 
CALL apoc.load.json('https://' + apoc.text.urlencode(c.language) + '.wikipedia.org/w/api.php?format=json&action=query&list=categorymembers&cmtype=subcat&cmtitle=Category:' + apoc.text.urlencode(c.catName) + '&cmprop=ids%7Ctitle&cmlimit=5000') 
YIELD value as results 
UNWIND results.query.categorymembers AS subcat 
WITH subcat, c 
MERGE (sc:Category {catID: subcat.pageid}) 
ON CREATE SET sc.catName = substring(subcat.title,9), 
              sc.subcatsFetched = false, 
              sc.pagesFetched = false, 
			  sc.language = c.language, 
			  sc.dateCreated = TIMESTAMP(),  
			  sc.dateLastProcessed = TIMESTAMP(), 
              sc.level = (c.level + 1), 
			  sc.countSubCat = 0, 
			  sc.countParentCat = 0, 
			  sc.countPages = 0, 
			  c.countPages = coalesce(c.countPages, 0), 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
ON MATCH SET  sc.dateLastProcessed = TIMESTAMP(), 
              sc.levelSubCat = case when coalesce(sc.levelSubCat, 0) < (c.level + 1) then (c.level + 1) else sc.levelSubCat end, 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
WITH sc, c 
CALL apoc.create.addLabels(sc,['Level ' + (sc.level)]) YIELD node 
MERGE (sc)-[r:SUBCAT_OF]->(c) 
ON CREATE SET r.levelSubCat = sc.level, r.levelParentCat = c.level,  
			  sc.countParentCat = coalesce(sc.countParentCat, 0) + 1 ",
"WITH DISTINCT c SET c.subcatsFetched = true; ",
{batchSize:1000, parallel:false});

CALL apoc.periodic.iterate(
"MATCH (c:Category {subcatsFetched: false, level: 2}) 
CALL apoc.load.json('https://' + apoc.text.urlencode(c.language) + '.wikipedia.org/w/api.php?format=json&action=query&list=categorymembers&cmtype=subcat&cmtitle=Category:' + apoc.text.urlencode(c.catName) + '&cmprop=ids%7Ctitle&cmlimit=5000') 
YIELD value as results 
UNWIND results.query.categorymembers AS subcat 
WITH subcat, c 
MERGE (sc:Category {catID: subcat.pageid}) 
ON CREATE SET sc.catName = substring(subcat.title,9), 
              sc.subcatsFetched = false, 
              sc.pagesFetched = false, 
			  sc.language = c.language, 
			  sc.dateCreated = TIMESTAMP(),  
			  sc.dateLastProcessed = TIMESTAMP(), 
              sc.level = (c.level + 1), 
			  sc.countSubCat = 0, 
			  sc.countParentCat = 0, 
			  sc.countPages = 0, 
			  c.countPages = coalesce(c.countPages, 0), 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
ON MATCH SET  sc.dateLastProcessed = TIMESTAMP(), 
              sc.levelSubCat = case when coalesce(sc.levelSubCat, 0) < (c.level + 1) then (c.level + 1) else sc.levelSubCat end, 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
WITH sc, c 
CALL apoc.create.addLabels(sc,['Level ' + (sc.level)]) YIELD node 
MERGE (sc)-[r:SUBCAT_OF]->(c) 
ON CREATE SET r.levelSubCat = sc.level, r.levelParentCat = c.level,  
			  sc.countParentCat = coalesce(sc.countParentCat, 0) + 1 ",
"WITH DISTINCT c SET c.subcatsFetched = true; ",
{batchSize:1000, parallel:false});

CALL apoc.periodic.iterate(
"MATCH (c:Category {subcatsFetched: false, level: 3}) 
CALL apoc.load.json('https://' + apoc.text.urlencode(c.language) + '.wikipedia.org/w/api.php?format=json&action=query&list=categorymembers&cmtype=subcat&cmtitle=Category:' + apoc.text.urlencode(c.catName) + '&cmprop=ids%7Ctitle&cmlimit=5000') 
YIELD value as results 
UNWIND results.query.categorymembers AS subcat 
WITH subcat, c 
MERGE (sc:Category {catID: subcat.pageid}) 
ON CREATE SET sc.catName = substring(subcat.title,9), 
              sc.subcatsFetched = false, 
              sc.pagesFetched = false, 
			  sc.language = c.language, 
			  sc.dateCreated = TIMESTAMP(),  
			  sc.dateLastProcessed = TIMESTAMP(), 
              sc.level = (c.level + 1), 
			  sc.countSubCat = 0, 
			  sc.countParentCat = 0, 
			  sc.countPages = 0, 
			  c.countPages = coalesce(c.countPages, 0), 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
ON MATCH SET  sc.dateLastProcessed = TIMESTAMP(), 
              sc.levelSubCat = case when coalesce(sc.levelSubCat, 0) < (c.level + 1) then (c.level + 1) else sc.levelSubCat end, 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
WITH sc, c 
CALL apoc.create.addLabels(sc,['Level ' + (sc.level)]) YIELD node 
MERGE (sc)-[r:SUBCAT_OF]->(c) 
ON CREATE SET r.levelSubCat = sc.level, r.levelParentCat = c.level,  
			  sc.countParentCat = coalesce(sc.countParentCat, 0) + 1 ",
"WITH DISTINCT c SET c.subcatsFetched = true; ",
{batchSize:1000, parallel:false});

CALL apoc.periodic.iterate(
"MATCH (c:Category {subcatsFetched: false, level: 4}) 
CALL apoc.load.json('https://' + apoc.text.urlencode(c.language) + '.wikipedia.org/w/api.php?format=json&action=query&list=categorymembers&cmtype=subcat&cmtitle=Category:' + apoc.text.urlencode(c.catName) + '&cmprop=ids%7Ctitle&cmlimit=5000') 
YIELD value as results 
UNWIND results.query.categorymembers AS subcat 
WITH subcat, c 
MERGE (sc:Category {catID: subcat.pageid}) 
ON CREATE SET sc.catName = substring(subcat.title,9), 
              sc.subcatsFetched = false, 
              sc.pagesFetched = false, 
			  sc.language = c.language, 
			  sc.dateCreated = TIMESTAMP(),  
			  sc.dateLastProcessed = TIMESTAMP(), 
              sc.level = (c.level + 1), 
			  sc.countSubCat = 0, 
			  sc.countParentCat = 0, 
			  sc.countPages = 0, 
			  c.countPages = coalesce(c.countPages, 0), 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
ON MATCH SET  sc.dateLastProcessed = TIMESTAMP(), 
              sc.levelSubCat = case when coalesce(sc.levelSubCat, 0) < (c.level + 1) then (c.level + 1) else sc.levelSubCat end, 
			  c.countSubCat = coalesce(c.countSubCat, 0) + 1 
WITH sc, c 
CALL apoc.create.addLabels(sc,['Level ' + (sc.level)]) YIELD node 
MERGE (sc)-[r:SUBCAT_OF]->(c) 
ON CREATE SET r.levelSubCat = sc.level, r.levelParentCat = c.level,  
			  sc.countParentCat = coalesce(sc.countParentCat, 0) + 1 ",
"WITH DISTINCT c SET c.subcatsFetched = true; ",
{batchSize:1000, parallel:false});

MATCH (c:Category) WHERE c.pageUrl is null
SET c.pageUrl = 'http://' + c.language + '.wikipedia.org/wiki/Category:' + replace(c.catName, ' ', '_');

MATCH (c:Category) WHERE c.balanceIndex is null AND (c.countSubCat > 0 OR c.countParentCat > 0)
SET c.balanceIndex =  ABS(toFloat(c.countParentCat - c.countSubCat)/(c.countParentCat + c.countSubCat));

MATCH (c:Category) WHERE c.balanceIndex is null AND (c.countSubCat = 0 OR c.countParentCat = 0)
SET c.balanceIndex =  0;

