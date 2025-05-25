-- Active: 1747448790362@@127.0.0.1@5432@ph

CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
);

CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    species_id INT,
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes TEXT,
    Foreign Key (ranger_id) REFERENCES rangers (ranger_id) on delete CASCADE,
    Foreign Key (species_id) REFERENCES species (species_id) on delete CASCADE
)

INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );
;

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );
;

INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );
;




-- problem 1

INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');




-- problem 2

SELECT count(*) as unique_species_sighted
FROM (
        SELECT species_id
        FROM sightings
        GROUP BY
            species_id
    );




-- problem 3

SELECT * FROM sightings WHERE location ILIKE ('%pass%');




-- problem 4

SELECT name, count(*) as total_sightings
FROM rangers
    JOIN sightings using (ranger_id)
GROUP BY
    name;



-- problem 5

SELECT common_name
FROM species sp
WHERE
    NOT EXISTS (
        SELECT *
        FROM sightings s
        WHERE
            s.species_id = sp.species_id
    );




-- problem 6

SELECT sighting_time, name
FROM sightings
    JOIN rangers USING (ranger_id)
ORDER BY sighting_time DESC
LIMIT 2;




-- problem 7

UPDATE species
set
    conservation_status = 'Historic'
where
    discovery_date < '1800-01-01';




-- problem 8

SELECT * FROM sightings

SELECT
    sighting_id,
    CASE
        WHEN extract(
            HOUR
            from sighting_time
        ) < 12 THEN 'Morning'
        WHEN extract(
            HOUR
            from sighting_time
        ) BETWEEN 12 and 17  THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;



-- problem 9

DELETE from rangers
WHERE
    ranger_id = (
        SELECT ranger_id
        FROM rangers
        WHERE
            NOT EXISTS (
                SELECT *
                FROM sightings
                WHERE
                    rangers.ranger_id = sightings.ranger_id
            )
    );