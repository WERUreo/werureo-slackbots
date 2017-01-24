-- Trains
INSERT INTO trains (id, number, direction) VALUES (1, 301, 'SB');
INSERT INTO trains (id, number, direction) VALUES (2, 302, 'NB');
INSERT INTO trains (id, number, direction) VALUES (3, 303, 'SB');
INSERT INTO trains (id, number, direction) VALUES (4, 304, 'NB');
INSERT INTO trains (id, number, direction) VALUES (5, 305, 'SB');
INSERT INTO trains (id, number, direction) VALUES (6, 306, 'NB');
INSERT INTO trains (id, number, direction) VALUES (7, 307, 'SB');
INSERT INTO trains (id, number, direction) VALUES (8, 308, 'NB');
INSERT INTO trains (id, number, direction) VALUES (9, 309, 'SB');
INSERT INTO trains (id, number, direction) VALUES (10, 310, 'NB');
INSERT INTO trains (id, number, direction) VALUES (11, 311, 'SB');
INSERT INTO trains (id, number, direction) VALUES (12, 312, 'NB');
INSERT INTO trains (id, number, direction) VALUES (13, 313, 'SB');
INSERT INTO trains (id, number, direction) VALUES (14, 314, 'NB');
INSERT INTO trains (id, number, direction) VALUES (15, 315, 'SB');
INSERT INTO trains (id, number, direction) VALUES (16, 316, 'NB');
INSERT INTO trains (id, number, direction) VALUES (17, 317, 'SB');
INSERT INTO trains (id, number, direction) VALUES (18, 318, 'NB');
INSERT INTO trains (id, number, direction) VALUES (19, 319, 'SB');
INSERT INTO trains (id, number, direction) VALUES (20, 320, 'NB');
INSERT INTO trains (id, number, direction) VALUES (21, 321, 'SB');
INSERT INTO trains (id, number, direction) VALUES (22, 322, 'NB');
INSERT INTO trains (id, number, direction) VALUES (23, 323, 'SB');
INSERT INTO trains (id, number, direction) VALUES (24, 324, 'NB');
INSERT INTO trains (id, number, direction) VALUES (25, 325, 'SB');
INSERT INTO trains (id, number, direction) VALUES (26, 326, 'NB');
INSERT INTO trains (id, number, direction) VALUES (27, 327, 'SB');
INSERT INTO trains (id, number, direction) VALUES (28, 328, 'NB');
INSERT INTO trains (id, number, direction) VALUES (29, 329, 'SB');
INSERT INTO trains (id, number, direction) VALUES (30, 330, 'NB');
INSERT INTO trains (id, number, direction) VALUES (31, 331, 'SB');
INSERT INTO trains (id, number, direction) VALUES (32, 332, 'NB');
INSERT INTO trains (id, number, direction) VALUES (33, 333, 'SB');
INSERT INTO trains (id, number, direction) VALUES (34, 334, 'NB');
INSERT INTO trains (id, number, direction) VALUES (35, 335, 'SB');
INSERT INTO trains (id, number, direction) VALUES (36, 336, 'NB');

-- Stations
INSERT INTO stations (id, slug, location, address) VALUES (1, 'debary', 'DeBary', '630 South Charles R. Beall Blvd. DeBary, FL 32713');
INSERT INTO stations (id, slug, location, address) VALUES (2, 'sanford', 'Sanford', '2720 West State Road 36 Sanford, FL 32771');
INSERT INTO stations (id, slug, location, address) VALUES (3, 'lake-mary', 'Lake Mary', '2200 West Lake Mary Blvd. Lake Mary, FL 32746');
INSERT INTO stations (id, slug, location, address) VALUES (4, 'longwood', 'Longwood', '149 East Church Ave. Longwood, FL 32750');
INSERT INTO stations (id, slug, location, address) VALUES (5, 'altamonte-springs', 'Altamonte Springs', '2741 South Ronald Reagan Blvd. Altamonte Springs, FL 32701');
INSERT INTO stations (id, slug, location, address) VALUES (6, 'maitland', 'Maitland', '801 North Orlando Ave. Maitland, FL 32751');
INSERT INTO stations (id, slug, location, address) VALUES (7, 'winter-park', 'Winter Park', '148 West Morse Blvd. Winter Park, FL 32789');
INSERT INTO stations (id, slug, location, address) VALUES (8, 'florida-hospital', 'Florida Hospital Health Village', '500 East Rollins Street Orlando, FL 32803');
INSERT INTO stations (id, slug, location, address) VALUES (9, 'lynx-central', 'Lynx Central', '101 West Livingston Street Orlando, FL 32801');
INSERT INTO stations (id, slug, location, address) VALUES (10, 'church-street', 'Church Street', '99 West South Street Orlando, FL 32801');
INSERT INTO stations (id, slug, location, address) VALUES (11, 'orlando-health', 'Orlando Health/Amtrak', '250 Columbia Street Orlando, FL 32806');
INSERT INTO stations (id, slug, location, address) VALUES (12, 'sand-lake-road', 'Sand Lake Road', '8030 South Orange Ave. Orlando, FL 32809');

-- Schedules
-- Southbound AM
-- 301
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (1, 1, 2, '5:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (2, 1, 3, '5:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (3, 1, 4, '5:19 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (4, 1, 5, '5:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (5, 1, 6, '5:29 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (6, 1, 7, '5:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (7, 1, 8, '5:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (8, 1, 9, '5:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (9, 1, 10, '5:51 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (10, 1, 11, '5:54 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (11, 1, 12, '6:03 AM');

-- 303
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (12, 3, 1, '5:30 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (13, 3, 2, '5:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (14, 3, 3, '5:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (15, 3, 4, '5:49 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (16, 3, 5, '5:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (17, 3, 6, '5:59 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (18, 3, 7, '6:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (19, 3, 8, '6:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (20, 3, 9, '6:18 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (21, 3, 10, '6:21 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (22, 3, 11, '6:24 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (23, 3, 12, '6:33 AM');

-- 305
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (24, 5, 1, '6:00 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (25, 5, 2, '6:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (26, 5, 3, '6:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (27, 5, 4, '6:19 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (28, 5, 5, '6:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (29, 5, 6, '6:29 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (30, 5, 7, '6:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (31, 5, 8, '6:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (32, 5, 9, '6:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (33, 5, 10, '6:51 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (34, 5, 11, '6:54 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (35, 5, 12, '7:03 AM');

-- 307
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (36, 7, 1, '6:30 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (37, 7, 2, '6:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (38, 7, 3, '6:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (39, 7, 4, '6:49 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (40, 7, 5, '6:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (41, 7, 6, '6:59 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (42, 7, 7, '7:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (43, 7, 8, '7:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (44, 7, 9, '7:18 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (45, 7, 10, '7:21 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (46, 7, 11, '7:24 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (47, 7, 12, '7:33 AM');

-- 309
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (48, 9, 1, '7:00 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (49, 9, 2, '7:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (50, 9, 3, '7:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (51, 9, 4, '7:19 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (52, 9, 5, '7:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (53, 9, 6, '7:29 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (54, 9, 7, '7:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (55, 9, 8, '7:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (56, 9, 9, '7:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (57, 9, 10, '7:51 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (58, 9, 11, '7:54 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (59, 9, 12, '8:03 AM');

-- 311
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (60, 11, 1, '7:30 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (61, 11, 2, '7:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (62, 11, 3, '7:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (63, 11, 4, '7:49 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (64, 11, 5, '7:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (65, 11, 6, '7:59 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (66, 11, 7, '8:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (67, 11, 8, '8:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (68, 11, 9, '8:18 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (69, 11, 10, '8:21 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (70, 11, 11, '8:24 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (71, 11, 12, '8:33 AM');

-- 313
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (72, 13, 1, '8:00 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (73, 13, 2, '8:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (74, 13, 3, '8:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (75, 13, 4, '8:19 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (76, 13, 5, '8:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (77, 13, 6, '8:29 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (78, 13, 7, '8:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (79, 13, 8, '8:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (80, 13, 9, '8:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (81, 13, 10, '8:51 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (82, 13, 11, '8:54 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (83, 13, 12, '9:03 AM');

-- Southbound Mid-day
-- 315
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (84, 15, 1, '10:00 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (85, 15, 2, '10:06 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (86, 15, 3, '10:13 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (87, 15, 4, '10:19 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (88, 15, 5, '10:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (89, 15, 6, '10:29 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (90, 15, 7, '10:36 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (91, 15, 8, '10:43 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (92, 15, 9, '10:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (93, 15, 10, '10:51 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (94, 15, 11, '10:54 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (95, 15, 12, '11:03 AM');

-- 317
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (96, 17, 1, '12:00 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (97, 17, 2, '12:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (98, 17, 3, '12:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (99, 17, 4, '12:19 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (100, 17, 5, '12:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (101, 17, 6, '12:29 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (102, 17, 7, '12:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (103, 17, 8, '12:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (104, 17, 9, '12:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (105, 17, 10, '12:51 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (106, 17, 11, '12:54 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (107, 17, 12, '1:03 PM');

-- 319
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (108, 19, 1, '1:00 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (109, 19, 2, '1:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (110, 19, 3, '1:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (111, 19, 4, '1:19 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (112, 19, 5, '1:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (113, 19, 6, '1:29 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (114, 19, 7, '1:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (115, 19, 8, '1:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (116, 19, 9, '1:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (117, 19, 10, '1:51 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (118, 19, 11, '1:54 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (119, 19, 12, '2:03 PM');

-- Southbound PM
-- 321
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (120, 21, 1, '3:00 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (121, 21, 2, '3:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (122, 21, 3, '3:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (123, 21, 4, '3:19 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (124, 21, 5, '3:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (125, 21, 6, '3:29 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (126, 21, 7, '3:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (127, 21, 8, '3:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (128, 21, 9, '3:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (129, 21, 10, '3:51 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (130, 21, 11, '3:54 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (131, 21, 12, '4:03 PM');

-- 323
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (132, 23, 1, '3:30 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (133, 23, 2, '3:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (134, 23, 3, '3:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (135, 23, 4, '3:49 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (136, 23, 5, '3:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (137, 23, 6, '3:59 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (138, 23, 7, '4:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (139, 23, 8, '4:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (140, 23, 9, '4:18 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (141, 23, 10, '4:21 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (142, 23, 11, '4:24 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (143, 23, 12, '4:33 PM');

-- 325
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (144, 25, 1, '4:00 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (145, 25, 2, '4:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (146, 25, 3, '4:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (147, 25, 4, '4:19 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (148, 25, 5, '4:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (149, 25, 6, '4:29 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (150, 25, 7, '4:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (151, 25, 8, '4:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (152, 25, 9, '4:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (153, 25, 10, '4:51 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (154, 25, 11, '4:54 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (155, 25, 12, '5:03 PM');

-- 327
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (156, 27, 1, '4:30 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (157, 27, 2, '4:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (158, 27, 3, '4:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (159, 27, 4, '4:49 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (160, 27, 5, '4:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (161, 27, 6, '4:59 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (162, 27, 7, '5:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (163, 27, 8, '5:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (164, 27, 9, '5:18 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (165, 27, 10, '5:21 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (166, 27, 11, '5:24 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (167, 27, 12, '5:33 PM');

-- 329
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (168, 29, 1, '5:00 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (169, 29, 2, '5:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (170, 29, 3, '5:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (171, 29, 4, '5:19 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (172, 29, 5, '5:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (173, 29, 6, '5:29 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (174, 29, 7, '5:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (175, 29, 8, '5:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (176, 29, 9, '5:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (177, 29, 10, '5:51 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (178, 29, 11, '5:54 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (179, 29, 12, '6:03 PM');

-- 331
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (180, 31, 1, '5:30 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (181, 31, 2, '5:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (182, 31, 3, '5:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (183, 31, 4, '5:49 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (184, 31, 5, '5:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (185, 31, 6, '5:59 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (186, 31, 7, '6:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (187, 31, 8, '6:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (188, 31, 9, '6:18 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (189, 31, 10, '6:21 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (190, 31, 11, '6:24 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (191, 31, 12, '6:33 PM');

-- 333
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (192, 33, 1, '6:00 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (193, 33, 2, '6:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (194, 33, 3, '6:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (195, 33, 4, '6:19 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (196, 33, 5, '6:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (197, 33, 6, '6:29 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (198, 33, 7, '6:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (199, 33, 8, '6:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (200, 33, 9, '6:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (201, 33, 10, '6:51 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (202, 33, 11, '6:54 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (203, 33, 12, '7:03 PM');

-- 335
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (204, 35, 1, '8:00 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (205, 35, 2, '8:06 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (206, 35, 3, '8:13 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (207, 35, 4, '8:19 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (208, 35, 5, '8:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (209, 35, 6, '8:29 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (210, 35, 7, '8:36 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (211, 35, 8, '8:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (212, 35, 9, '8:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (213, 35, 10, '8:51 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (214, 35, 11, '8:54 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (215, 35, 12, '9:03 PM');

-- Northbound AM
-- 302
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (216, 2, 12, '6:15 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (217, 2, 11, '6:22 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (218, 2, 10, '6:25 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (219, 2, 9, '6:28 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (220, 2, 8, '6:34 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (221, 2, 7, '6:41 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (222, 2, 6, '6:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (223, 2, 5, '6:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (224, 2, 4, '6:57 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (225, 2, 3, '7:03 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (226, 2, 2, '7:10 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (227, 2, 1, '7:18 AM');

-- 304
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (228, 4, 12, '6:45 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (229, 4, 11, '6:52 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (230, 4, 10, '6:55 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (231, 4, 9, '6:58 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (232, 4, 8, '7:04 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (233, 4, 7, '7:11 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (234, 4, 6, '7:18 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (235, 4, 5, '7:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (236, 4, 4, '7:27 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (237, 4, 3, '7:33 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (238, 4, 2, '7:40 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (239, 4, 1, '7:48 AM');

-- 306
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (240, 6, 12, '7:15 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (241, 6, 11, '7:22 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (242, 6, 10, '7:25 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (243, 6, 9, '7:28 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (244, 6, 8, '7:34 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (245, 6, 7, '7:41 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (246, 6, 6, '7:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (247, 6, 5, '7:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (248, 6, 4, '7:57 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (249, 6, 3, '8:03 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (250, 6, 2, '8:10 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (251, 6, 1, '8:18 AM');

-- 308
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (252, 8, 12, '7:45 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (253, 8, 11, '7:52 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (254, 8, 10, '7:55 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (255, 8, 9, '7:58 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (256, 8, 8, '8:04 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (257, 8, 7, '8:11 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (258, 8, 6, '8:18 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (259, 8, 5, '8:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (260, 8, 4, '8:27 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (261, 8, 3, '8:33 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (262, 8, 2, '8:40 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (263, 8, 1, '8:48 AM');

-- 310
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (264, 10, 12, '8:15 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (265, 10, 11, '8:22 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (266, 10, 10, '8:25 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (267, 10, 9, '8:28 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (268, 10, 8, '8:34 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (269, 10, 7, '8:41 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (270, 10, 6, '8:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (271, 10, 5, '8:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (272, 10, 4, '8:57 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (273, 10, 3, '9:03 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (274, 10, 2, '9:10 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (275, 10, 1, '9:18 AM');

-- 312
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (276, 12, 12, '8:45 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (277, 12, 11, '8:52 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (278, 12, 10, '8:55 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (279, 12, 9, '8:58 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (280, 12, 8, '9:04 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (281, 12, 7, '9:11 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (282, 12, 6, '9:18 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (283, 12, 5, '9:23 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (284, 12, 4, '9:27 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (285, 12, 3, '9:33 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (286, 12, 2, '9:40 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (287, 12, 1, '9:48 AM');

-- 314
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (288, 14, 12, '9:15 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (289, 14, 11, '9:22 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (290, 14, 10, '9:25 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (291, 14, 9, '9:28 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (292, 14, 8, '9:34 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (293, 14, 7, '9:41 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (294, 14, 6, '9:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (295, 14, 5, '9:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (296, 14, 4, '9:57 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (297, 14, 3, '10:03 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (298, 14, 2, '10:10 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (299, 14, 1, '10:18 AM');

-- Northbound Mid-day
-- 316
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (300, 16, 12, '11:15 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (301, 16, 11, '11:22 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (302, 16, 10, '11:25 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (303, 16, 9, '11:28 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (304, 16, 8, '11:34 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (305, 16, 7, '11:41 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (306, 16, 6, '11:48 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (307, 16, 5, '11:53 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (308, 16, 4, '11:57 AM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (309, 16, 3, '12:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (310, 16, 2, '12:10 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (311, 16, 1, '12:18 PM');

-- 318
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (312, 18, 12, '1:15 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (313, 18, 11, '1:22 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (314, 18, 10, '1:25 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (315, 18, 9, '1:28 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (316, 18, 8, '1:34 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (317, 18, 7, '1:41 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (318, 18, 6, '1:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (319, 18, 5, '1:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (320, 18, 4, '1:57 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (321, 18, 3, '2:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (322, 18, 2, '2:10 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (323, 18, 1, '2:18 PM');

-- 320
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (324, 20, 12, '2:15 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (325, 20, 11, '2:22 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (326, 20, 10, '2:25 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (327, 20, 9, '2:28 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (328, 20, 8, '2:34 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (329, 20, 7, '2:41 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (330, 20, 6, '2:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (331, 20, 5, '2:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (332, 20, 4, '2:57 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (333, 20, 3, '3:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (334, 20, 2, '3:10 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (335, 20, 1, '3:18 PM');

-- Northbound PM
-- 322
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (336, 22, 12, '4:15 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (337, 22, 11, '4:22 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (338, 22, 10, '4:25 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (339, 22, 9, '4:28 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (340, 22, 8, '4:34 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (341, 22, 7, '4:41 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (342, 22, 6, '4:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (343, 22, 5, '4:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (344, 22, 4, '4:57 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (345, 22, 3, '5:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (346, 22, 2, '5:10 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (347, 22, 1, '5:18 PM');

-- 324
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (348, 24, 12, '4:45 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (349, 24, 11, '4:52 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (350, 24, 10, '4:55 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (351, 24, 9, '4:58 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (352, 24, 8, '5:04 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (353, 24, 7, '5:11 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (354, 24, 6, '5:18 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (355, 24, 5, '5:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (356, 24, 4, '5:27 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (357, 24, 3, '5:33 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (358, 24, 2, '5:40 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (359, 24, 1, '5:48 PM');

-- 326
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (360, 26, 12, '5:15 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (361, 26, 11, '5:22 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (362, 26, 10, '5:25 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (363, 26, 9, '5:28 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (364, 26, 8, '5:34 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (365, 26, 7, '5:41 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (366, 26, 6, '5:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (367, 26, 5, '5:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (368, 26, 4, '5:57 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (369, 26, 3, '6:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (370, 26, 2, '6:10 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (371, 26, 1, '6:18 PM');

-- 328
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (372, 28, 12, '5:45 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (373, 28, 11, '5:52 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (374, 28, 10, '5:55 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (375, 28, 9, '5:58 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (376, 28, 8, '6:04 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (377, 28, 7, '6:11 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (378, 28, 6, '6:18 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (379, 28, 5, '6:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (380, 28, 4, '6:27 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (381, 28, 3, '6:33 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (382, 28, 2, '6:40 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (383, 28, 1, '6:48 PM');

-- 330
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (384, 30, 12, '6:15 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (385, 30, 11, '6:22 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (386, 30, 10, '6:25 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (387, 30, 9, '6:28 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (388, 30, 8, '6:34 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (389, 30, 7, '6:41 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (390, 30, 6, '6:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (391, 30, 5, '6:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (392, 30, 4, '6:57 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (393, 30, 3, '7:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (394, 30, 2, '7:10 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (395, 30, 1, '7:18 PM');

-- 332
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (396, 32, 12, '6:45 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (397, 32, 11, '6:52 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (398, 32, 10, '6:55 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (399, 32, 9, '6:58 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (400, 32, 8, '7:04 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (401, 32, 7, '7:11 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (402, 32, 6, '7:18 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (403, 32, 5, '7:23 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (404, 32, 4, '7:27 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (405, 32, 3, '7:33 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (406, 32, 2, '7:40 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (407, 32, 1, '7:48 PM');

-- 334
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (408, 34, 12, '7:30 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (409, 34, 11, '7:37 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (410, 34, 10, '7:40 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (411, 34, 9, '7:43 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (412, 34, 8, '7:49 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (413, 34, 7, '7:56 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (414, 34, 6, '8:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (415, 34, 5, '8:08 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (416, 34, 4, '8:12 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (417, 34, 3, '8:18 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (418, 34, 2, '8:25 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (419, 34, 1, '8:33 PM');

-- 336
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (420, 36, 12, '9:15 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (421, 36, 11, '9:22 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (422, 36, 10, '9:25 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (423, 36, 9, '9:28 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (424, 36, 8, '9:34 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (425, 36, 7, '9:41 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (426, 36, 6, '9:48 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (427, 36, 5, '9:53 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (428, 36, 4, '9:57 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (429, 36, 3, '10:03 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (430, 36, 2, '10:10 PM');
INSERT INTO station_train (id, train_id, station_id, arrival_time) VALUES (431, 36, 1, '10:18 PM');
