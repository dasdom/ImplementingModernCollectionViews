/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Controller object that manages our Mountains and allows for searches
*/

import Foundation

let mountainsRawData = """
Mount Everest,8848
K2,8611
Kangchenjunga,8586
Lhotse,8516
Makalu,8485
Cho Oyu,8201
Dhaulagiri,8167
Manaslu,8163
Nanga Parbat,8126
Annapurna,8091
Gasherbrum I,8080
Broad Peak,8051
Gasherbrum II,8035
Shishapangma,8027
Gasherbrum III,7952
Gyachung Kang,7952
Annapurna II,7937
Gasherbrum IV,7932
Himalchuli,7893
Distaghil Sar,7885
Ngadi Chuli,7871
Nuptse,7861
Khunyang Chhish,7852
Masherbrum,7821
Nanda Devi,7816
Chomo Lonzo,7804
Batura Sar,7795
Kanjut Sar,7790
Rakaposhi,7788
Namcha Barwa,7782
Kamet,7756
Saltoro Kangri,7742
Jannu,7710
Tirich Mir,7708
Molamenqing,7703
Gurla Mandhata,7694
Saser Kangri,7672
Chogolisa,7665
Kongur Tagh,7649
Shispare,7611
Silberzacken,7597
Changtse,7583
Trivor,7577
Gangkhar Puensum,7570
Gongga Shan,7556
Annapurna III,7555
Kula Kangri,7554
Muztagh Ata,7546
Skyang Kangri,7545
Liankang Kangri,7535
Yukshin Gardan Sar,7530
Annapurna IV,7525
Mamostong Kangri,7516
Ismoil Somoni Peak,7495
Noshaq,7492
Pumari Chhish,7492
Passu Sar,7476
Malubiting,7458
Gangapurna,7455
Muchu Chhish (Batura V),7453
Jengish Chokusu,7439
K12,7428
Sia Kangri,7422
Istor-o-Nal,7403
Ghent Kangri,7401
Haramosh Peak,7397
Kabru,7394
Ultar,7388
Rimo I,7385
Sherpi Kangri,7380
Labuche Kang,7367
Kirat Chuli,7365
Skil Brum,7360
Gimmigela Chuli,7350
Bojohagur Duanasir,7329
Chamlang,7319
Jomolhari / Chomolhari,7314
Baltoro Kangri,7312
Siguang Ri,7308
The Crown,7295
Gyala Peri,7294
Porong Ri,7292
Baintha Brakk,7285
Yutmaru Sar,7283
K6,7282
Kangpenqing,7281
Mana Peak,7272
Muztagh Tower,7273
Diran,7257
Apsarasas Kangri,7245
Langtang Lirung,7227
Khartaphu,7213
Tongshanjiabu,7207
Langtang Ri,7205
Kangphu Kang,7204
Annapurna South,7219
Melungtse,7181
Liushi Shan,7167
Baruntse,7162
Pumori,7161
Hardeol,7151
Gasherbrum V,7147
Latok I,7145
Nemjung,7140
Udren Zom,7140
Chaukhamba,7138
Nun Kun,7135
Tilicho Peak,7134
Gauri Sankar,7134
Lenin Peak,7134
Api,7132
Pauhunri,7128
Trisul,7120
Korzhenevskaya,7105
Lunpo Gangri,7095
Satopanth,7075
Tirsuli,7074
Dunagiri,7066
Kangto,7060
Nyegyi Kansang,7047
Link Sar,7041
Kezhen Peak,7038
Shah Dhar,7038
Spantik,7027
Khan Tengri,7010
Machapuchare,6993
Laila Peak (Haramosh Valley),6985
Kang Guru,6981
Gasherbrum VI,6979
Karun Kuh,6977
Avicenna Peak,6974
Ulugh Muztagh,6973
Aconcagua,6962
Napko Kangri,6956
Kedarnath,6940
K7,6934
Panchchuli,6904
Thalay Sagar,6904
Lunkho e Dosare,6901
Lunag Ri,6895
Ojos del Salado,6891
Siniolchu,6888
Kanjiroba,6883
Bairiga,6882
Koyo Zom,6872
Nanda Kot,6861
Kubi Gangri,6859
Angel Sar,6858
Bhagirathi I,6856
Jethi Bahurani,6850
Chongra Peak,6830
Reo Purgyil,6816
Ama Dablam,6812
Monte Pissis,6795
Biarchedi,6781
Huascarán Sur,6768
Cerro Bonete,6759
Nevado Tres Cruces,6748
Kawagarbo,6740
Llullaillaco,6739
Cho Polu,6735
Kangju Kangri,6725
Changla,6721
Mercedario,6720
Mount Pandim,6691
Num Ri,6677
Lungser Kangri,6666
Meru Peak,6660
Gul Lasht Zom,6657
Huascarán Norte,6655
Khumbutse,6640
Mount Kailash,6638
Yerupajá,6635
Nevado Tres Cruces Central,6629
Thamserku,6623
Geladaindong Peak,6621
Incahuasi,6621
Pangpoche,6620
Manirang,6597
Nilkantha,6596
Phuparash Peak,6574
Sickle Moon Peak,6574
Buni Zom,6542
Nevado Sajama,6542
Ghamubar Zom,6518
Singu Chuli,6501
Taboche,6501
Cerro El Muerto,6488
Mera Peak,6476
Hiunchuli,6441
Cholatse,6440
Illimani,6438
Ancohuma,6427
Coropuna,6425
Antofalla,6409
Kang Yatze,6400
Huandoy,6395
Ausangate,6384
Illampu,6368
Kusum Kangguru,6367
Kinnaur Kailash,6349
Parinaquta,6348
Siula Grande,6344
Bamba Dhura,6334
Ampato,6288
Amne Machin,6282
Pomerape,6282
Salcantay,6271
Chimborazo,6267
Mount Siguniang,6250
Grid Nie Mountain,6224
Yuzhu Peak,6224
Genyen Massif,6204
Kongde Ri,6187
Aucanquilcha,6176
Imja Tse,6189
Denali (Mt. McKinley),6168
Stok Kangri,6137
Lobuche,6119
Marmolejo,6108
Laila Peak (Hushe Valley),6096
Pisang Peak,6091
Huayna Potosí,6088
Aracar,6082
Chachakumani,6074
Chachani,6057
Mianzimu,6054
Acotango,6052
Socompa,6051
Acamarachi,6046
Shayaz,6026
Hualca Hualca,6025
Uturunku,6020
Mitre Peak,6010
Laila Peak,5971
Mount Logan,5959
Alpamayo,5947
Cerro Lípez,5929
Licancabur,5920
Falak Sar,5918
Cotopaxi,5897
Mount Kilimanjaro,5895
Hkakabo Razi,5881
San José,5856
El Misti,5822
Altun Shan,5798
Cayambe,5790
Pico Cristóbal Colón,5776
Antisana,5753
Nevado Pisco,5752
Nevado Anallajsi,5750
Pokalde,5745
Ubinas,5672
Pichu Pichu,5664
Mount Elbrus,5642
Mehrbani Peak,5639
Pico de Orizaba,5636
Mount Damavand,5610
Nevado Mismi,5597
Jade Dragon Snow Mountain,5596
Lascar Volcano,5592
Mount Xuebaoding,5588
Kala Patthar,5545
Mount Saint Elias,5489
Concord Peak,5469
Machoi Peak,5458
El Plomo,5450
Bogda Feng,5445
Mount Little Xuebaoding,5443
Cerro El Plomo,5434
Popocatépetl,5426
Kolahoi Peak,5425
Chacaltaya,5421
Mount Pomiu,5413
Ritacuba Blanco,5410
Haba Xueshan,5396
Nevado del Ruiz,5389
Nevado del Huila,5364
El Altar,5320
Mount Foraker,5304
Mount Haramukh,5300
Nevado del Tolima,5276
Maipo,5264
Illiniza,5248
Sirbal Peak,5236
Sangay,5230
Iztaccíhuatl,5230
Mount Lucania,5226
Dykh-Tau,5205
Shkhara,5201
Mount Kenya,5199
Malika Parbat,5190
Amarnath Peak,5186
King Peak,5173
Boris Yeltsin Peak,5168
Koshtan-Tau,5150
Mount Ararat,5137
Mount Stanley,5109
Mount Steele,5073
Janga,5051
Mount Kazbek,5047
Tungurahua,5023
Carihuairazo,5018
Mount Bona,5005
Mount Blackburn,4996
Pico Bolívar,4981
Pik Talgar,4979
Shota Rustaveli Peak,4960
Gunshar,4950
Mount Sanford,4949
Pico Humboldt,4940
Vinson Massif,4892
Pico Bonpland,4890
Puncak Jaya,4884
Pico La Concha,4870
Gistola,4860
Tetnuldi,4858
Mount Tyree,4852
Huaynaputina,4850
Alam Kuh,4850
Mount Wood,4842
Mount Vancouver,4812
Sabalan,4811
Mont Blanc,4810
Corazón,4790
Pichincha,4784
Jimara,4780
Mount Churchill,4766
Puncak Mandala,4760
Klyuchevskaya Sopka,4750
Puncak Trikora,4750
Mont Blanc de Courmayeur,4748
Sunset Peak,4745
Mount Slaggard,4742
Pico Piedras Blancas,4740
Pico El Toro,4730
Tatakooti Peak,4725
Rumiñahui,4721
Pico El Leon,4720
Ushba,4710
Volcán Domuyo,4709
Pico Los Nevados,4700
Pico Pan de Azucar,4680
Naltar Peak,4678
Mount Fairweather,4663
Pico Mucuñuque,4660
Pico El Buitre,4650
Khazret Sultan,4643
Sierra Negra,4640
Dufourspitze (Monte Rosa),4634
Dunantspitze (Monte Rosa),4632
Nordend (Monte Rosa),4609
Mount Hubbard,4577
Nevado de Toluca,4577
Mount Meru,4566
Zumsteinspitze (Monte Rosa),4563
Signalkuppe (Monte Rosa),4554
Dom,4545
Ras Dashen,4533
Eastern Liskamm (Lyskamm),4527
Mount Bear,4521
Mount Wilhelm,4509
Mount Karisimbi,4507
Mount Walsh,4507
Belukha Mountain,4506
Weisshorn,4506
Tebulosmta,4493
Täschhorn,4491
Bazarduzu Dagi,4485
Matterhorn,4478
Mount Rutford,4477
Mont Maudit,4465
Babis Mta,4454
Mount Shani,4451
Dena,4448
Vladimir Putin Peak,4446
Mount Hunter,4442
Parrotspitze (Monte Rosa),4432
Mount Whitney,4421
Mount Alverstone,4420
University Peak,4411
Aello Peak,4403
Mount Elbert,4402
Mount Massive,4395
Mount Harvard,4395
Mount Rainier,4392
Kholeno,4387
"""
