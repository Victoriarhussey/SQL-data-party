CREATE TABLE FemaleWorldLeadersYearlyGDP (
    LeaderID INT,
    Name VARCHAR(100),
    Country VARCHAR(100),
    Year INT,
    GDP DECIMAL(15, 2),
    PRIMARY KEY (LeaderID, Year)
);

-- Data for Margaret Thatcher (UK) with varying GDP from 1979 to 1990
INSERT INTO FemaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(1, 'Margaret Thatcher', 'United Kingdom', 1979, 1500000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1980, 1520000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1981, 1550000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1982, 1570000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1983, 1600000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1984, 1620000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1985, 1650000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1986, 1680000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1987, 1700000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1988, 1720000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1989, 1750000000000.00),
(1, 'Margaret Thatcher', 'United Kingdom', 1990, 1770000000000.00);

-- Data for Angela Merkel (Germany) with varying GDP from 2005 to 2021
INSERT INTO FemaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(2, 'Angela Merkel', 'Germany', 2005, 3500000000000.00),
(2, 'Angela Merkel', 'Germany', 2006, 3550000000000.00),
(2, 'Angela Merkel', 'Germany', 2007, 3600000000000.00),
(2, 'Angela Merkel', 'Germany', 2008, 3650000000000.00),
(2, 'Angela Merkel', 'Germany', 2009, 3700000000000.00),
(2, 'Angela Merkel', 'Germany', 2010, 3750000000000.00),
(2, 'Angela Merkel', 'Germany', 2011, 3800000000000.00),
(2, 'Angela Merkel', 'Germany', 2012, 3850000000000.00),
(2, 'Angela Merkel', 'Germany', 2013, 3900000000000.00),
(2, 'Angela Merkel', 'Germany', 2014, 3950000000000.00),
(2, 'Angela Merkel', 'Germany', 2015, 4000000000000.00),
(2, 'Angela Merkel', 'Germany', 2016, 4050000000000.00),
(2, 'Angela Merkel', 'Germany', 2017, 4100000000000.00),
(2, 'Angela Merkel', 'Germany', 2018, 4150000000000.00),
(2, 'Angela Merkel', 'Germany', 2019, 4200000000000.00),
(2, 'Angela Merkel', 'Germany', 2020, 4250000000000.00),
(2, 'Angela Merkel', 'Germany', 2021, 4300000000000.00);

-- Data for Ellen Johnson Sirleaf (Liberia) with varying GDP from 2006 to 2018
INSERT INTO FemaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2006, 3000000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2007, 3100000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2008, 3200000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2009, 3300000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2010, 3400000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2011, 3500000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2012, 3600000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2013, 3700000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2014, 3800000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2015, 3900000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2016, 4000000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2017, 4100000000.00),
(3, 'Ellen Johnson Sirleaf', 'Liberia', 2018, 4200000000.00);

-- Data for Jacinda Ardern (New Zealand) with varying GDP from 2017 to 2023
INSERT INTO FemaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(4, 'Jacinda Ardern', 'New Zealand', 2017, 400000000000.00),
(4, 'Jacinda Ardern', 'New Zealand', 2018, 410000000000.00),
(4, 'Jacinda Ardern', 'New Zealand', 2019, 420000000000.00),
(4, 'Jacinda Ardern', 'New Zealand', 2020, 430000000000.00),
(4, 'Jacinda Ardern', 'New Zealand', 2021, 440000000000.00),
(4, 'Jacinda Ardern', 'New Zealand', 2022, 450000000000.00),
(4, 'Jacinda Ardern', 'New Zealand', 2023, 460000000000.00);


SELECT 
    LeaderID,
    Name,
    Country,
    AVG(GDP) AS AverageGDP
FROM 
    FemaleWorldLeadersYearlyGDP
GROUP BY 
    LeaderID, Name, Country;
	
	CREATE TABLE MaleWorldLeadersYearlyGDP (
    LeaderID INT,
    Name VARCHAR(100),
    Country VARCHAR(100),
    Year INT,
    GDP DECIMAL(15, 2),
    PRIMARY KEY (LeaderID, Year)
);

-- Data for Winston Churchill (UK) with varying GDP from 1940 to 1945
INSERT INTO MaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(1, 'Winston Churchill', 'United Kingdom', 1940, 800000000000.00),
(1, 'Winston Churchill', 'United Kingdom', 1941, 820000000000.00),
(1, 'Winston Churchill', 'United Kingdom', 1942, 840000000000.00),
(1, 'Winston Churchill', 'United Kingdom', 1943, 860000000000.00),
(1, 'Winston Churchill', 'United Kingdom', 1944, 880000000000.00),
(1, 'Winston Churchill', 'United Kingdom', 1945, 900000000000.00);

-- Data for Konrad Adenauer (Germany) with varying GDP from 1949 to 1963
INSERT INTO MaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(2, 'Konrad Adenauer', 'Germany', 1949, 500000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1950, 520000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1951, 540000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1952, 560000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1953, 580000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1954, 600000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1955, 620000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1956, 640000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1957, 660000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1958, 680000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1959, 700000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1960, 720000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1961, 740000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1962, 760000000000.00),
(2, 'Konrad Adenauer', 'Germany', 1963, 780000000000.00);

-- Data for William Tubman (Liberia) with varying GDP from 1951 to 1971
INSERT INTO MaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(3, 'William Tubman', 'Liberia', 1951, 250000000.00),
(3, 'William Tubman', 'Liberia', 1952, 260000000.00),
(3, 'William Tubman', 'Liberia', 1953, 270000000.00),
(3, 'William Tubman', 'Liberia', 1954, 280000000.00),
(3, 'William Tubman', 'Liberia', 1955, 290000000.00),
(3, 'William Tubman', 'Liberia', 1956, 300000000.00),
(3, 'William Tubman', 'Liberia', 1957, 310000000.00),
(3, 'William Tubman', 'Liberia', 1958, 320000000.00),
(3, 'William Tubman', 'Liberia', 1959, 330000000.00),
(3, 'William Tubman', 'Liberia', 1960, 340000000.00),
(3, 'William Tubman', 'Liberia', 1961, 350000000.00),
(3, 'William Tubman', 'Liberia', 1962, 360000000.00),
(3, 'William Tubman', 'Liberia', 1963, 370000000.00),
(3, 'William Tubman', 'Liberia', 1964, 380000000.00),
(3, 'William Tubman', 'Liberia', 1965, 390000000.00),
(3, 'William Tubman', 'Liberia', 1966, 400000000.00),
(3, 'William Tubman', 'Liberia', 1967, 410000000.00),
(3, 'William Tubman', 'Liberia', 1968, 420000000.00),
(3, 'William Tubman', 'Liberia', 1969, 430000000.00),
(3, 'William Tubman', 'Liberia', 1970, 440000000.00),
(3, 'William Tubman', 'Liberia', 1971, 450000000.00);

-- Data for Robert Muldoon (New Zealand) with varying GDP from 1975 to 1984
INSERT INTO MaleWorldLeadersYearlyGDP (LeaderID, Name, Country, Year, GDP) VALUES
(4, 'Robert Muldoon', 'New Zealand', 1975, 20000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1976, 21000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1977, 22000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1978, 23000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1979, 24000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1980, 25000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1981, 26000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1982, 27000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1983, 28000000000.00),
(4, 'Robert Muldoon', 'New Zealand', 1984, 29000000000.00);


