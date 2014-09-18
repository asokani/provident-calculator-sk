Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

class NumberFormat
  this.format = (number, decimals = 0, dec_point = ',', thousands_sep = ' ') ->
    # from https://github.com/GlitchMr/number-format/blob/master/lib/number-format.coffee
    negative = if number < 0 then '-' else ''
    number = Math.abs number
    decimal = ((number - parseInt number).toFixed decimals)[2..]
    number = "#{parseInt number.toFixed decimals}".split('').reverse().join('').
    replace(/...(?!$)/g, "$&#{thousands_sep.replace /\$/g, '$$$$'}").
    split('').reverse().join('')
    decimalPoint = if decimals isnt 0 then dec_point else ''
    "#{negative}#{number}#{decimalPoint}#{decimal}"

class TableData
  data: """
Territory	Version	Period	ProductType	MinAmount	MaxAmount	Currency	IssueValue	Insurance	PreparatoryFee	Xcharge	AnnualInterestRate	Interest	EarlyDeliveryFee	ServiceFeeRate	ServiceFee	CollectionFee	TotalServiceFee	TAP	GrossIssueValue	IssueCost	TotalAmountPayable	FinalRate	RegularRate	APR
SK	1	60	Loan with Komfort service	160	1500	€	160	-	-	-	24,20%	24,82	-	-	28,01	82,4	52,83	212,83	-	-	295,23	4,36	4,93	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	180	-	-	-	24,20%	27,93	-	-	31,5	92,7	59,43	239,43	-	-	332,13	5,27	5,54	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	200	-	-	-	24,20%	31,03	-	-	35,01	103	66,04	266,04	-	-	369,04	5,6	6,16	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	220	-	-	-	24,20%	34,13	-	-	38,51	113,3	72,64	292,64	-	-	405,94	6,51	6,77	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	240	-	-	-	24,20%	37,24	-	-	42	123,6	79,24	319,24	-	-	442,84	6,83	7,39	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	260	-	-	-	24,20%	40,34	-	-	45,51	133,9	85,85	345,85	-	-	479,75	7,75	8	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	280	-	-	-	24,20%	43,44	-	-	49,01	144,2	92,45	372,45	-	-	516,65	8,07	8,62	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	300	-	-	-	24,20%	46,55	-	-	52,51	154,5	99,06	399,06	-	-	553,56	8,99	9,23	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	320	-	-	-	24,20%	49,65	-	-	56,01	164,8	105,66	425,66	-	-	590,46	9,31	9,85	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	340	-	-	-	24,20%	52,75	-	-	59,51	175,1	112,26	452,26	-	-	627,36	10,22	10,46	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	360	-	-	-	24,20%	55,86	-	-	63,01	185,4	118,87	478,87	-	-	664,27	10,55	11,08	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	380	-	-	-	24,20%	58,96	-	-	66,51	195,7	125,47	505,47	-	-	701,17	11,46	11,69	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	400	-	-	-	24,20%	62,06	-	-	70,01	206	132,07	532,07	-	-	738,07	11,78	12,31	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	420	-	-	-	24,20%	65,17	-	-	73,51	216,3	138,68	558,68	-	-	774,98	12,7	12,92	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	440	-	-	-	24,20%	68,27	-	-	77,01	226,6	145,28	585,28	-	-	811,88	13,02	13,54	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	460	-	-	-	24,20%	71,37	-	-	80,52	236,9	151,89	611,89	-	-	848,79	13,94	14,15	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	480	-	-	-	24,20%	74,47	-	-	84,02	247,2	158,49	638,49	-	-	885,69	14,26	14,77	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	500	-	-	-	24,20%	77,58	-	-	87,51	257,5	165,09	665,09	-	-	922,59	15,17	15,38	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	520	-	-	-	24,20%	80,68	-	-	91,02	267,8	171,7	691,70	-	-	959,5	15,5	16	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	540	-	-	-	24,20%	83,78	-	-	94,52	278,1	178,3	718,30	-	-	996,4	16,41	16,61	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	560	-	-	-	24,20%	86,89	-	-	98,01	288,4	184,9	744,90	-	-	1 033,30	16,73	17,23	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	580	-	-	-	24,20%	89,99	-	-	101,52	298,7	191,51	771,51	-	-	1 070,21	17,65	17,84	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	600	-	-	-	24,20%	93,09	-	-	105,02	309	198,11	798,11	-	-	1 107,11	17,97	18,46	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	620	-	-	-	24,20%	96,2	-	-	108,52	319,3	204,72	824,72	-	-	1 144,02	18,89	19,07	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	640	-	-	-	24,20%	99,3	-	-	112,02	329,6	211,32	851,32	-	-	1 180,92	19,21	19,69	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	660	-	-	-	24,20%	102,4	-	-	115,52	339,9	217,92	877,92	-	-	1 217,82	20,12	20,3	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	680	-	-	-	24,20%	105,51	-	-	119,02	350,2	224,53	904,53	-	-	1 254,73	20,45	20,92	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	700	-	-	-	24,20%	108,61	-	-	122,52	360,5	231,13	931,13	-	-	1 291,63	21,36	21,53	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	720	-	-	-	24,20%	111,71	-	-	126,02	370,8	237,73	957,73	-	-	1 328,53	21,68	22,15	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	740	-	-	-	24,20%	114,82	-	-	129,52	381,1	244,34	984,34	-	-	1 365,44	22,6	22,76	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	760	-	-	-	24,20%	117,92	-	-	133,02	391,4	250,94	1 010,94	-	-	1 402,34	22,92	23,38	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	780	-	-	-	24,20%	121,02	-	-	136,52	401,7	257,54	1 037,54	-	-	1 439,24	23,83	23,99	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	800	-	-	-	24,20%	124,12	-	-	140,03	412	264,15	1 064,15	-	-	1 476,15	24,16	24,61	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	820	-	-	-	24,20%	127,23	-	-	143,52	422,3	270,75	1 090,75	-	-	1 513,05	25,07	25,22	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	840	-	-	-	24,20%	130,33	-	-	147,03	432,6	277,36	1 117,36	-	-	1 549,96	25,4	25,84	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	860	-	-	-	24,20%	133,43	-	-	150,53	442,9	283,96	1 143,96	-	-	1 586,86	26,31	26,45	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	880	-	-	-	24,20%	136,53	-	-	154,03	453,2	290,56	1 170,56	-	-	1 623,76	26,63	27,07	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	900	-	-	-	24,20%	139,64	-	-	157,53	463,5	297,17	1 197,17	-	-	1 660,67	27,55	27,68	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	920	-	-	-	24,20%	142,74	-	-	161,03	473,8	303,77	1 223,77	-	-	1 697,57	27,87	28,3	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	940	-	-	-	24,20%	145,84	-	-	164,53	484,1	310,37	1 250,37	-	-	1 734,47	28,78	28,91	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	960	-	-	-	24,20%	148,95	-	-	168,03	494,4	316,98	1 276,98	-	-	1 771,38	29,11	29,53	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	980	-	-	-	24,20%	152,05	-	-	171,53	504,7	323,58	1 303,58	-	-	1 808,28	30,02	30,14	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1000	-	-	-	24,20%	155,16	-	-	175,03	515	330,19	1 330,19	-	-	1 845,19	30,35	30,76	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1020	-	-	-	24,20%	158,26	-	-	178,53	525,3	336,79	1 356,79	-	-	1 882,09	31,26	31,37	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1040	-	-	-	24,20%	161,36	-	-	182,03	535,6	343,39	1 383,39	-	-	1 918,99	31,58	31,99	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1060	-	-	-	24,20%	164,47	-	-	185,53	545,9	350	1 410,00	-	-	1 955,90	32,5	32,6	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1080	-	-	-	24,20%	167,57	-	-	189,03	556,2	356,6	1 436,60	-	-	1 992,80	32,82	33,22	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1100	-	-	-	24,20%	170,67	-	-	192,53	566,5	363,2	1 463,20	-	-	2 029,70	33,73	33,83	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1120	-	-	-	24,20%	173,77	-	-	196,04	576,8	369,81	1 489,81	-	-	2 066,61	34,06	34,45	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1140	-	-	-	24,20%	176,88	-	-	199,53	587,1	376,41	1 516,41	-	-	2 103,51	34,97	35,06	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1160	-	-	-	24,20%	179,98	-	-	203,04	597,4	383,02	1 543,02	-	-	2 140,42	35,3	35,68	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1180	-	-	-	24,20%	183,08	-	-	206,54	607,7	389,62	1 569,62	-	-	2 177,32	36,21	36,29	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1200	-	-	-	24,20%	186,18	-	-	210,04	618	396,22	1 596,22	-	-	2 214,22	36,53	36,91	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1220	-	-	-	24,20%	189,29	-	-	213,54	628,3	402,83	1 622,83	-	-	2 251,13	37,45	37,52	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1240	-	-	-	24,20%	192,39	-	-	217,04	638,6	409,43	1 649,43	-	-	2 288,03	37,77	38,14	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1260	-	-	-	24,20%	195,49	-	-	220,54	648,9	416,03	1 676,03	-	-	2 324,93	38,68	38,75	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1280	-	-	-	24,20%	198,6	-	-	224,04	659,2	422,64	1 702,64	-	-	2 361,84	39,01	39,37	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1300	-	-	-	24,20%	201,7	-	-	227,54	669,5	429,24	1 729,24	-	-	2 398,74	39,92	39,98	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1320	-	-	-	24,20%	204,8	-	-	231,04	679,8	435,84	1 755,84	-	-	2 435,64	40,24	40,6	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1340	-	-	-	24,20%	207,91	-	-	234,54	690,1	442,45	1 782,45	-	-	2 472,55	41,16	41,21	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1360	-	-	-	24,20%	211,01	-	-	238,04	700,4	449,05	1 809,05	-	-	2 509,45	41,48	41,83	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1380	-	-	-	24,20%	214,12	-	-	241,54	710,7	455,66	1 835,66	-	-	2 546,36	42,4	42,44	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1400	-	-	-	24,20%	217,22	-	-	245,04	721	462,26	1 862,26	-	-	2 583,26	42,72	43,06	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1420	-	-	-	24,20%	220,32	-	-	248,54	731,3	468,86	1 888,86	-	-	2 620,16	43,63	43,67	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1440	-	-	-	24,20%	223,42	-	-	252,05	741,6	475,47	1 915,47	-	-	2 657,07	43,96	44,29	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1460	-	-	-	24,20%	226,53	-	-	255,54	751,9	482,07	1 942,07	-	-	2 693,97	44,87	44,9	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1480	-	-	-	24,20%	229,63	-	-	259,04	762,2	488,67	1 968,67	-	-	2 730,87	45,19	45,52	44,06%
SK	1	60	Loan with Komfort service	160	1500	€	1500	-	-	-	24,20%	232,73	-	-	262,55	772,5	495,28	1 995,28	-	-	2 767,78	46,11	46,13	44,06%
SK	1	100	Loan with Komfort service	600	2300	€	600	-	-	-	21,50%	142,62	-	-	159,21	357	301,83	901,83	-	-	1258,83	12,42	12,59	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	650	-	-	-	21,50%	154,51	-	-	172,48	386,75	326,99	976,99	-	-	1363,74	13,38	13,64	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	700	-	-	-	21,50%	166,4	-	-	185,74	416,5	352,14	1052,14	-	-	1468,64	14,33	14,69	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	750	-	-	-	21,50%	178,28	-	-	199,01	446,25	377,29	1127,29	-	-	1573,54	15,28	15,74	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	800	-	-	-	21,50%	190,16	-	-	212,28	476	402,44	1202,44	-	-	1678,44	16,23	16,79	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	850	-	-	-	21,50%	202,05	-	-	225,55	505,75	427,6	1277,6	-	-	1783,35	17,19	17,84	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	900	-	-	-	21,50%	213,94	-	-	238,81	535,5	452,75	1352,75	-	-	1888,25	18,14	18,89	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	950	-	-	-	21,50%	225,82	-	-	252,08	565,25	477,9	1427,9	-	-	1993,15	19,09	19,94	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1000	-	-	-	21,50%	237,7	-	-	265,35	595	503,05	1503,05	-	-	2098,05	20,04	20,99	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1050	-	-	-	21,50%	249,59	-	-	278,62	624,75	528,21	1578,21	-	-	2202,96	21,99	22,03	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1100	-	-	-	21,50%	261,48	-	-	291,88	654,5	553,36	1653,36	-	-	2307,86	22,94	23,08	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1150	-	-	-	21,50%	273,36	-	-	305,15	684,25	578,51	1728,51	-	-	2412,76	23,89	24,13	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1200	-	-	-	21,50%	285,25	-	-	318,42	714	603,67	1803,67	-	-	2517,67	24,85	25,18	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1250	-	-	-	21,50%	297,13	-	-	331,69	743,75	628,82	1878,82	-	-	2622,57	25,8	26,23	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1300	-	-	-	21,50%	309,02	-	-	344,95	773,5	653,97	1953,97	-	-	2727,47	26,75	27,28	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1350	-	-	-	21,50%	320,9	-	-	358,22	803,25	679,12	2029,12	-	-	2832,37	27,7	28,33	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1400	-	-	-	21,50%	332,79	-	-	371,49	833	704,28	2104,28	-	-	2937,28	28,66	29,38	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1450	-	-	-	21,50%	344,68	-	-	384,75	862,75	729,43	2179,43	-	-	3042,18	29,61	30,43	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1500	-	-	-	21,50%	356,56	-	-	398,02	892,5	754,58	2254,58	-	-	3147,08	30,56	31,48	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1550	-	-	-	21,50%	368,45	-	-	411,29	922,25	779,74	2329,74	-	-	3251,99	32,51	32,52	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1600	-	-	-	21,50%	380,33	-	-	424,56	952	804,89	2404,89	-	-	3356,89	33,46	33,57	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1650	-	-	-	21,50%	392,22	-	-	437,82	981,75	830,04	2480,04	-	-	3461,79	34,41	34,62	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1700	-	-	-	21,50%	404,1	-	-	451,09	1011,5	855,19	2555,19	-	-	3566,69	35,36	35,67	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1750	-	-	-	21,50%	415,99	-	-	464,36	1041,25	880,35	2630,35	-	-	3671,6	36,32	36,72	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1800	-	-	-	21,50%	427,87	-	-	477,63	1071	905,5	2705,5	-	-	3776,5	37,27	37,77	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1850	-	-	-	21,50%	439,76	-	-	490,89	1100,75	930,65	2780,65	-	-	3881,4	38,22	38,82	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1900	-	-	-	21,50%	451,64	-	-	504,16	1130,5	955,8	2855,8	-	-	3986,3	39,17	39,87	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	1950	-	-	-	21,50%	463,53	-	-	517,43	1160,25	980,96	2930,96	-	-	4091,21	40,13	40,92	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	2000	-	-	-	21,50%	475,41	-	-	530,7	1190	1006,11	3006,11	-	-	4196,11	41,08	41,97	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	2050	-	-	-	21,50%	487,3	-	-	543,96	1219,75	1031,26	3081,26	-	-	4301,01	42,03	43,02	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	2100	-	-	-	21,50%	499,19	-	-	557,23	1249,5	1056,42	3156,42	-	-	4405,92	43,98	44,06	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	2150	-	-	-	21,50%	511,07	-	-	570,5	1279,25	1081,57	3231,57	-	-	4510,82	44,93	45,11	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	2200	-	-	-	21,50%	522,96	-	-	583,76	1309	1106,72	3306,72	-	-	4615,72	45,88	46,16	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	2250	-	-	-	21,50%	534,84	-	-	597,03	1338,75	1131,87	3381,87	-	-	4720,62	46,83	47,21	57,17%
SK	1	100	Loan with Komfort service	600	2300	€	2300	-	-	-	21,50%	546,73	-	-	610,3	1368,5	1157,03	3457,03	-	-	4825,53	47,79	48,26	57,17%
SK	1	60	Loan without Komfort service	160	1500	€	160	-	-	-	24,20%	24,82	-	-	28,01	-	52,83	212,8	-	-	212,8	3,38	3,55	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	180	-	-	-	24,20%	27,93	-	-	31,5	-	59,43	239,43	-	-	239,43	3,43	4	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	200	-	-	-	24,20%	31,03	-	-	35,01	-	66,04	266,04	-	-	266,04	4,08	4,44	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	220	-	-	-	24,20%	34,13	-	-	38,51	-	72,64	292,64	-	-	292,64	4,72	4,88	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	240	-	-	-	24,20%	37,24	-	-	42	-	79,24	319,24	-	-	319,24	4,77	5,33	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	260	-	-	-	24,20%	40,34	-	-	45,51	-	85,85	345,85	-	-	345,85	5,42	5,77	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	280	-	-	-	24,20%	43,44	-	-	49,01	-	92,45	372,45	-	-	372,45	6,06	6,21	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	300	-	-	-	24,20%	46,55	-	-	52,51	-	99,06	399,06	-	-	399,06	6,12	6,66	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	320	-	-	-	24,20%	49,65	-	-	56,01	-	105,66	425,66	-	-	425,66	6,76	7,1	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	340	-	-	-	24,20%	52,75	-	-	59,51	-	112,26	452,26	-	-	452,26	7,4	7,54	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	360	-	-	-	24,20%	55,86	-	-	63,01	-	118,87	478,87	-	-	478,87	7,46	7,99	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	380	-	-	-	24,20%	58,96	-	-	66,51	-	125,47	505,47	-	-	505,47	8,1	8,43	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	400	-	-	-	24,20%	62,06	-	-	70,01	-	132,07	532,07	-	-	532,07	8,74	8,87	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	420	-	-	-	24,20%	65,17	-	-	73,51	-	138,68	558,68	-	-	558,68	8,8	9,32	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	440	-	-	-	24,20%	68,27	-	-	77,01	-	145,28	585,28	-	-	585,28	9,44	9,76	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	460	-	-	-	24,20%	71,37	-	-	80,52	-	151,89	611,89	-	-	611,89	10,09	10,2	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	480	-	-	-	24,20%	74,47	-	-	84,02	-	158,49	638,49	-	-	638,49	10,14	10,65	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	500	-	-	-	24,20%	77,58	-	-	87,51	-	165,09	665,09	-	-	665,09	10,78	11,09	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	520	-	-	-	24,20%	80,68	-	-	91,02	-	171,7	691,7	-	-	691,7	11,43	11,53	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	540	-	-	-	24,20%	83,78	-	-	94,52	-	178,3	718,3	-	-	718,3	11,48	11,98	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	560	-	-	-	24,20%	86,89	-	-	98,01	-	184,9	744,9	-	-	744,9	12,12	12,42	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	580	-	-	-	24,20%	89,99	-	-	101,52	-	191,51	771,51	-	-	771,51	12,77	12,86	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	600	-	-	-	24,20%	93,09	-	-	105,02	-	198,11	798,11	-	-	798,11	12,82	13,31	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	620	-	-	-	24,20%	96,2	-	-	108,52	-	204,72	824,72	-	-	824,72	13,47	13,75	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	640	-	-	-	24,20%	99,3	-	-	112,02	-	211,32	851,32	-	-	851,32	14,11	14,19	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	660	-	-	-	24,20%	102,4	-	-	115,52	-	217,92	877,92	-	-	877,92	14,16	14,64	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	680	-	-	-	24,20%	105,51	-	-	119,02	-	224,53	904,53	-	-	904,53	14,81	15,08	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	700	-	-	-	24,20%	108,61	-	-	122,52	-	231,13	931,13	-	-	931,13	15,45	15,52	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	720	-	-	-	24,20%	111,71	-	-	126,02	-	237,73	957,73	-	-	957,73	15,5	15,97	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	740	-	-	-	24,20%	114,82	-	-	129,52	-	244,34	984,34	-	-	984,34	16,15	16,41	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	760	-	-	-	24,20%	117,92	-	-	133,02	-	250,94	1 010,94	-	-	1 010,94	16,79	16,85	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	780	-	-	-	24,20%	121,02	-	-	136,52	-	257,54	1 037,54	-	-	1 037,54	16,84	17,3	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	800	-	-	-	24,20%	124,12	-	-	140,03	-	264,15	1 064,15	-	-	1 064,15	17,49	17,74	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	820	-	-	-	24,20%	127,23	-	-	143,52	-	270,75	1 090,75	-	-	1 090,75	18,13	18,18	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	840	-	-	-	24,20%	130,33	-	-	147,03	-	277,36	1 117,36	-	-	1 117,36	18,19	18,63	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	860	-	-	-	24,20%	133,43	-	-	150,53	-	283,96	1 143,96	-	-	1 143,96	18,83	19,07	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	880	-	-	-	24,20%	136,53	-	-	154,03	-	290,56	1 170,56	-	-	1 170,56	19,47	19,51	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	900	-	-	-	24,20%	139,64	-	-	157,53	-	297,17	1 197,17	-	-	1 197,17	19,53	19,96	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	920	-	-	-	24,20%	142,74	-	-	161,03	-	303,77	1 223,77	-	-	1 223,77	20,17	20,4	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	940	-	-	-	24,20%	145,84	-	-	164,53	-	310,37	1 250,37	-	-	1 250,37	20,81	20,84	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	960	-	-	-	24,20%	148,95	-	-	168,03	-	316,98	1 276,98	-	-	1 276,98	20,87	21,29	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	980	-	-	-	24,20%	152,05	-	-	171,53	-	323,58	1 303,58	-	-	1 303,58	21,51	21,73	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1000	-	-	-	24,20%	155,16	-	-	175,03	-	330,19	1 330,19	-	-	1 330,19	22,16	22,17	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1020	-	-	-	24,20%	158,26	-	-	178,53	-	336,79	1 356,79	-	-	1 356,79	22,21	22,62	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1040	-	-	-	24,20%	161,36	-	-	182,03	-	343,39	1 383,39	-	-	1 383,39	22,85	23,06	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1060	-	-	-	24,20%	164,47	-	-	185,53	-	350	1 410,00	-	-	1 410,00	23,5	23,5	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1080	-	-	-	24,20%	167,57	-	-	189,03	-	356,6	1 436,60	-	-	1 436,60	23,55	23,95	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1100	-	-	-	24,20%	170,67	-	-	192,53	-	363,2	1 463,20	-	-	1 463,20	24,19	24,39	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1120	-	-	-	24,20%	173,77	-	-	196,04	-	369,81	1 489,81	-	-	1 489,81	24,25	24,84	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1140	-	-	-	24,20%	176,88	-	-	199,53	-	376,41	1 516,41	-	-	1 516,41	24,89	25,28	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1160	-	-	-	24,20%	179,98	-	-	203,04	-	383,02	1 543,02	-	-	1 543,02	25,54	25,72	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1180	-	-	-	24,20%	183,08	-	-	206,54	-	389,62	1 569,62	-	-	1 569,62	25,59	26,17	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1200	-	-	-	24,20%	186,18	-	-	210,04	-	396,22	1 596,22	-	-	1 596,22	26,23	26,61	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1220	-	-	-	24,20%	189,29	-	-	213,54	-	402,83	1 622,83	-	-	1 622,83	26,88	27,05	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1240	-	-	-	24,20%	192,39	-	-	217,04	-	409,43	1 649,43	-	-	1 649,43	26,93	27,5	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1260	-	-	-	24,20%	195,49	-	-	220,54	-	416,03	1 676,03	-	-	1 676,03	27,57	27,94	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1280	-	-	-	24,20%	198,6	-	-	224,04	-	422,64	1 702,64	-	-	1 702,64	28,22	28,38	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1300	-	-	-	24,20%	201,7	-	-	227,54	-	429,24	1 729,24	-	-	1 729,24	28,27	28,83	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1320	-	-	-	24,20%	204,8	-	-	231,04	-	435,84	1 755,84	-	-	1 755,84	28,91	29,27	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1340	-	-	-	24,20%	207,91	-	-	234,54	-	442,45	1 782,45	-	-	1 782,45	29,56	29,71	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1360	-	-	-	24,20%	211,01	-	-	238,04	-	449,05	1 809,05	-	-	1 809,05	29,61	30,16	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1380	-	-	-	24,20%	214,12	-	-	241,54	-	455,66	1 835,66	-	-	1 835,66	30,26	30,6	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1400	-	-	-	24,20%	217,22	-	-	245,04	-	462,26	1 862,26	-	-	1 862,26	30,9	31,04	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1420	-	-	-	24,20%	220,32	-	-	248,54	-	468,86	1 888,86	-	-	1 888,86	30,95	31,49	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1440	-	-	-	24,20%	223,42	-	-	252,05	-	475,47	1 915,47	-	-	1 915,47	31,6	31,93	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1460	-	-	-	24,20%	226,53	-	-	255,54	-	482,07	1 942,07	-	-	1 942,07	32,24	32,37	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1480	-	-	-	24,20%	229,63	-	-	259,04	-	488,67	1 968,67	-	-	1 968,67	32,29	32,82	44,06%
SK	1	60	Loan without Komfort service	160	1500	€	1500	-	-	-	24,20%	232,73	-	-	262,55	-	495,28	1 995,28	-	-	1 995,28	32,94	33,26	44,06%
SK	1	100	Loan without Komfort service	600	2300	€	600	-	-	-	21,50%	142,62	-	-	159,21	-	301,83	901,83	-	-	901,83	8,85	9,02	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	650	-	-	-	21,50%	154,51	-	-	172,48	-	326,99	976,99	-	-	976,99	9,76	9,77	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	700	-	-	-	21,50%	166,4	-	-	185,74	-	352,14	1052,14	-	-	1052,14	9,67	10,53	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	750	-	-	-	21,50%	178,28	-	-	199,01	-	377,29	1127,29	-	-	1127,29	10,57	11,28	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	800	-	-	-	21,50%	190,16	-	-	212,28	-	402,44	1202,44	-	-	1202,44	11,47	12,03	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	850	-	-	-	21,50%	202,05	-	-	225,55	-	427,6	1277,6	-	-	1277,6	12,38	12,78	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	900	-	-	-	21,50%	213,94	-	-	238,81	-	452,75	1352,75	-	-	1352,75	13,28	13,53	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	950	-	-	-	21,50%	225,82	-	-	252,08	-	477,9	1427,9	-	-	1427,9	14,18	14,28	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1000	-	-	-	21,50%	237,7	-	-	265,35	-	503,05	1503,05	-	-	1503,05	14,09	15,04	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1050	-	-	-	21,50%	249,59	-	-	278,62	-	528,21	1578,21	-	-	1578,21	15	15,79	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1100	-	-	-	21,50%	261,48	-	-	291,88	-	553,36	1653,36	-	-	1653,36	15,9	16,54	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1150	-	-	-	21,50%	273,36	-	-	305,15	-	578,51	1728,51	-	-	1728,51	16,8	17,29	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1200	-	-	-	21,50%	285,25	-	-	318,42	-	603,67	1803,67	-	-	1803,67	17,71	18,04	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1250	-	-	-	21,50%	297,13	-	-	331,69	-	628,82	1878,82	-	-	1878,82	18,61	18,79	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1300	-	-	-	21,50%	309,02	-	-	344,95	-	653,97	1953,97	-	-	1953,97	19,51	19,54	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1350	-	-	-	21,50%	320,9	-	-	358,22	-	679,12	2029,12	-	-	2029,12	19,42	20,3	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1400	-	-	-	21,50%	332,79	-	-	371,49	-	704,28	2104,28	-	-	2104,28	20,33	21,05	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1450	-	-	-	21,50%	344,68	-	-	384,75	-	729,43	2179,43	-	-	2179,43	21,23	21,8	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1500	-	-	-	21,50%	356,56	-	-	398,02	-	754,58	2254,58	-	-	2254,58	22,13	22,55	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1550	-	-	-	21,50%	368,45	-	-	411,29	-	779,74	2329,74	-	-	2329,74	23,04	23,3	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1600	-	-	-	21,50%	380,33	-	-	424,56	-	804,89	2404,89	-	-	2404,89	23,94	24,05	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1650	-	-	-	21,50%	392,22	-	-	437,82	-	830,04	2480,04	-	-	2480,04	23,85	24,81	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1700	-	-	-	21,50%	404,1	-	-	451,09	-	855,19	2555,19	-	-	2555,19	24,75	25,56	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1750	-	-	-	21,50%	415,99	-	-	464,36	-	880,35	2630,35	-	-	2630,35	25,66	26,31	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1800	-	-	-	21,50%	427,87	-	-	477,63	-	905,5	2705,5	-	-	2705,5	26,56	27,06	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1850	-	-	-	21,50%	439,76	-	-	490,89	-	930,65	2780,65	-	-	2780,65	27,46	27,81	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1900	-	-	-	21,50%	451,64	-	-	504,16	-	955,8	2855,8	-	-	2855,8	28,36	28,56	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	1950	-	-	-	21,50%	463,53	-	-	517,43	-	980,96	2930,96	-	-	2930,96	29,27	29,31	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	2000	-	-	-	21,50%	475,41	-	-	530,7	-	1006,11	3006,11	-	-	3006,11	29,18	30,07	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	2050	-	-	-	21,50%	487,3	-	-	543,96	-	1031,26	3081,26	-	-	3081,26	30,08	30,82	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	2100	-	-	-	21,50%	499,19	-	-	557,23	-	1056,42	3156,42	-	-	3156,42	30,99	31,57	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	2150	-	-	-	21,50%	511,07	-	-	570,5	-	1081,57	3231,57	-	-	3231,57	31,89	32,32	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	2200	-	-	-	21,50%	522,96	-	-	583,76	-	1106,72	3306,72	-	-	3306,72	32,79	33,07	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	2250	-	-	-	21,50%	534,84	-	-	597,03	-	1131,87	3381,87	-	-	3381,87	33,69	33,82	57,17%
SK	1	100	Loan without Komfort service	600	2300	€	2300	-	-	-	21,50%	546,73	-	-	610,3	-	1157,03	3457,03	-	-	3457,03	33,61	34,58	57,17%
"""
  table: []
  loan_values: []
  constructor: ->
    @init_table()
  init_table: =>
    counter = 0
    @table_counter = []
    for row in @data.split("\n")
      columns = row.replace(/^\s+|\s+$/g, "").split("\t")
      if counter++ == 0
        @header = columns
      else
        loan_value = @get_value(columns, "IssueValue")
        period = @get_value(columns, "Period")
        type = @get_value(columns, "ProductType")
        if not @table[period]
          @table[period] = {}
        if not @table[period][loan_value]
          @table[period][loan_value] = {}
        if not @table[period][loan_value][type]
          @table[period][loan_value][type] = {}
        for column in @header
          # console.log period, loan_value, type, column
          @table[period][loan_value][type][column] = this.get_value(columns, column)
        @loan_values.push loan_value
    @loan_values = @loan_values.unique()
  get_value: (columns, name) ->
    value = columns[jQuery.inArray(name, @header)].replace(",", ".")
  #if value != "-"
  #  return parseFloat(value)
  #return value
  find_nearest_value: (loan_value, old_loan_value, loan_length_num) ->
    loan_length = ([60, 100])[loan_length_num]
    up_down = if (loan_value - old_loan_value) > 0 then 1 else -1
    for plus in [10, 20, 30, 40, 50]
      if @table[loan_length][loan_value + plus*(up_down)]
        return loan_value + plus*(up_down)

    return 0

  get_result_for_value: (loan_value, old_loan_value, with_service, loan_length_num) ->
    type = if with_service then "Loan with Komfort service" else "Loan without Komfort service"
    for count in [0..2]
      loan_length = ([60, 100])[loan_length_num]
      if @table[loan_length][loan_value]
        return @extend_result(@table[loan_length][loan_value][type])
      else if (nearest_value = @find_nearest_value(loan_value, old_loan_value, loan_length_num)) > 0
        return @extend_result(@table[loan_length][nearest_value][type])
      else
        if loan_value > old_loan_value
          loan_length_num += 1
        else
          loan_length_num -= 1

  get_result_for_length: (loan_value, with_service, loan_length_num, old_loan_length_num) ->
    type = if with_service then "Loan with Komfort service" else "Loan without Komfort service"
    loan_length = ([60, 100])[loan_length_num]
    if @table[loan_length][loan_value]
      return @table[loan_length][loan_value][type]
    else
      min_offset = Number.MAX_VALUE
      for key of @table[loan_length]
        key = parseInt(key, 10)
        if Math.abs(loan_value - key) < min_offset
          min_offset = Math.abs(loan_value - key)

      if @table[loan_length][loan_value + min_offset]
        return @extend_result(@table[loan_length][loan_value + min_offset][type])
      else
        return @extend_result(@table[loan_length][loan_value - min_offset][type])
  get_result_for: (loan_value, with_service) ->
    type = if with_service then "Loan with Komfort service" else "Loan without Komfort service"
    result = []
    for period in [60, 100]
      if @table[period][loan_value]
        result.push(@extend_result(@table[period][loan_value][type]))
      else
        loan_value_int = parseInt(loan_value, 10)
        for plus in [10, 20, 30, 40, 50]
          if @table[period][loan_value_int + plus]
            result.push(@extend_result(@table[period][loan_value_int + plus][type]))
            break

    return result
  extend_result: (result) ->
    result.tooltipFinalRate = "Posledná splátka: #{NumberFormat.format(parseFloat(result.FinalRate), 2)} €"
    result.tooltipServiceFee = "Garantovaná služba: #{NumberFormat.format(parseFloat(result.ServiceFee), 2)} €<br>Úrok: #{NumberFormat.format(parseFloat(result.Interest), 2)} €<br> Úroková sadzba: #{NumberFormat.format(parseFloat(result.AnnualInterestRate), 2)} %"

    return result
Ember.RadioButton = Ember.View.extend
  tagName : "input"
  type : "radio"
  attributeBindings : [ "name", "type", "value", "checked:checked:" ]
  click : ->
    @set("selection", this.$().val())
  checked : ( ->
    @get("value") == @get("selection")
  ).property()

Ember.ButtonGroupComponent = Ember.Component.extend({
  init: ->
    @_super()
    num = 0
    initialValue = parseInt(@get("initialValue"), 10)
    @set("buttonResult", [])
    for text in @get("buttonTexts")
      @set("resultValue", initialValue)
      @get("buttonResult").push
        value: num
        text: text
        isActive: (num == initialValue)
      num += 1
    @set("resultValue", @get("initialValue"))

  updateClass: ( ->
    index = parseInt(@get("resultValue"), 10)#changeIndex
    items = @get("buttonResult")
    num = 0
    items.forEach((item) ->
      if num == index
        Ember.set(item, "isActive", true)
      else
        Ember.set(item, "isActive", false)
      num += 1
    )
    #@set("resultValue", index)
  ).observes('resultValue')#changeIndex
  didInsertElement: ->
    this.$().find("input").hide()
});

Calc1 = Ember.Application.create
  rootElement: '#calculator1'

Calc1.ButtonGroupComponent = Ember.ButtonGroupComponent.extend()

Calc1.TooltipBoxController = Bootstrap.TooltipBoxController

Calc1.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render('calculator1')
    controller = @controllerFor('tooltip-box')
    @render "bs-tooltip-box",
      outlet: "bs-tooltip-box"
      controller: controller
      into: "calculator1"


Ember.Handlebars.helper('formatNumber', (value, options) ->
  NumberFormat.format(parseFloat(value), 2)
)
Ember.Handlebars.helper('withEuro', (value, options) ->
  if value == "-" then value else NumberFormat.format(parseFloat(value), 2) + " €"
)

Calc1.Calculator1View = Ember.View.extend
  calculatorUpdate: (value) ->
    this.set('controller.calculatorValue', value)
  didInsertElement: ->
    table = this.get('controller.tableData')
    @calculatorUpdate(0)
    $("#calc1input").on "click", ->
        $(this).select()
    $("#slider1").slider
      value: 0,
      min: 0,
      max: table.loan_values.length - 1,
      slide: (event, ui) =>
        @calculatorUpdate(ui.value)

Calc1.Calculator1Controller = Ember.ObjectController.extend
  loanFormTexts: ["so službou zabezpečenia splátok", "bez služby zabezpečenia splátok"]
  loanValue: null
  loanValueEuro: null
  updateEuro: ( ->
    @set("loanValueEuro", "" + @get("loanValue") + " €")
  ).observes("loanValue")
  calculatorValue: null
  isWithService: 0
  recalculate: ( ->
    table = @get("tableData")
    calc_value = @get("calculatorValue")
    with_service = parseInt(@get("isWithService"), 10) == 0
    loan_value = table.loan_values[calc_value]
    if $("#slider1").slider() != undefined
      $("#slider1").slider('value', calc_value)
    @set("loanValue", loan_value)
    results = table.get_result_for(loan_value, with_service)

    @set("resultData", results)
  ).observes('isWithService', "calculatorValue")
  resultData: null
  init: ->
    @set("tableData", new TableData())
  actions:
    doneEdit: ->
      new_value = parseInt(@get("loanValueEuro"), 10)
      nearest_index = null
      nearest_value = Number.MAX_VALUE
      for value, key in @tableData.loan_values
        offset = Math.abs(parseInt(value, 10) - new_value)
        if offset < nearest_value
          nearest_index = key
          nearest_value = offset
      @set("calculatorValue", nearest_index)
      @updateEuro()
      return false

Calc2 = Ember.Application.create
  rootElement: '#calculator2'

Calc2.ButtonGroupComponent = Ember.ButtonGroupComponent.extend()
Calc2.TooltipBoxController = Bootstrap.TooltipBoxController

Calc2.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render('calculator2')
    controller = @controllerFor('tooltip-box')
    @render "bs-tooltip-box",
      outlet: "bs-tooltip-box"
      controller: controller
      into: "calculator2"

Ember.Handlebars.helper('formatNumber', (value, options) ->
  NumberFormat.format(parseFloat(value), 2)
)
Ember.Handlebars.helper('withEuro', (value, options) ->
  if value == "-" then value else NumberFormat.format(parseFloat(value), 2) + " €"
)

Calc2.Calculator2View = Ember.View.extend
  sliderUpdate: (value) ->
    this.set('controller.sliderValue', value)
  didInsertElement: ->
    table = this.get('controller.tableData')
    @sliderUpdate(0)
    $("#calc2input").on "click", ->
      $(this).select()
    $("#slider2").slider
      value: 0,
      min: 0,
      max: table.loan_values.length - 1,
      slide: (event, ui) =>
        @sliderUpdate(ui.value)

Calc2.Calculator2Controller = Ember.ObjectController.extend
  sliderValue: null
  loanValue: null
  inputLoanValue: null
  resultData: null
  loanLength: 0
  isWithService: 0
  withServiceTexts: ["Áno", "Nie"]
  loanLengthTexts: ["60", "100"]
  updateLoanValue: ( ->
    value = @tableData.loan_values[@get("sliderValue")]
    @set("loanValue", value)
  ).observes("sliderValue")
  updateInputLoanValue: ( ->
    @set("inputLoanValue", "" + @get("loanValue") + " €")
  ).observes("loanValue")
  recalculateInit: ->
    @with_service = parseInt(@get("isWithService"), 10) == 0
    @loan_value = parseInt(@get("loanValue"), 10) || 0
    @loan_length = parseInt(@get("loanLength"), 10) || 0
  recalculateByLengthBefore: ( ->
    @old_loan_length = parseInt(@get("loanLength"), 10) || 0
  ).observesBefore("loanLength")
  recalculateByLength: ( ->
    @recalculateInit()
    result = @tableData.get_result_for_length(@loan_value, @with_service, @loan_length, @old_loan_length)
    @recalculateUpdate(result)
  ).observes('isWithService', "loanLength")
  recalculateByValueBefore: ( ->
    @old_loan_value = parseInt(@get("loanValue"), 10) || 0
  ).observesBefore("loanValue")
  recalculateByValue: ( ->
    @recalculateInit()
    result = @tableData.get_result_for_value(@loan_value, @old_loan_value, @with_service, @loan_length)
    @recalculateUpdate(result)
  ).observes("loanValue")
  recalculateUpdate: (result) ->
    slider_value = @tableData.loan_values.indexOf(result.IssueValue)
    if $("#slider2").slider() != undefined
      $("#slider2").slider('value', slider_value)

    loan_length = switch result.Period
      when "60" then 0
      when "100" then 1
    @set("loanLength", loan_length)
    @set("loanValue", result.IssueValue)
    result.tooltipFinalRate = "Posledná splátka: #{NumberFormat.format(parseFloat(result.FinalRate), 2)} €"
    result.tooltipServiceFee = "Garantovaná služba: #{NumberFormat.format(parseFloat(result.ServiceFee), 2)} €<br>Úrok: #{NumberFormat.format(parseFloat(result.Interest), 2)} €<br> Úroková sadzba: #{NumberFormat.format(parseFloat(result.AnnualInterestRate), 2)} %"
    @set("resultData", [result])
  init: ->
    @tableData = new TableData()
  actions:
    doneEdit: ->
      new_value = parseInt(@get("inputLoanValue"), 10)
      nearest_index = null
      nearest_value = Number.MAX_VALUE
      for value, key in @tableData.loan_values
        offset = Math.abs(parseInt(value, 10) - new_value)
        if offset < nearest_value
          nearest_index = key
          nearest_value = offset
      @set("sliderValue", nearest_index)
      @updateInputLoanValue()
      return false
