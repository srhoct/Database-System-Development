CREATE TABLE location_ID(
	location_id integer PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    latitude NUMERIC NOT NULL,
    longitude NUMERIC NOT NULL
);	

CREATE TABLE users(
	user_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    location_id integer NOT NULL REFERENCES location_ID(location_id)
);

CREATE TABLE ads(
	ad_id serial PRIMARY KEY,
    user_id integer NOT NULL REFERENCES users(user_id),
    title VARCHAR(200) NOT NULL,
    details TEXT,
    price DECIMAL(15,2) NOT NULL,
    allow_bidding BOOLEAN DEFAULT TRUE,
    posting_date DATE DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(10) CHECK (status IN ('active', 'sold', 'expired')) DEFAULT 'active'
);
CREATE TABLE car_brands(
    brand_id serial PRIMARY KEY,
    brand_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE car_models(
    model_id serial PRIMARY KEY,
    brand_id integer NOT NULL REFERENCES car_brands(brand_id),
    model_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE cars(
    car_id serial PRIMARY KEY,
    ad_id integer NOT NULL REFERENCES ads(ad_id),
    brand_id integer NOT NULL REFERENCES car_brands(brand_id),
    model_id integer NOT NULL REFERENCES car_models(model_id),
    body_type VARCHAR(50) NOT NULL,
    transmission_type VARCHAR(10) CHECK (transmission_type IN ('manual', 'automatic')) NOT NULL,
    year INTEGER NOT NULL CHECK (year >= 1000 AND year <= 9999),
    color VARCHAR(50),
    mileage integer NOT NULL,
    additional_description TEXT
);

CREATE TABLE bids(
    bid_id serial PRIMARY KEY,
    ad_id integer NOT NULL REFERENCES ads(ad_id),
    user_id integer NOT NULL REFERENCES users(user_id),
    bid_amount DECIMAL(15,2) NOT NULL,
    bid_date DATE DEFAULT CURRENT_TIMESTAMP
);

-- relasi antara tabel ads dan tabel users
ALTER TABLE ads ADD CONSTRAINT fk_ads_users
	FOREIGN KEY(user_id)
	REFERENCES users(user_id)
	ON DELETE NO ACTION;
	
-- relasi antara tabel cars dan car_brands
ALTER TABLE cars ADD CONSTRAINT fk_cars_car_brands
	FOREIGN KEY(brand_id)
	REFERENCES car_brands(brand_id)
	ON DELETE NO ACTION; 

-- relasi antara tabel cars dan ads
ALTER TABLE cars ADD CONSTRAINT fk_cars_ads
	FOREIGN KEY(ad_id)
	REFERENCES ads(ad_id)
	ON DELETE NO ACTION;

-- relasi antara tabel cars dan car_models
ALTER TABLE cars ADD CONSTRAINT fk_cars_car_models
	FOREIGN KEY(model_id)
	REFERENCES car_models(model_id)
	ON DELETE NO ACTION;

-- relasi antara tabel car_models dan car_brands
ALTER TABLE cars ADD CONSTRAINT fk_car_brands_car_models
	FOREIGN KEY(brand_id)
	REFERENCES car_brands(brand_id)
	ON DELETE NO ACTION;

-- relasi antara tabel bids dan ads
ALTER TABLE bids ADD CONSTRAINT fk_bids_ads
	FOREIGN KEY(ad_id)
	REFERENCES ads(ad_id)
	ON DELETE NO ACTION;

-- relasi antara tabel bids dan tabel users
ALTER TABLE bids ADD CONSTRAINT fk_bids_users
	FOREIGN KEY(user_id)
	REFERENCES users(user_id)
	ON DELETE NO ACTION;

-- relasi antara tabel users dan tabel location_ID
ALTER TABLE users ADD CONSTRAINT fk_users_location_ID
	FOREIGN KEY(location_id)
	REFERENCES location_ID(location_id)
	ON DELETE NO ACTION;

-- input data ke tabel location_ID
INSERT INTO location_ID
VALUES(3171, 'Kota Jakarta Pusat', -6.186486,	106.834091),
(3172,	'Kota Jakarta Utara',	-6.121435, 106.774124),
(3173,	'Kota Jakarta Barat',	-6.1352, 106.813301),
(3174,	'Kota Jakarta Selatan', -6.300641, 106.814095),
(3175,	'Kota Jakarta Timur',	-6.264451, 106.895859),
(3573,	'Kota Malang', -7.981894,	112.626503),
(3578,	'Kota Surabaya', -7.289166, 112.734398),
(3471,	'Kota Yogyakarta', -7.797224,	110.368797),
(3273,	'Kota Bandung', -6.9147444, 107.6098111),
(1371,	'Kota Padang', -0.95,	100.3530556),
(1375,	'Kota Bukittinggi', -0.3055556, 100.3691667),
(6471,	'Kota Balikpapan', -1.2635389, 116.8278833),
(6472,	'Kota Samarinda',	-0.502183, 117.153801),
(7371,	'Kota Makassar', -5.1333333, 119.4166667),
(5171,	'Kota Denpasar', -8.65629, 115.222099);
SELECT * FROM location_ID;

-- input data ke tabel location_ID
INSERT INTO location_ID
VALUES(3171, 'Kota Jakarta Pusat', -6.186486,	106.834091),
(3172,	'Kota Jakarta Utara',	-6.121435, 106.774124),
(3173,	'Kota Jakarta Barat',	-6.1352, 106.813301),
(3174,	'Kota Jakarta Selatan', -6.300641, 106.814095),
(3175,	'Kota Jakarta Timur',	-6.264451, 106.895859),
(3573,	'Kota Malang', -7.981894,	112.626503),
(3578,	'Kota Surabaya', -7.289166, 112.734398),
(3471,	'Kota Yogyakarta', -7.797224,	110.368797),
(3273,	'Kota Bandung', -6.9147444, 107.6098111),
(1371,	'Kota Padang', -0.95,	100.3530556),
(1375,	'Kota Bukittinggi', -0.3055556, 100.3691667),
(6471,	'Kota Balikpapan', -1.2635389, 116.8278833),
(6472,	'Kota Samarinda',	-0.502183, 117.153801),
(7371,	'Kota Makassar', -5.1333333, 119.4166667),
(5171,	'Kota Denpasar', -8.65629, 115.222099);
SELECT * FROM location_ID;

INSERT INTO bids(bid_id, ad_id, user_id, bid_amount,  bid_date) 
VALUES(250, 33, 98, 256765295.5, '4-21-2024');
(251, 74, 5, 296781461.9),
(252, 55, 86, 43882590.17),
(253, 68, 82, 321017253.6),
(254, 161, 32, 245383520.4),
(255, 16, 1, 330871325.6),
(256, 104, 43, 276787847.7),
(257, 115, 87, 19154312.12),
(258, 171, 84, 392543369.1),
(259, 134, 41, 35143060.99),
(260, 39, 48, 18267258.3),
(261, 158, 61, 349102812.7),
(262, 165, 71, 223366182.8),
(263, 171, 23, 211707625.6),
(264, 129, 41, 452688417.7),
(265, 186, 24, 322058595.7),
(266, 189, 13, 230054284.6),
(267, 189, 82, 227003685.5),
(268, 183, 7, 82547483.18),
(269, 177, 24, 240128463.5),
(270, 157, 30, 468927101.3),
(271, 49, 13, 472938736),
(272, 109, 62, 491259580.5),
(273, 105, 82, 71742633.74),
(274, 36, 67, 177952471.5),
(275, 158, 55, 162988769.3),
(276, 17, 9, 195905775.2),
(277, 167, 0, 228219187.3),
(278, 71, 47, 411976167.5),
(279, 17, 2, 397375594.6),
(280, 100, 89, 418054686.5),
(281, 55, 70, 212525866.3),
(282, 113, 14, 425446146.2),
(283, 26, 27, 323519597.5),
(284, 98, 15, 262758146.1),
(285, 54, 43, 440486375.5),
(286, 163, 17, 271290746.4),
(287, 29, 66, 83779683.54),
(288, 39, 55, 352939630.8),
(289, 110, 41, 214111894.4),
(290, 51, 57, 461151642.8),
(291, 150, 70, 272279114.9),
(292, 40, 5, 324936180.1),
(293, 135, 62, 262050986.2),
(294, 104, 19, 195821132.4),
(295, 21, 22, 476320351),
(296, 50, 24, 364087722.4),
(297, 79, 68, 34150404.54),
(298, 76, 35, 14362771.06),
(299, 76, 36, 105706038.9),
(300, 63, 19, 207345407.2);
SELECT * FROM bids;