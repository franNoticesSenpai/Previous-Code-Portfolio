

--List of Owners and the names of the horses they own.
--Assumption: The PK of HORSE (called Id) is named --HorseID like the table OwnerOnHorse, same with the
--OwnerID for the table (it will be called OwnerID 
--across both the OwnerOnHorse and the Owner table)

SELECT o.Name, h.Name
FROM OWNER o
INNER JOIN OwnerOnHorse oh 
	ON (o.OwnerID = oh.OwnerID)
INNER JOIN HORSE h
	ON (oh.HorseID = h.HorseID);

--List of horses and the names of the jockeys who ride them
--Same assumptions I made in the last query, but this
--time for the Jockey Table as well as the Horse one
SELECT h.Name, j.Name
FROM HORSE h
INNER JOIN JockeyOnHorse jh
	ON( h.HorseID = jh.HorseID)
INNER JOIN JOCKEY j
	ON( jh.JockeyID = j.JockeyID);


--List of all the jockeys who ride for an owner with the ID of 1234

SELECT j.Name
FROM JOCKEY j
INNER JOIN JockeyOnHorse jh
	ON (j.jockey_id = jh.jockey_id)
INNER JOIN OwnerOnHorse oh
	ON (jh.horse_id = oh.horse_id)
WHERE oh.OwnerID = 1234;

--Get a list of all Jockey Photo URL's 

-- I'm assuming after the column has been created, there was 
--data inputted that is the same as the AssetPhoto's
--AssetID column
ALTER TABLE JockeyOnHorse
ADD AssetID NUMERIC;

SELECT ap.PhotoID
	--Null check for PhotoID
	CASE WHEN ap.PhotoID IS NULL THEN 'default.png'
	ELSE END AS photo_found
FROM AssetPhotos ap
INNER JOIN JockeyOnHorse jh
	ON (ap.AssetID = jh.AssetID)
INNER JOIN HORSE h
	ON (jh.HorseID = h.HorseID)
WHERE h.HorseID = 4321;

--Get a list of photo URLs of Arabian Breed horses assosiated
--with the owner email 'careers@evbasetech.com'

--My assumption here is that there is an AssetID in the
--OwnerOnHorse table with data inside and the ID's on owner
--and the horse table are OwnerID and HorseID, respectively

SELECT ap.PhotoID
FROM AssetPhotos ap
INNER JOIN OwnerOnHorse oh
	ON (ap.AssetID = oh.AssetID)
INNER JOIN Owner o
	ON (oh.OwnerID = o.OwnerID)
INNER JOIN Horse h
	On (oh.HorseID = h.HorseID)
WHERE h.Breed = 'Arabian'
GROUP BY o.Email;