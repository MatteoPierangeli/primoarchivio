UE UFO Sightings
================
Matteo Pierangeli
2022-10-04

# Introduction

This analysis was based [on this
study](https://www.kaggle.com/code/allisonphan/ufo-sightings-data-analysis-project#Data-Summary-Tables).
My purpose was to practise since it is the second analysis I have
carried out in my entire life. I take this opportunity to thank Allison
Phan for her study. Reworking her code has been very useful for my
training. I recommend all beginners to use it if they want to practise.
I will not put all the code, as I simply copied and used his. What I
have changed is simply the code in which the differences between US,
Mexico and Canada are shown. I have replaced the latter with an analysis
of the countries of the European Union. So the first part of the code
you will see will simply be all the code copied. From there on it is the
code on the European Countries. Even in the latter case, I reused the
code that was used for Mexico, canada and the US.

# Copied Code

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.3.6      ✔ purrr   0.3.4 
    ## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
    ## ✔ tidyr   1.2.0      ✔ stringr 1.4.1 
    ## ✔ readr   2.1.2      ✔ forcats 0.5.2 
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## 
    ## Caricamento pacchetto: 'lubridate'
    ## 
    ## 
    ## I seguenti oggetti sono mascherati da 'package:base':
    ## 
    ##     date, intersect, setdiff, union
    ## 
    ## 
    ## 
    ## Caricamento pacchetto: 'scales'
    ## 
    ## 
    ## Il seguente oggetto è mascherato da 'package:purrr':
    ## 
    ##     discard
    ## 
    ## 
    ## Il seguente oggetto è mascherato da 'package:readr':
    ## 
    ##     col_factor
    ## 
    ## 
    ## Caricamento del pacchetto richiesto: MASS
    ## 
    ## 
    ## Caricamento pacchetto: 'MASS'
    ## 
    ## 
    ## Il seguente oggetto è mascherato da 'package:dplyr':
    ## 
    ##     select
    ## 
    ## 
    ## Caricamento del pacchetto richiesto: minpack.lm
    ## 
    ## Caricamento del pacchetto richiesto: rgl
    ## 
    ## Caricamento del pacchetto richiesto: robustbase
    ## 
    ## Caricamento del pacchetto richiesto: Matrix
    ## 
    ## 
    ## Caricamento pacchetto: 'Matrix'
    ## 
    ## 
    ## I seguenti oggetti sono mascherati da 'package:tidyr':
    ## 
    ##     expand, pack, unpack
    ## 
    ## 
    ## 
    ## Caricamento pacchetto: 'data.table'
    ## 
    ## 
    ## I seguenti oggetti sono mascherati da 'package:lubridate':
    ## 
    ##     hour, isoweek, mday, minute, month, quarter, second, wday, week,
    ##     yday, year
    ## 
    ## 
    ## I seguenti oggetti sono mascherati da 'package:dplyr':
    ## 
    ##     between, first, last
    ## 
    ## 
    ## Il seguente oggetto è mascherato da 'package:purrr':
    ## 
    ##     transpose

    ## [1] 0

    ##                         city count
    ## 1  sault ste. marie (canada)    12
    ## 2           ontario (canada)     7
    ## 3       quebec city (canada)     6
    ## 4                     canada     5
    ## 5             yukon (canada)     5
    ## 6      mount albert (canada)     4
    ## 7           vaughan (canada)     4
    ## 8           alberta (canada)     3
    ## 9           corunna (canada)     3
    ## 10        kirkfield (canada)     3
    ## 11          newbury (canada)     3
    ## 12  sault ste marie (canada)     3
    ## 13   walpole island (canada)     3
    ## 14         whistler (canada)     3

    ##             datetime
    ## 1   10/11/2004 10:00
    ## 2   10/21/2004 23:30
    ## 3   10/21/2011 22:30
    ## 4   10/23/2003 00:10
    ## 5   10/25/2008 19:30
    ## 6   10/25/2013 11:11
    ## 7   10/29/2010 20:20
    ## 8   10/29/2010 20:20
    ## 9   10/29/2011 23:40
    ## 10   10/6/2008 20:00
    ## 11   11/1/2005 18:00
    ## 12  11/13/1999 20:00
    ## 13  11/15/1998 12:00
    ## 14  11/15/1998 15:30
    ## 15  11/15/2002 07:30
    ## 16  11/16/1999 18:00
    ## 17  11/16/2004 17:05
    ## 18  11/16/2006 23:00
    ## 19  11/16/2007 19:49
    ## 20  11/17/1989 07:30
    ## 21  11/18/2006 10:30
    ## 22  11/19/2003 09:00
    ## 23    1/1/2001 00:01
    ## 24    1/1/2002 00:10
    ## 25    1/1/2005 00:30
    ## 26    1/1/2005 06:51
    ## 27    1/1/2007 01:00
    ## 28    1/1/2007 17:45
    ## 29    1/1/2008 00:45
    ## 30    1/1/2009 00:25
    ## 31    1/1/2010 19:00
    ## 32  11/20/2005 20:00
    ## 33  11/20/2005 22:00
    ## 34  11/21/2012 09:30
    ## 35   11/2/2010 18:50
    ## 36  11/22/2013 19:30
    ## 37  11/23/2004 19:00
    ## 38  11/26/2003 17:00
    ## 39  11/28/2005 09:10
    ## 40   1/13/2011 17:31
    ## 41   1/13/2013 00:10
    ## 42   1/17/2004 10:35
    ## 43   1/18/2008 20:00
    ## 44   1/19/1995 22:00
    ## 45   11/9/2004 03:30
    ## 46   1/19/2006 23:15
    ## 47   11/9/2013 18:45
    ## 48  12/10/1978 01:00
    ## 49   12/1/1991 22:00
    ## 50   12/1/2001 21:10
    ## 51   12/1/2006 22:00
    ## 52   1/21/2012 20:00
    ## 53  12/16/2006 21:00
    ## 54  12/19/2008 22:25
    ## 55  12/20/1977 21:00
    ## 56  12/20/1980 23:00
    ## 57  12/20/2006 20:20
    ## 58   12/2/2003 21:00
    ## 59   12/2/2005 19:37
    ## 60   12/2/2007 22:00
    ## 61  12/23/2000 19:00
    ## 62  12/23/2007 04:00
    ## 63  12/24/2002 04:00
    ## 64  12/24/2004 23:00
    ## 65  12/24/2013 21:30
    ## 66  12/24/2013 21:30
    ## 67  12/25/1978 21:30
    ## 68  12/25/2000 00:00
    ## 69  12/31/2005 21:30
    ## 70   12/4/1994 11:00
    ## 71   12/4/2002 01:00
    ## 72   12/4/2011 06:25
    ## 73   12/5/1998 19:00
    ## 74   12/6/2013 12:10
    ## 75   12/8/2000 19:00
    ## 76   1/29/2002 20:00
    ## 77    1/6/2008 02:10
    ## 78    1/9/1999 02:39
    ## 79    1/9/1999 22:00
    ## 80   2/10/2003 17:00
    ## 81    2/1/2006 22:50
    ## 82   2/12/2004 21:00
    ## 83   2/14/1999 17:00
    ## 84   2/14/2004 04:00
    ## 85   2/15/2000 23:00
    ## 86   2/16/1984 23:00
    ## 87   2/17/2007 17:00
    ## 88   2/20/2014 20:00
    ## 89    2/2/2006 18:30
    ## 90    2/2/2008 01:53
    ## 91   2/28/1999 22:00
    ## 92    2/3/2005 14:00
    ## 93    2/3/2008 21:45
    ## 94    2/5/2002 23:30
    ## 95    2/6/2007 21:00
    ## 96    2/7/1980 00:00
    ## 97    2/8/2008 20:40
    ## 98    2/9/2008 14:08
    ## 99    2/9/2012 19:50
    ## 100   2/9/2012 23:45
    ## 101  3/10/2005 18:34
    ## 102   3/1/2013 23:00
    ## 103  3/13/2002 18:30
    ## 104  3/13/2009 18:25
    ## 105  3/13/2014 04:00
    ## 106  3/14/2009 18:30
    ## 107  3/14/2013 09:09
    ## 108  3/15/1996 03:00
    ## 109  3/15/2009 20:15
    ## 110  3/18/2011 23:47
    ## 111  3/18/2014 19:30
    ## 112  3/20/2004 22:00
    ## 113  3/20/2012 17:48
    ## 114  3/21/1972 20:00
    ## 115  3/26/2011 09:35
    ## 116  3/27/2000 21:40
    ## 117  3/29/1996 15:00
    ## 118  3/31/2002 21:00
    ## 119  3/31/2002 21:00
    ## 120   3/3/2007 21:30
    ## 121   3/4/1999 21:00
    ## 122   3/5/2004 23:00
    ## 123   3/5/2004 24:00
    ## 124   3/5/2013 20:00
    ## 125   3/6/2006 16:00
    ## 126   3/7/2009 19:50
    ## 127   3/8/1993 19:35
    ## 128   3/8/1993 21:35
    ## 129   3/9/2011 03:00
    ## 130  4/10/2009 11:00
    ## 131  4/12/2000 20:30
    ## 132  4/15/1999 02:30
    ## 133  4/15/2013 20:00
    ## 134  4/16/2001 22:00
    ## 135  4/16/2014 22:03
    ## 136  4/17/2001 20:45
    ## 137  4/18/2004 02:00
    ## 138  4/19/2010 01:30
    ## 139  4/20/2002 11:00
    ## 140  4/20/2011 20:00
    ## 141  4/21/2007 23:00
    ## 142   4/2/2002 20:05
    ## 143  4/23/2006 12:06
    ## 144  4/24/2003 01:00
    ## 145  4/25/2001 19:00
    ## 146  4/26/2004 20:50
    ## 147  4/27/2000 21:00
    ## 148  4/28/2005 21:00
    ## 149  4/29/2005 23:30
    ## 150   4/3/2007 21:30
    ## 151   4/5/2010 19:00
    ## 152   4/6/1996 02:00
    ## 153   4/7/2007 09:30
    ## 154   4/7/2007 09:42
    ## 155   4/9/2008 23:30
    ## 156  5/10/2003 13:00
    ## 157   5/1/1996 12:00
    ## 158  5/13/1977 13:00
    ## 159  5/15/1996 00:00
    ## 160  5/15/1997 22:00
    ## 161  5/15/2009 21:00
    ## 162  5/17/2004 22:00
    ## 163  5/19/2004 21:00
    ## 164  5/25/2007 13:00
    ## 165  5/25/2012 21:40
    ## 166  5/26/2004 01:00
    ## 167  5/27/2000 00:30
    ## 168  5/30/2001 05:00
    ## 169   5/4/2012 24:00
    ## 170   5/7/2000 20:00
    ## 171   5/7/2005 21:00
    ## 172   5/7/2010 21:45
    ## 173   5/8/1994 22:00
    ## 174   5/9/2006 21:15
    ## 175  6/10/2001 23:00
    ## 176   6/1/1950 12:00
    ## 177   6/1/1960 17:00
    ## 178   6/1/1983 20:30
    ## 179   6/1/1985 18:00
    ## 180   6/1/1991 21:00
    ## 181   6/1/1994 21:30
    ## 182   6/1/1995 11:00
    ## 183  6/14/1999 22:30
    ## 184  6/15/1999 13:00
    ## 185  6/15/2000 14:00
    ## 186  6/16/2004 13:45
    ## 187  6/20/2007 21:50
    ## 188  6/21/2001 18:00
    ## 189  6/21/2011 18:00
    ## 190   6/2/2003 22:00
    ## 191  6/24/2000 23:00
    ## 192  6/26/2002 12:32
    ## 193  6/26/2006 21:30
    ## 194  6/27/2006 20:30
    ## 195  6/28/2009 22:15
    ## 196   6/3/2006 03:00
    ## 197   6/5/2004 21:00
    ## 198   6/6/2007 23:00
    ## 199   6/7/2006 14:36
    ## 200  7/10/1997 16:00
    ## 201   7/1/1965 20:00
    ## 202   7/1/1984 07:00
    ## 203  7/12/2013 23:00
    ## 204  7/15/1968 22:00
    ## 205  7/17/2002 22:00
    ## 206  7/20/2010 15:30
    ## 207   7/6/2003 16:05
    ## 208   7/6/2003 20:30
    ## 209   7/8/2002 23:15
    ## 210  8/11/2009 20:36
    ## 211   8/1/2003 00:15
    ## 212  8/12/1999 14:00
    ## 213  8/14/1996 22:00
    ## 214  8/15/1969 23:00
    ## 215  8/15/2011 20:15
    ## 216  8/18/2008 21:00
    ## 217  8/20/2006 16:34
    ## 218   8/2/2004 22:15
    ## 219  8/22/2012 19:00
    ## 220  8/23/1997 22:00
    ## 221  8/24/2002 19:15
    ## 222  8/24/2004 19:15
    ## 223  8/25/2002 13:00
    ## 224  8/25/2002 21:30
    ## 225  8/27/2005 10:00
    ## 226  8/31/2003 22:00
    ## 227  8/31/2008 17:00
    ## 228   8/3/2006 22:50
    ## 229   8/6/1959 20:30
    ## 230   8/7/2006 23:00
    ## 231  9/10/2003 15:30
    ## 232   9/1/1999 19:40
    ## 233   9/1/2002 20:30
    ## 234  9/13/2003 17:10
    ## 235  9/13/2003 17:25
    ## 236  9/15/1994 10:00
    ## 237  9/17/1999 04:00
    ## 238  9/18/2011 22:30
    ## 239  9/20/1996 23:30
    ## 240   9/2/2003 22:18
    ## 241   9/2/2012 01:20
    ## 242  9/22/2005 20:00
    ## 243  9/22/2005 21:00
    ## 244  9/22/2007 10:40
    ## 245   9/4/2005 04:00
    ## 246   9/5/2011 04:00
    ## 247   9/9/1999 23:00
    ##                                                               city state
    ## 1                                            nuevo laredo (mexico)  <NA>
    ## 2                                                 careyes (mexico)  <NA>
    ## 3                                       san jose del cabo (mexico)  <NA>
    ## 4                                         puerto vallarto (mexico)  <NA>
    ## 5                              san jose del cabo (baja&#44 mexico)  <NA>
    ## 6                                             mexico city (mexico)  <NA>
    ## 7                                                 morelia (mexico)  <NA>
    ## 8                                                 morelia (mexico)  <NA>
    ## 9                                                 tijuana (mexico)  <NA>
    ## 10                                             cuernavaca (mexico)  <NA>
    ## 11                                                tijuana (mexico)  <NA>
    ## 12                                                guaymas (mexico)  <NA>
    ## 13                            guadalajara zapopan jalisco (mexico)  <NA>
    ## 14                                               meztitla (mexico)  <NA>
    ## 15                                            mexico city (mexico)  <NA>
    ## 16                                        mexico (7 miles west of)    mo
    ## 17                                                jalisco (mexico)  <NA>
    ## 18                                                zapopan (mexico)  <NA>
    ## 19                                        sabinas hidalgo (mexico)  <NA>
    ## 20                                               ensenada (mexico)  <NA>
    ## 21             hermosillo/obregon city (between) (sonora) (mexico)  <NA>
    ## 22                                                   naco (mexico)    az
    ## 23                                              progresso (mexico)  <NA>
    ## 24                                                tijuana (mexico)  <NA>
    ## 25                                              monterrey (mexico)  <NA>
    ## 26                                              monterrey (mexico)  <NA>
    ## 27                                        puerto vallarta (mexico)  <NA>
    ## 28                                               ensanada (mexico)  <NA>
    ## 29                                        puerto escodido (mexico)  <NA>
    ## 30                                       puerto escondido (mexico)  <NA>
    ## 31                                              jilotepec (mexico)  <NA>
    ## 32                                  acapulco (guerrero&#44 mexico)  <NA>
    ## 33                                   algadonis (mexico) to tonopah    az
    ## 34                                   popocatepetl volcano (mexico)  <NA>
    ## 35                                                morelia (mexico)  <NA>
    ## 36                           quintana roo (secrets capri) (mexico)  <NA>
    ## 37                                        puerto vallarta (mexico)  <NA>
    ## 38                                                 cancun (mexico)  <NA>
    ## 39                                         guaymas sonora (mexico)    al
    ## 40                                          sea of cortez (mexico)  <NA>
    ## 41                                              monterrey (mexico)  <NA>
    ## 42                                           tijuana b.c. (mexico)  <NA>
    ## 43                              nuevo laredo (70km sw of) (mexico)  <NA>
    ## 44                                                 cancun (mexico)  <NA>
    ## 45                                        puerto vallarto (mexico)  <NA>
    ## 46                                         cabo san lucas (mexico)  <NA>
    ## 47                                                tijuana (mexico)  <NA>
    ## 48                                                          mexico    pa
    ## 49                                                reynosa (mexico)  <NA>
    ## 50                                        mazatl&aacute;n (mexico)  <NA>
    ## 51                             mexicali (baja california) (mexico)  <NA>
    ## 52                                        puerto vallarta (mexico)  <NA>
    ## 53                                guadalajara&#44 jalisco (mexico)  <NA>
    ## 54                           mexicali&#44 baja california (mexico)  <NA>
    ## 55                                                  uxmal (mexico)  <NA>
    ## 56                                            mexico city (mexico)  <NA>
    ## 57                                                 cancun (mexico)  <NA>
    ## 58                                                  tulum (mexico)  <NA>
    ## 59                                        puerto vallarta (mexico)  <NA>
    ## 60                                               huatulco (mexico)  <NA>
    ## 61                                              la madrid (mexico)  <NA>
    ## 62                    san jose del cabo (baja california) (mexico)  <NA>
    ## 63                                                 cancun (mexico)  <NA>
    ## 64                                              monterrey (mexico)  <NA>
    ## 65                                              monterrey (mexico)  <NA>
    ## 66                                                tijuana (mexico)  <NA>
    ## 67                                         cabo san lucas (mexico)  <NA>
    ## 68                                            tlaltenango (mexico)  <NA>
    ## 69                          san luis&#44 r.c. (mexico)/yuma&#44 az  <NA>
    ## 70                                 tampico&#44 tamaulipas (mexico)  <NA>
    ## 71          monterrey (mexico) (outside city&#44 on large highway)  <NA>
    ## 72                                              monterrey (mexico)  <NA>
    ## 73                                         valle de bravo (mexico)  <NA>
    ## 74                                        puerto vallarta (mexico)  <NA>
    ## 75                                      san jose del cabo (mexico)  <NA>
    ## 76                                              chihuahua (mexico)  <NA>
    ## 77                                            mexico city (mexico)  <NA>
    ## 78                                                tijuana (mexico)  <NA>
    ## 79                                                 cancun (mexico)  <NA>
    ## 80                                                    mexico beach    fl
    ## 81                                        puerto vallarta (mexico)  <NA>
    ## 82                                     cancun (yucatan&#44 mexico)  <NA>
    ## 83                                       mt. popocatepetl (mexico)  <NA>
    ## 84                                caribbean (in a cruise) (mexico)  <NA>
    ## 85                                                tijuana (mexico)  <NA>
    ## 86                                guadalajara&#44 jalisco (mexico)  <NA>
    ## 87                                               culiacan (mexico)  <NA>
    ## 88                                              queretaro (mexico)  <NA>
    ## 89                                        puerto vallarta (mexico)  <NA>
    ## 90                                  cancun (quintana roo) (mexico)  <NA>
    ## 91                                                 cancun (mexico)  <NA>
    ## 92                                                  tulum (mexico)  <NA>
    ## 93                                        puerto vallarta (mexico)  <NA>
    ## 94                                        san luis potosi (mexico)  <NA>
    ## 95                                                 cancun (mexico)  <NA>
    ## 96                                            mexico city (mexico)  <NA>
    ## 97                                        puerto vallarta (mexico)  <NA>
    ## 98                                  san carlos&#44 sonora (mexico)  <NA>
    ## 99                                       puerto escondido (mexico)  <NA>
    ## 100                                       puerto vallarta (mexico)  <NA>
    ## 101                                  la cholla&#44 sonora (mexico)  <NA>
    ## 102                                                 tepic (mexico)  <NA>
    ## 103                       puerto penasco/n. sea of cortez (mexico)  <NA>
    ## 104                                        northwest baja (mexico)  <NA>
    ## 105                             ensenada (baja california)(mexico)  <NA>
    ## 106                                                cancun (mexico)  <NA>
    ## 107                                           guadalajara (mexico)  <NA>
    ## 108                         san felipe (driving south to) (mexico)  <NA>
    ## 109                                 cancun (quintana roo) (mexico)  <NA>
    ## 110                                        cabo san lucas (mexico)  <NA>
    ## 111                             playa del carmen (yucatan)(mexico)  <NA>
    ## 112                                    bucerias (nayarit) (mexico)  <NA>
    ## 113                                       puerto vallarta (mexico)  <NA>
    ## 114                                               cozumel (mexico)  <NA>
    ## 115                                            punta mita (mexico)  <NA>
    ## 116                                                   mexico beach    fl
    ## 117                                           teotihuacan (mexico)  <NA>
    ## 118                                        puerto penasco (mexico)  <NA>
    ## 119                                        puerto penasco (mexico)  <NA>
    ## 120                                                cancun (mexico)  <NA>
    ## 121                                       puerto vallarto (mexico)  <NA>
    ## 122                                           mexico city (mexico)  <NA>
    ## 123                                           mexico city (mexico)  <NA>
    ## 124                                     san jose del cabo (mexico)  <NA>
    ## 125                                        cabo san lucas (mexico)  <NA>
    ## 126                                            hermosillo (mexico)  <NA>
    ## 127                                   san antonio del mar (mexico)  <NA>
    ## 128                                   san antonio del mar (mexico)  <NA>
    ## 129                                       san luis potosi (mexico)  <NA>
    ## 130                                           mexico city (mexico)  <NA>
    ## 131                         puerta del zapatero mazamitla (mexico)  <NA>
    ## 132                                  mexico city&#44 d.f. (mexico)  <NA>
    ## 133                                            mecapalapa (mexico)  <NA>
    ## 134                                                cancun (mexico)  <NA>
    ## 135                                    mexico (close to; on us 31)    in
    ## 136                                                cancun (mexico)  <NA>
    ## 137                                                cancun (mexico)  <NA>
    ## 138                                   progresso (yucatan) (mexico)  <NA>
    ## 139                                            cuernavaca (mexico)  <NA>
    ## 140                                               mexico (unknown)    va
    ## 141                                                cancun (mexico)  <NA>
    ## 142                             chiuahua (chiuahua state) (mexico)  <NA>
    ## 143                                   tulum (near cancun) (mexico)  <NA>
    ## 144                                                cancun (mexico)  <NA>
    ## 145                                            san felipe (mexico)  <NA>
    ## 146                                               tijuana (mexico)    mb
    ## 147                     san felipe&#44 baja de california (mexico)  <NA>
    ## 148                                            cuernavaca (mexico)  <NA>
    ## 149                                      playa del carmen (mexico)  <NA>
    ## 150                              mulege (baja california) (mexico)    ca
    ## 151                                                cancun (mexico)  <NA>
    ## 152                                              huatulco (mexico)  <NA>
    ## 153                                       puerto vallarta (mexico)  <NA>
    ## 154                                       puerto vallarta (mexico)  <NA>
    ## 155                                      playa del carmen (mexico)  <NA>
    ## 156                                              acambaro (mexico)  <NA>
    ## 157                                            la moncada (mexico)  <NA>
    ## 158                                        lake guadalupe (mexico)  <NA>
    ## 159                                       puerto vallarto (mexico)  <NA>
    ## 160                                              tehuacan (mexico)  <NA>
    ## 161                                       puerto vallarta (mexico)  <NA>
    ## 162                                       puerto vallarto (mexico)  <NA>
    ## 163                                           punta brava (mexico)  <NA>
    ## 164                                             monterrey (mexico)  <NA>
    ## 165                                                         mexico    mo
    ## 166                                                cancun (mexico)  <NA>
    ## 167                                                cancun (mexico)  <NA>
    ## 168                bahia de los angeles (baja california) (mexico)  <NA>
    ## 169                                                         mexico    ny
    ## 170                                              mazatlan (mexico)  <NA>
    ## 171                                    mexico city (d.f.) (mexico)  <NA>
    ## 172                          san felipe (baja california) (mexico)  <NA>
    ## 173                                             el ajusco (mexico)  <NA>
    ## 174                                                merida (mexico)  <NA>
    ## 175                                                cancun (mexico)  <NA>
    ## 176                                              mexicali (mexico)  <NA>
    ## 177                                 hermosillo&#44 sonora (mexico)  <NA>
    ## 178                                ciudad lazaro cardenas (mexico)  <NA>
    ## 179                                             michoacan (mexico)  <NA>
    ## 180                                           zihautinejo (mexico)  <NA>
    ## 181                                ensenada (baja calif.) (mexico)  <NA>
    ## 182                                         jalostotitlan (mexico)  <NA>
    ## 183                            san felipe (baja) (mexico) (mexico)  <NA>
    ## 184                                             chihuahua (mexico)  <NA>
    ## 185                                           mexico city (mexico)  <NA>
    ## 186                                             malinalco (mexico)  <NA>
    ## 187                                                         mexico    mo
    ## 188                                      mt. popocatepetl (mexico)  <NA>
    ## 189                                           mexico city (mexico)  <NA>
    ## 190                                     cancun (south of) (mexico)  <NA>
    ## 191                                                cancun (mexico)  <NA>
    ## 192                                      mt. popocatepetl (mexico)  <NA>
    ## 193                                             los cabos (mexico)  <NA>
    ## 194                                                  baja (mexico)  <NA>
    ## 195                                                         mexico    mo
    ## 196                        caribbean sea (between mexico and cuba)  <NA>
    ## 197                                                cancun (mexico)  <NA>
    ## 198                               akumal&#44 quintana roo (mexico)  <NA>
    ## 199                                             monterrey (mexico)  <NA>
    ## 200     vergel de la sierra (mountain name; near no city) (mexico)  <NA>
    ## 201                          mexicali&#44 baja california (mexico)  <NA>
    ## 202                                               morelia (mexico)  <NA>
    ## 203                                        cabo san lucas (mexico)  <NA>
    ## 204                                             monterrey (mexico)  <NA>
    ## 205                          san felipe (baja california) (mexico)  <NA>
    ## 206                                             mexico df (mexico)  <NA>
    ## 207                                chichen itza (yucatan) (mexico)  <NA>
    ## 208                         bahia de los angeles (baja&#44 mexico)  <NA>
    ## 209                                             chihuahua (mexico)  <NA>
    ## 210                                                xalapa (mexico)  <NA>
    ## 211                                    cozumel (north of) (mexico)  <NA>
    ## 212                                  international waters (mexico)  <NA>
    ## 213                                                cancun (mexico)  <NA>
    ## 214                          ensenada (15 miles south of) (mexico)  <NA>
    ## 215                                  torreon&#44 coahuila (mexico)  <NA>
    ## 216                                             east cape (mexico)  <NA>
    ## 217                                               tijuana (mexico)    ca
    ## 218                                        cabo san lucas (mexico)  <NA>
    ## 219                                     san jose del cabo (mexico)  <NA>
    ## 220                                 hermosillo&#44 sonora (mexico)  <NA>
    ## 221                                               tijuana (mexico)  <NA>
    ## 222                                                cancun (mexico)  <NA>
    ## 223                                               tijuana (mexico)  <NA>
    ## 224                               el paso (over juarez&#44 mexico)    tx
    ## 225                                apodaca&#44 nuevo leon (mexico)  <NA>
    ## 226                                                ajijic (mexico)  <NA>
    ## 227                                            cuernavaca (mexico)  <NA>
    ## 228                                               tecoman (mexico)  <NA>
    ## 229                                           mexico city (mexico)  <NA>
    ## 230                                                cancun (mexico)  <NA>
    ## 231                                               tijuana (mexico)  <NA>
    ## 232                                                         mexico    mo
    ## 233                                       puerto vallarta (mexico)  <NA>
    ## 234                                               tijuana (mexico)  <NA>
    ## 235                                               tijuana (mexico)  <NA>
    ## 236 mexicali b. c. mexico; sierra cucapah; cerro prieto.&#44 b. c.  <NA>
    ## 237                                  todos santos&#44 bcs (mexico)  <NA>
    ## 238                                        cabo san lucas (mexico)  <NA>
    ## 239                         cancun (melia turquesa hotel) (mexico)  <NA>
    ## 240                                                ajijic (mexico)  <NA>
    ## 241                                       puerto vallarta (mexico)  <NA>
    ## 242                                                  baja (mexico)  <NA>
    ## 243                                           lareto (baja mexico)    nv
    ## 244                                                  naco (mexico)    az
    ## 245                                          punta cabras (mexico)  <NA>
    ## 246                                           juxtlahuaca (mexico)  <NA>
    ## 247             cozumel (mexico) and ocho rios (jamaica) (between)  <NA>
    ##     country     shape duration..seconds.      duration..hours.min.
    ## 1        mx     light               1200                     20min
    ## 2        mx    circle                 60      about... a minute...
    ## 3        mx     light                120               1-2 minutes
    ## 4        mx     light               2700                30-45 mins
    ## 5        mx  fireball                900                15 minutes
    ## 6        mx     cross                300                 5 minutes
    ## 7        mx     light                180             three minutes
    ## 8        mx     light                180             three minutes
    ## 9        mx    sphere                 30                30 seconds
    ## 10       mx     flash                 10              5-10 seconds
    ## 11       mx     light                180                 3 minutes
    ## 12       mx    circle                  5                    5 sec.
    ## 13       mx  cylinder               1200                 20minutos
    ## 14       mx   diamond               2400                    40 min
    ## 15       mx       egg                 11                      11 s
    ## 16       us  teardrop                 45                45 seconds
    ## 17       mx      disk                300                 5 minutos
    ## 18       mx    sphere               3600                    1 hour
    ## 19       mx     other                  5                    5 sec.
    ## 20       mx      disk                 60                  1 minute
    ## 21       mx      disk                  3                 3 seconds
    ## 22       us     light                570                     09:30
    ## 23       mx  fireball                900                    15 min
    ## 24       mx    circle               2100                    35 min
    ## 25       mx     cross                300           4 to 5 miniutes
    ## 26       mx       egg                  1        less than 1 second
    ## 27       mx    circle                300                 5 minutes
    ## 28       mx  triangle                120                     2 min
    ## 29       mx    sphere                240                   3-4 min
    ## 30       mx    sphere               2100             30-35 minutes
    ## 31       mx   diamond                900                15 minutos
    ## 32       mx    circle                 30                30 seconds
    ## 33       mx formation               5400                 1.5 hours
    ## 34       mx  changing              10800                   3 hours
    ## 35       mx     light               1800              1:30 minutes
    ## 36       mx formation                 60                60 seconds
    ## 37       mx    circle                120             a few minutes
    ## 38       mx      <NA>               1200                20 minutes
    ## 39       mx  fireball                 60                    60segs
    ## 40       mx  cylinder                120                 2 minutes
    ## 41       mx     light                900                15 minutes
    ## 42       mx     other                300        about five minutes
    ## 43       mx  fireball                180               2-3 minutes
    ## 44       mx   chevron                600                10 minutes
    ## 45       mx     light               7200                 2 hours +
    ## 46       mx     other                 60                < 1 minute
    ## 47       mx     light                600                10 minutes
    ## 48       us      disk                  3                    hour +
    ## 49       mx formation                300            like 5 minutes
    ## 50       mx     light                120                2  minutes
    ## 51       mx    circle                300                 5 minutes
    ## 52       mx     light                300                     5 min
    ## 53       mx      disk               1800                    30 min
    ## 54       mx  triangle                 60                  1 minute
    ## 55       mx      disk               1200                   20 min.
    ## 56       mx      disk                 30                30 seconds
    ## 57       mx   unknown                  2             several hours
    ## 58       mx  changing              14400                   4 hours
    ## 59       mx   unknown                900                   15 mins
    ## 60       mx    sphere                  5                     5 sec
    ## 61       mx    sphere               3600                    1 hour
    ## 62       mx      <NA>               3600                  1 hour +
    ## 63       mx     other               7200                   2 hours
    ## 64       mx     cross                 45                45 seconds
    ## 65       mx  fireball                600                10 minutes
    ## 66       mx  triangle                300                ~5 minutes
    ## 67       mx  fireball                 45            45 sec-90 sec.
    ## 68       mx     light               3600                    1 hour
    ## 69       mx    sphere                480               7-8 minutes
    ## 70       mx formation                900                15 minutos
    ## 71       mx      <NA>                600               10+ minutes
    ## 72       mx     light                120                     2 min
    ## 73       mx     light                120                 2 minutes
    ## 74       mx   unknown                600                10 minutes
    ## 75       mx    sphere                300                    5 min.
    ## 76       mx      <NA>                 60                60 seconds
    ## 77       mx    sphere                 15                15 seconds
    ## 78       mx rectangle                  3            2 to 3 seconds
    ## 79       mx   unknown                 10              6-10 seconds
    ## 80       us  cylinder                120               2x3 minutes
    ## 81       mx formation                 50                50 seconds
    ## 82       mx     light               1800         approx 30 minutes
    ## 83       mx    sphere               5400                90 minutes
    ## 84       mx     light                900                   15 mins
    ## 85       mx     flash               1800                30 minutes
    ## 86       mx formation               1200                    20 min
    ## 87       mx   unknown                 30                    30 sec
    ## 88       mx      oval                300                 5 minutes
    ## 89       mx      disk               7200                 2 hours +
    ## 90       mx     light                 30                30 seconds
    ## 91       mx  changing                  1                     00:01
    ## 92       mx  triangle                300                 5 minutes
    ## 93       mx    circle                240            3 to 4 minutes
    ## 94       mx      disk               5400                1:30 horas
    ## 95       mx     other                 10                10 seconds
    ## 96       mx    circle                 60                one minute
    ## 97       mx      cone                900                15 minutes
    ## 98       mx      oval              64800                  18 hours
    ## 99       mx    sphere                 60                  1 minute
    ## 100      mx     other               1800         approx 20-30 mins
    ## 101      mx    sphere                  2                   seconds
    ## 102      mx     light                180                ~3 minutes
    ## 103      mx     light                300                 5 minutes
    ## 104      mx     light               1800                    30min.
    ## 105      mx     light               7200                   2 hours
    ## 106      mx     cigar                120                     2 min
    ## 107      mx   diamond                180                 3 minutes
    ## 108      mx   diamond                900                   15 min.
    ## 109      mx     light              10800                 3 hours +
    ## 110      mx   unknown             604800                    7 days
    ## 111      mx     other                 30                30 seconds
    ## 112      mx      disk                240                 four min.
    ## 113      mx     light                300                 5 minutes
    ## 114      mx     light                 60                one minute
    ## 115      mx formation                  5                 5 seconds
    ## 116      us    circle               1800                30 minutes
    ## 117      mx      disk                  2             a few seconds
    ## 118      mx    circle               3600                    1 hour
    ## 119      mx    circle               3600                    1 hour
    ## 120      mx     light                 30                   30 secs
    ## 121      mx  fireball                180                 3 minutes
    ## 122      mx      disk                300                    5 min.
    ## 123      mx     light                300               2-5 minutes
    ## 124      mx     light                  2                 2 seconds
    ## 125      mx    circle               7200                    2hours
    ## 126      mx     light                 20                    20 sec
    ## 127      mx      disk                180               2-3 minutes
    ## 128      mx      disk                180                 3 minutes
    ## 129      mx     other                240                 4 minutes
    ## 130      mx    sphere                 20                20 seconds
    ## 131      mx     light                300                 5 minuets
    ## 132      mx    sphere               1260                21 minutes
    ## 133      mx    circle               3600                    1 hour
    ## 134      mx  triangle                 60                  1 minute
    ## 135      us   chevron                600                10 minutes
    ## 136      mx     light                 30             20-30 seconds
    ## 137      mx  triangle               7200                   2 hours
    ## 138      mx  triangle               2700                45 minutes
    ## 139      mx      oval               2700                 45minutes
    ## 140      mx   unknown                 60                  1 minute
    ## 141      mx   unknown                 30                30 seconds
    ## 142      mx     light                300         5 minutes or less
    ## 143      mx rectangle                 10                10 seconds
    ## 144      mx  fireball                180                    3 mins
    ## 145      mx  cylinder                120                    0:2:00
    ## 146      mx     light                900                    15 min
    ## 147      mx      <NA>                180                  3+/- min
    ## 148      mx     light                 60                  1 minute
    ## 149      mx     light                240                 4 minutes
    ## 150      mx  changing               1800                30 minutes
    ## 151      mx  triangle              25200                   7 hours
    ## 152      mx     light                300                   4-5 min
    ## 153      mx      oval                  1                  1 second
    ## 154      mx   unknown                 16                16 seconds
    ## 155      mx    circle                300               4-5 minutes
    ## 156      mx    circle                  5                 5 seconds
    ## 157      mx      disk               1800             20 to 30mints
    ## 158      mx       egg                300                 5 minutes
    ## 159      mx   diamond                300                ~5 minutes
    ## 160      mx      oval                  2                 2 seconds
    ## 161      mx    sphere                 60                one minute
    ## 162      mx     light               2400                40 minutes
    ## 163      mx      oval                 60                  1 minute
    ## 164      mx      disk              86400                   all day
    ## 165      us     other               3600            roughly 1 hour
    ## 166      mx     other                600                    10 min
    ## 167      mx     cigar                180               2-3 minutes
    ## 168      mx    sphere               3600                    1 hour
    ## 169      us    sphere                 60                      1.00
    ## 170      mx      <NA>               1200                    20.min
    ## 171      mx     light                 60                  1 minute
    ## 172      mx     light                  1                  1 second
    ## 173      mx      oval              10800                     3 hrs
    ## 174      mx     cigar                  3                 3 seconds
    ## 175      mx     light               1200                10-20 min.
    ## 176      mx      disk                 60                  1 minute
    ## 177      mx    sphere               7200                     2 hrs
    ## 178      mx    sphere                600                10 minutes
    ## 179      mx      disk                300               aprox 5 min
    ## 180      mx  cylinder                  5                     5 sec
    ## 181      mx     light                 30                30 seconds
    ## 182      mx     other                 15                  1/2 hour
    ## 183      mx     light                900                     15min
    ## 184      mx     other                240                    4 min.
    ## 185      mx    sphere                600                10 minutes
    ## 186      mx      oval                 10                10 seconds
    ## 187      us     light                 50                50 seconds
    ## 188      mx      oval             345600       96 hours on and off
    ## 189      mx      disk                  3                 3 seconds
    ## 190      mx     light                300                    5 mins
    ## 191      mx    sphere               1410                     23:30
    ## 192      mx    circle                180                 3 minutes
    ## 193      mx     light                300                 5 minutes
    ## 194      mx     cigar               7200                      hour
    ## 195      us     light                 15                    15 sec
    ## 196      mx     light               1500                    25 min
    ## 197      mx     light               1800                   30 mins
    ## 198      mx   chevron                 10                10 seconds
    ## 199      mx    sphere                 15                    15 sec
    ## 200      mx  triangle                  7                 7 seconds
    ## 201      mx    circle                 60           1 minute approx
    ## 202      mx    sphere                600                10 minutes
    ## 203      mx     other                900               >15 minutes
    ## 204      mx    circle                600                10 minutes
    ## 205      mx  cylinder               1800                30 minutes
    ## 206      mx   chevron                300                 5 minutes
    ## 207      mx    circle                  5                     5 sec
    ## 208      mx       egg                600      less than 10 minutes
    ## 209      mx  triangle                180                      3min
    ## 210      mx     other                180                 3 minutes
    ## 211      mx    circle               3600 off and on for an hour or
    ## 212      mx    sphere                300                   4-5mins
    ## 213      mx     other                300                 5 minutes
    ## 214      mx formation                120                  one hour
    ## 215      mx     cigar                300               3-5 minutes
    ## 216      mx    circle                 60                  1 minute
    ## 217      mx     cigar                  3                 3 seconds
    ## 218      mx     other               1200                     20min
    ## 219      mx     light              10800                   3 hours
    ## 220      mx     other                 10                   10 sec.
    ## 221      mx      disk                600               5 to 10 min
    ## 222      mx     cigar                 30             approx. 30sec
    ## 223      mx      disk                180                    3 min.
    ## 224      us    circle                180        3 minutes to 5 min
    ## 225      mx     light               2100                    35 min
    ## 226      mx    sphere                 45                     45sec
    ## 227      mx  cylinder               7200                   2 hours
    ## 228      mx    sphere               1500                25 minutes
    ## 229      mx formation                 60                     1 min
    ## 230      mx     light                  3                 3 seconds
    ## 231      mx    sphere                300                 5 minutes
    ## 232      us   unknown                 45                    45 sec
    ## 233      mx     other                300               3 to 5 mins
    ## 234      mx      oval                900                15 minutes
    ## 235      mx       egg                480                 8 minutes
    ## 236      mx      oval                900            15 min or more
    ## 237      mx    sphere                 80                      1:20
    ## 238      mx     other               3600                    1 hour
    ## 239      mx     light                  5               4-5 seconds
    ## 240      mx    sphere                120                     2mins
    ## 241      mx      disk               2400                40 minutes
    ## 242      mx   unknown                900                   15 mins
    ## 243      mx   unknown               1800                30 minutes
    ## 244      us      disk                  5                     5 sec
    ## 245      mx     light                 15                15 seconds
    ## 246      mx      oval                  2               few seconds
    ## 247      mx  triangle               2700                    45 min
    ##                                                                                                                                                      comments
    ## 1                        While I was driving I stopped at a traffic light and when I turned to wait for the green light&#44 I saw 11 bright lights in the sky
    ## 2                                                    I saw a strange circular saucer moving (not at all quickly either) away from the sea&#44 from a balcony.
    ## 3                                                                          Flashing On and Off Star-Like light over San Jose del Cabo&#44 Baja Sur&#44 Mexico
    ## 4                                                                                                        bright white lights over the Sierra Madres in Mexico
    ## 5                                                         Orange fiery shapes at just above sea level  travelling in southern direction toward Cabo San Lucas
    ## 6                                                          Metalic objet in Mexico city.  ((NUFORC Note:  Photos show tiny&#44 blurry&#44 dark objects.  PD))
    ## 7                                                                                                             Amendment to prior form from Morelia&#44 Mexico
    ## 8                                                                                                                        Huge blue lights over Morelia Mexico
    ## 9                                                                                                                                                    fireball
    ## 10                                                          Two star-like objects sighted in Cuernavaca&#44 Mexico&#44 one flashed and then both disappeared.
    ## 11                    i was in Mexico visting my grandparents. I walked to the supermarket  to get bread and milk for them since they love to eat that for di
    ## 12                small star gets bigger&#44 bigger&#44 explodes then smaller light left in it&#39s place proceeds south-west at steady (satelite like)speed.
    ## 13                    empese a oir boses que me ablavan voltie asia riva y los vi unos silindricos esfericos unos que parecian cerpientes y tome varias fotos
    ## 14                                                                      Several objects appeared from behind a mountain&#44 moved around a bit and hid again.
    ## 15                                                                                                                                       UFOs at Mexico City.
    ## 16                 Bright green object traveling NW to SE. Copper colored tail trailing behind. Slowed in speed&#44 leveled off and dissapeared over the hori
    ## 17                    al evisar fotografias de un paisaje tomado en la sierra de Tapalpa Jalisco descubri unos puntos negros al momento de hacer la ampliacio
    ## 18                                                                                   3 objects appear over my house&#44 exactly over my head&#44 I have pics.
    ## 19            Object in the form of &quot;number 3 (3)&#44 with a faint light reddish white in each of its three ends traveling with uniform speed to the sou
    ## 20                                  A circular shaped craft  emiting three amber rays under it slowly hovering silently over the houses of the neighborhood .
    ## 21                                                                           Disc-Shaped Object seen on Hermosillo-Obregon City&#44 Sonora&#44 Mexico Highway
    ## 22                                                                                                                                       white floating light
    ## 23                                                                                                                                    2001 New Years Sighting
    ## 24                                                                   Object was red&#44round and no sound flew for awhile the went in to the sky and vanished
    ## 25                                             Object moves from west to east&#44 makes a u-turn&#44 and goes back west. Glows orange. Repeat of 12-24 event.
    ## 26                                   i was just taking pictures of night view with my digital camera&#44 and i suddenly realized that i took a picture of UFO
    ## 27                                                                                          bright orange light over puerto vallarta&#44 mex.  new years 1am.
    ## 28                                                                                                                          Trianglular mute lightened craft.
    ## 29                                                                                                                         Orange shpere over southern Mexico
    ## 30                                                                                                     Multiple Orange &amp; Red Spheres Over Southern Mexico
    ## 31                                                                                                                         AVISTAMIENTO DE OVNI SOBRE MEXICO.
    ## 32                                                                                       after work we 3  ships  flying  across the sky in acapulco in mexico
    ## 33                                                                                             7 LIGHTS IN A V FORMATION OUTSIDE OF PHOENIX FOR OVER AN HOUR.
    ## 34                                                                                               Screen captures from remote web com on Popocatepetl Volcano.
    ## 35                                                                                                                           Strange lights in Morelia Mexico
    ## 36                 Our first night in Cancun&#44 we randomly ended up having dinner outside.  My wife (completely not a UFO believer) happened to notice some
    ## 37                                                                                                                          Large spheric objects in the sky.
    ## 38              WAS  JUST BEFORE SUNSET&#44  AIRCRAFT  MIDLE ALTITUDE&#44 FLYING FROM NORTH EAST TO SOUT WEST APERA LIKE A SPACE CRAFT  ENTERING THE ATHMOSFE
    ## 39        I was driving South on the road&#44Forme Hermosillo to Guaymas &#44 the sky was blue&#44 There was no clouds Somethinhg bright on the sky &#44 call
    ## 40                                                                      UFO possible satellite with booster rocket over Sea of Cortez in Mexico on 1/13/2011.
    ## 41                                                                                                                Red light approaching stopped his movement.
    ## 42        Imagine the space shuttle on steoids&#44 with stubby X-15 like wings. Object flew overhead&#44 fast and low&#44 then rose quicly&#44 at one point i
    ## 43                                                                                bright ball seen in the northern sky traveling south from Nuevo Leon Mexico
    ## 44                                                                                                                         Glowing objects flying over Cancun
    ## 45                                                                                    Odd light formations over Banderas Bay in Puerto Vallarta&#44 Mexico...
    ## 46                 4 star-like objects with a surrounding halo appeared in succession to form an arc northeast of and close to the moon&#44 then suddenly dis
    ## 47                                                                            Red/orange bright lights around 10&#44 moving very slowly starting a formation.
    ## 48                                                                                                                         Four silvery disk objects observed
    ## 49                                                                                                                        THEY WERE FLYING AT AT A FAST SPEED
    ## 50                              about 300 saw a bright comet-like object flying too fast and too low from SW to NE at 21:10 on 12/2/01 at about 23&#176;N106W
    ## 51                                                              flying multicolor rotating circle very fast and akward movements once entering U.S. airspace.
    ## 52                                                                                                          Orange light in sky&#44 silent&#44 moving slowly.
    ## 53                                                                                                      5 huge ufos along the highway make the vehicles shake
    ## 54                                      triangular shaped 3 lights incredible from north to south low to very high altitude aircraft event about 1 min. long.
    ## 55                                                                                           Two saucers seen at Mayan ruins of Uxmal&#44 Yucatan&#44 Mexico.
    ## 56            clearly a flying suacer&#44 solid&#44 bright&#44 silent &#44 hovering at the top corner of a high rise building then flying away in an instant.
    ## 57                                                                                                        flashing lights over the Carribean for several days
    ## 58                                                                     Bright multi-colored&#44 pulsating cigar shaped object observed near Tulum&#44. Mexico
    ## 59                                                                                        bright strobe light ufo seen over bay in puerto vallarta&#44 mexico
    ## 60                                                                                Huatulco ufo. Brown disc shape&#44 flat sides. &quot;Windows&quot; showing.
    ## 61                                                                             White orb of light hovering over Sierra Madre Mountains during Christmas week.
    ## 62                              Bright light over San Jose del Cabo&#44 Baja Mexico around 4:00 AM. About 35 degrees above the horizon moving slowly to west.
    ## 63                                          &#39dancing&#39 lights that looked like starts zig-zagging and doing other incredible manouveres in Cancun Mexico
    ## 64                                            On December 24th at about 11:00pm a jet shaped objected moved across the sky glowing orange at a high altitude.
    ## 65                                            Red and Yellow Flashing Object Moving Very slowly and Some other 4 with the same Shape Flying like in Formation
    ## 66                                                                                                                   Huge triangle shaped craft over Tijuana.
    ## 67                            I witnessed a very large glow in the sky which cannot be attributable to any known aircraft and which descended into the ocean.
    ## 68                                                                                                                  Bright light on and off for about an hour
    ## 69                                                The red  glowing spheres in Mexico were first seen flying as a triangle and then went into a straight line.
    ## 70                                                                  flotilla de ovnis tomada en video en Diciembre de 1994 en Tampico&#44 Tamaulipas. Mexico.
    ## 71                                                                    There was many objects stopping traffic on a major highway outside Monterrey&#44 Mexico
    ## 72                                                                              An orange ball of light was faster than a plane or helicopter and disappeared
    ## 73                     White bright light like a headlight with a cloudy proyection though heaven was clear. It suddenly disspareared leaving just the bright
    ## 74                                                     Short vapor trail seen at very very high altitude over Puerto Vallarta&#44 flying S to N at 12:10 PM..
    ## 75                                                                                                           It was the most amazing sight I&#39ve ever seen.
    ## 76             tres dias antes del avistamiento tuve un sue&ntilde;o muy bonito y que me ocasiono mucha tranquilidad en el cual veia muchas naves de un color
    ## 77                                                                                        An orange sphere traveling from east to west at an incredible speed
    ## 78                    A white flash of light moving east to west stopped for one second in the shape of a green rectangle with round corners.  Then It procee
    ## 79                    i always and looking for satellites. this particular night i thought i had found one because of the speed that the light was moving was
    ## 80                 There were 4 craft - 2 sets of 2 - They looked like F16s only meatier - I was driving towards two of them&#44 and when I got near them I n
    ## 81                                    Five reddish orange lights moving at very fast &#44 floating speeds in a formation.  Dog got agitated as it got closer.
    ## 82                                                            Star-like objects turning and moving at different directions and sometimes at incredible speed.
    ## 83                                                                    Watching Live Video Cam of Popo at http://www.cenapred.unam.mx/UltimaImagenVolcan2.html
    ## 84                                                                                                                          they werent planes they were UFOS
    ## 85                                            la estrella estuvo estatica por lo menos 30 min y su uida fue espectacular ni el mas moderno avion aria eso&#33
    ## 86                    it happend while on a road to guadalajara jalisco mexico my 3 brothers ans sister are witnesses of seeing 5 objects flying very high in
    ## 87                                                                                                                             Dark round hole in the clouds.
    ## 88                                                                                                                        Very smooth&#44 arched flight path.
    ## 89                                                                                    Irreguelar &quot;cloud&quot; formations in sky above Bahia de Banderas.
    ## 90                                                                                                                    Two bright lights zigzaging over Cancun
    ## 91                                                                    Satilite like object then growing bright changing direction and moving rapidly upwards.
    ## 92                                                                                                                                       Photographic picture
    ## 93                                                                 two round objects travelled in complete silence over water as I watched from my hotel room
    ## 94           Aparecio un objeto extra&ntilde;o a las afueras de la ciudad&#44 el OVNI media al rededor de 300 m de longitud era una cosa enorme y a tan larga
    ## 95                                        Saw an unidentified craft with outstanding maneuverablility and silent operation on the coast of Cancun&#44 Mexico.
    ## 96                 MY FAMILY AND I LIVE IN A TWO STORY HOUSE AT THAT TIME&#44 I WAS LOOKING AT THE WINDOW WHEN I SAW A FLYING SOUCER COMING TOUR ON TOP OF TH
    ## 97                                                      They came from the West&#44 changed directions numerous times and were very visible to the naked eye.
    ## 98                                                                             UFO over San Carlos&#44 Sonora&#44 Mexico.  ((NUFORC Note:  Lens flares.  PD))
    ## 99           A sphere&#44 changing from orange to white&#44 passed over my home at around 7:30-7:40 tonight. There was no sound&#44 but it was traveling at a
    ## 100                                         8 oranges lights with 3 dropping something into the ocean at Puerto Vallarta on 9  February 2012&#44 at 23:00hrs.
    ## 101                                                                                                                           UFO in calm coastal Sunset sky.
    ## 102                                                                                                        Three orange lights moving and hovering in Mexico.
    ## 103                                                           very bright light with huge triangular vapor trail emitting from the bottom of the light source
    ## 104                                         BRIGHTLIGHT MOVING NORTH NO TRAIL MOVED NORTH FOR 20MIN.THEN TURNED EAST FOR 10MIN. THEN FADED OUT OF SITE.......
    ## 105                   Static light over the city&#44 it was lowering and raising its brightness intensity.  ((NUFORC Note:  Possible sighting of Venus?  PD))
    ## 106                                                                                    cigar-shaped orange emitting light over the beach in Cancun&#44 Mexico
    ## 107                                                                                                    Black Pyramidal UFO hovering over a Guadalajara Mexico
    ## 108         While traveling to San Felipe for a fishing trip Three Immigration Inspectors and myself a Customs Inspector spotted a &quot;diamond&quot; to the
    ## 109             While on vacation in Cancun Mexico we stayed in the hotel  zone. On Sunday night March 15&#44 2009 at approximately 8:15 p.m.&#44 we were sit
    ## 110                                                                         Regular appearing and disappearing blinking lights over Cabo San Lucas&#44 Mexico
    ## 111                                                                                                                         3 bird like crafts seen at night.
    ## 112                                                                                                                    the object over our house was huge&#33
    ## 113               There were two lights that were white and blue moving abnormally fast near the Sierra Madre Mountains in Puerto Vallarta&#44 Jalisco&#44 MX
    ## 114                I married a woman from the Mexican island of Cozumel&#44 state of Quintana Roo. This was in 1970. My wife an I opened a store in my brothe
    ## 115                                  Punta Mita Mexico. 8 inverted wing shape lights criss crossing each other.Appeared  like white lit birds in the dark sky
    ## 116                                                                                       Three circular objects disappearing and reappearing over the ocean.
    ## 117                                                                A disk-shaped flying object appeared above the Pyramid of the Sun at Teotihuacan in Mexico
    ## 118                 camping on the beach looking at what we thought was a shooting star and it was falling from the sky over the ocean only it stopped&#44 it
    ## 119          I wrote to you about the sighting my family had over the ocean on March 31&#44 2002&#44 in Puerto Penasco &#44 Mexico  aka Rocky Point... you as
    ## 120                                                                                                We observed a faint orange-red light coming from the north
    ## 121                                                                Orange object moving from north to south in the western sky in Puerto Vallarta&#44 Mexico.
    ## 122                                                                                                                                 UFO&#39s over Mexico City
    ## 123                                                               11 UFO&#39s sighted in Mexican capital by airforce pilots visible only via infared cameras.
    ## 124         Rectangular flash of light fly &#190; of the way across the sky.  It flew across the sky very fast and disappeared &#190; of the way from reachin
    ## 125                      A yellow/orange circle which looked as if it radiated heat was moving at such a fast speed that the pictures I took left a long rope
    ## 126                                        I have captured a strange light when I took a photo from the moon in N Mexico.  ((NUFORC Note:  Lens flare??  PD))
    ## 127                    Bright moonlit night with low fog on horizon No aircraft or boats off the coast of Baja California Bright lights appear at about 30 to
    ## 128                    San Antonio del Mar&#44 Baja California 5 miles north of Rosarito Beach Monday&#44 March 8&#44 1993&#44 9:35 p.m. Bright moonlit night
    ## 129                                                                                                      Strange silent object hovering over my daughters bed
    ## 130                                                                                            The object was clearly flying over the Pyramids in Mexico City
    ## 131                                                                                     Me and two other witnesses seen 3 lights in the sky on a evning walk.
    ## 132                    I woke up with a sensation of dehydration and sweat and drank a glass of water feeling a need to open the windows curtain and I saw an
    ## 133                   Ocurrio como si nos estuvieran ovserbando dieron buelta sobre el poblado y se fueron pero despues cayeron como desteyos de luz pero era
    ## 134                                                           Perfectly shaped triangle of stars&#44 extremely fast moving&#44 two stars circling each other.
    ## 135                                                                                                                 Huge boomerang shaped aircraft buzzed me.
    ## 136                                                                 A small star like light&#44 making sharp turns in the area of Ursa Major (The Big Dipper)
    ## 137                           Triangular shaped illuminating object hovering over the ocean near Cancun Mexico.  ((NUFORC Note:  Sighting of a planet??  PD))
    ## 138                                                                     2 large spacecrafts emitting 12+ spherical objects with incredible speed and agility.
    ## 139                                                                                   Sighting of Motherships retrieving aproximately 50 other smaller ships.
    ## 140                                       Boomerang shaped UFO noticed in viral youtube video clip.  ((NUFORC Note:  Possible bird in hovering flight??  PD))
    ## 141                                                   Star like object on northerly course makes 120 degree turn&#44 moves erratically and stops&#44 vanishes
    ## 142          Looking at the sky&#44while visting my parents&#44we saw what we thought to be at first sight a satelite&#44except going at least 4 or 5 times t
    ## 143                                                                                        Caught shot of possible UFO on Vacation near Mayan Ruins in Mexico
    ## 144                                                                                             Red fireball moving across the night sky in Cancun&#44 Mexico
    ## 145                                             Bright light following cylindrical nose&#44 near ground&#44 moving linearly southward without noise or trail.
    ## 146                                                                                                                          Saw UFO outside Airplane Window.
    ## 147                                                                                                                            Something in the night sky&#33
    ## 148                                                                                            Bright Red-Orange-White Ball of Light in Cuernavaca&#44 Mexico
    ## 149                                                                          Lighted UFO  following shores of Play Car towards Cancun and making tight circle
    ## 150    Hello&#44 I am writing to you because I just filmed over 30 minutes of UFO video with my camcorder down in &#8220;Mulege&#8221; which is a town locate
    ## 151                         The object was glowing green and red. At times it went to just green and then white. Was usually green for the most part with red
    ## 152                                        A moving light that resembled a star but moved in a crazy&#44 erratic fashion and then zipped away and disappeared
    ## 153                                                                                                       UFO Captured in Photo - Puerto Vallarta &#44 Mexico
    ## 154                                                                                                    UFO Puerto Valarta Captured On Photo April 07&#44 2007
    ## 155                                                                                                                   ufo seen in playa del carmen&#44 mexico
    ## 156                                                                                                 Sighting of a white object flying at an impossible speed.
    ## 157                               disc shape object shiny and abouth 20 meters in diameter hovering over agricultural fields in la moncada&#44 gto&#44 mexico
    ## 158                                                                                                                 It was silent and metalic and reflective.
    ## 159                                                                                            4 diamond shaped light over the ocean in Mexico in May of 1996
    ## 160                                                                                     Oval object with half globe on the top and white-shiny haze around it
    ## 161                                                                                                                  Huge Sphere over  Puerto Vallarta Mexico
    ## 162                                                       A flashing red and white light making irratic movements and hovering at length before disappearing.
    ## 163                                                                                                     Craft over Meixcan coast on Caribbean side of country
    ## 164                                                                             MEXICAN GOVERNMENT OFFICIALS RECOVER AND CONFISCATE OBJECT THAT FELL FROM SKY
    ## 165                                                                                   Multiple UFO sightings in a single area on the outskirts of small town.
    ## 166                                                                                                                                       Show in the sky&#33
    ## 167                WAS SITTING ON THE BEACH AND STARGAZING WHEN I SEEN A SHOOTONG STAR OR THOUGHT IT WAS I DIDN&#39T NOTICE ANY LIGHTS JUST THAT IT WAS MOVIN
    ## 168                                           Very bright glowing object would drop suddenly and rise again...and stay still. Looked like Venus&#44 but moved
    ## 169                         ((HOAX??)) this oval or sphere or orb was moving from north to south moving very fast color was yellow whit white light around it
    ## 170                   I have 20 minutes of film but no one seams intrested to even look at it It looks like an object moving away from you as bright as any s
    ## 171                                                                                                                                    Red lights in the sky.
    ## 172                                                                                                          Huge Bright White Light Flash in Desert Baja Sky
    ## 173                                                                                              UFO sighting and scanning sentsation in El Ajusco&#44 Mexico
    ## 174                         The object fly in to W-NW direction. The object changed by red-blue colors. The object appear in the sky and desappear in seconds
    ## 175                                                                                               2001-06 Cancun Mexico - distant bright orange dancing light
    ## 176                                                                                                  Large disk observed by townspeople in large Mexican city
    ## 177                   I was in the northwest side of the town of Hermosillo Sonora (State)Mexico when i saw the Sphere up on the sky north east of the town i
    ## 178                                                                     We saw a gigantic sphere in the sky one Saturday night after an earthquake in Mexico.
    ## 179                                                                                                                           dark gray with lights around it
    ## 180                          I looked up from a Beach called Los gatos and saw three circular disc in triangle formation shift forward and left  out of sight
    ## 181                while scanning the stars&#44I was drawn to a perfect circle of stars or lights high in the sky. while exclaiming to my friend that this fo
    ## 182                                                                                     Contact with aliens in a small craft in the state of jalisco Mexico .
    ## 183                                                                  Two lights darting in a zig zag patern. Another flashing craft moving with other lights.
    ## 184        I think I saw contrails&#44 but this day some military F-5 aircraft were passing by over the city&#44 and I don&#180;t know if they release a whit
    ## 185                                                                                                                                      static silver sphere
    ## 186                            2 female friends at lunch in Malinalco&#44 Mexico last June - saw small shiny silver oval/circular object for about 12 seconds
    ## 187                                     two bright white orbs  come from northwest heading southwest no  sound.  ((NUFORC Note:  Space Shuttle w/ ISS??  PD))
    ## 188                                                                                                                UFO seen on internet cam over Popo Volcano
    ## 189                 I was lying on the ground looking out the window at the sky and was listening to my iPod &#44 suddenly I started hearing static on it and
    ## 190                I am compelled to relay this recent experience of mine to anyone that may usefully document it.  Keep in mind it&#39s an account written b
    ## 191                   Around 11pm on 06/24 My wife and I Noticed   Circular shape beams of light  with a Halo like circle around them.  They were traveling n
    ## 192                                                                  Shortly before dawn&#44 a circular UFO was seen flying below Mt. Popocatepetl in Mexico.
    ## 193                                                                                                 bright light omitting a fog light appearance toward earth
    ## 194                                                                  I saw a cigar UFO black in color with 4 lights coming out of it and two beaming to earth
    ## 195                                  The light moved into view with no sound in the eastern sky&#44 stopped and became really bright &#44 dimmened then left.
    ## 196                                                                              3 underwater UFO light objects sighted off the coast of Mexaco near Cozumel.
    ## 197                                                                                    high speed light that can change course in a second&#44 in high orbit.
    ## 198                                                                                                       Chevron Light Formation in Quintana Roo&#44 Mexico.
    ## 199                                                                                                                                          go to fast speed
    ## 200                                                                                                   vergel de la sierra mexico sightings black triangle ufo
    ## 201                                                                                                                 UFO  over Mexicali&#44 Mexico - 1960&#39s
    ## 202                                                                                                                  Orange spheres close to homes in Mexico.
    ## 203                     ((HOAX??))  The sky is very clear filled with an array of stars.  There is a yellowish&#44 slightly reddish starlike object flashing.
    ## 204                                                                       two brilliant circles of severals ligths of colours cross the sky in a summer nigth
    ## 205                                                                     there are objects in the baja area not yet identified&#33&#33&#33&#33&#33&#33&#33&#33
    ## 206                                                                                                                               A small ovni in Mexicos Sky
    ## 207                                                         2 sec appearance on video while climbing piramid in chichen Itza Pen Yucat&aacute;n M&eacute;xico
    ## 208                                        glowing ball flying from south to north at the south end of the bay...  Bahia De Los Angeles Baja California Norte
    ## 209             Vimos una nave triangular con luz roja en cada punta del triangulo&#44 volaba a una velocidad baja a unos 200 mts de altura&#44 la noche esta
    ## 210                                                                                                 Lighted circular craft flying over power plant in Mexico.
    ## 211                                                                                                   Strange lights seen off a cruise ship in the Caribbean.
    ## 212                                                                                             While on a fishing trip in Mexico i saw a small sperical UFO.
    ## 213                                                                                                                             Points of lights in Cancun 96
    ## 214                                                    My brother&#44 a friend&#44 and I witnessed six craft over Baja&#44 Calif&#44 beach in October of 1969
    ## 215                                                                                                                                      2 cigar like objects
    ## 216                                                                                                      3 Stars Move To Form Perfect Triangle Then Disappear
    ## 217                                                                                         it aperd for a 3 second period standing statik long silver object
    ## 218                                                              large light object that stayed in sighting for approx. 20 to 25 minutes. moving west to east
    ## 219                                                                            3 UFO&#8217;s holding a triangular position adjacent to the moon for 2+ hours.
    ## 220                                             A white boomerrang spaceship decloaked (six blocks away)&#44 then like&#44 warp speed away.(Star Trek stlye).
    ## 221                                                                                                                                                  ovni o ?
    ## 222                                                                                                          A huge object off the coast of Cancun&#44 Mexico
    ## 223                This thing was long approx. 200ft and thin. Silver metallic but shiny nothing like an airplane or anything I&#39ve ever seen before. We di
    ## 224                   about 9:50 pm while seating on steeps of front porche facing south I observe a light above Juarez mx just like a plane landing and as w
    ## 225 A half hour ago&#44 I and others have seen a very bright &quot;star&quot; moving from northest to southwest altmost on the cenit (70 to 90&#176;)with a v
    ## 226               We observed a red and bright white sphere for some 45 seconds&#44 travelling rapidly in an arc from WSW to NE&#44 below medium cloud cover.
    ## 227                                                                                                                        Cane shaped object spinning slowly
    ## 228                                we seen an orange sphere that lasted for hours right above the ocean&#44it didnt move at all but it had a weird glow to it
    ## 229                Direction: West to East Seven lights type foo fighter (intense white neon light) in triangle formation&#44 never ever seen speed. Due to t
    ## 230                                                                                            Red shooting star changed directions and went back into space.
    ## 231                                                                         3 esferas plateadas  estaban estaticas en el aire a una distancia de 1 kilometro.
    ## 232                               Black object seen flying very high/fast changing direction/altitude at incredible rate until it disapeared into the clouds.
    ## 233                                                                   Something definitely seen and video taped while vacationing in Puerto Vallarta&#44 Mex.
    ## 234                                                                                                       Gray object above a mount left a trail to the south
    ## 235                                                                    El objeto estaba inmovil  en el aire&#44 era de un color plateado y en forma de huevo.
    ## 236                I seen one objet upper the Sierra cucapah (Cucapah mountains)the form of this objet: ovoid and gold color&#44 this objet disappears when i
    ## 237                     4:00 A.M. a large white light was seen above the tallest mountain east of Todos Santos at Lat.23.30 (Tropic of Cancer) and Lon. 110.W
    ## 238                                                            Black flying object over Cabo San Lucas Hotel.  Had red lights coming from it from a distance.
    ## 239               3 dull orange lights closely clustered traveling from NNW to SSE. Traveling at high altitude &amp; rate of speed with a abrupt jog to the e
    ## 240                                                         A bright red sphere with pulsating white light observed SE of Ajijic&#44 Mexico for about 2 mins.
    ## 241          Off the balcony of our hotel in Puerto Vallarta Mexico my fianc&eacute; and myself observed four bright orange lights.  Others appeared&#44 too.
    ## 242                                         ((NUFORC Note:  Missile launch from Vandenberg AFB.  PD))  SOME SORT OF CRAFT AND MUSHROOM CLOUD&#44 TO THE NORTH
    ## 243                                                                                                    Bright Lights 30 miles North of Lareto&#44 Baja Mexico
    ## 244                                                                                                                                       UFO over Naco AZ/MX
    ## 245                               Brightest light in the sky &quot;S Curves&quot; and shoots straight away and fades into nothing.- - Punta Cabras&#44 Mexico
    ## 246                                                                                            flying flourescent lighted object that change directions fast.
    ## 247                             My husband and I&#44 while traveling on our honeymoon&#44 observed something strange following our ship just before midnight.
    ##     date.posted   latitude  longitude
    ## 1     7/16/2006  27.477936  -99.54957
    ## 2      9/2/2005  20.679606 -103.26511
    ## 3    12/12/2011  23.063656 -109.70244
    ## 4    10/31/2003  20.653407 -105.22533
    ## 5      6/9/2009  23.063656 -109.70244
    ## 6     1/30/2014  19.432608  -99.13321
    ## 7    11/21/2010   19.70595 -101.19498
    ## 8    11/21/2010   19.70595 -101.19498
    ## 9    12/12/2011  32.514947 -117.03825
    ## 10   10/31/2008  18.918611  -99.23417
    ## 11   12/16/2005  32.514947 -117.03825
    ## 12   11/17/1999  27.917865 -110.90894
    ## 13    1/11/2002  20.671956 -103.41650
    ## 14    12/2/2000  18.991706  -99.08707
    ## 15     3/4/2003  19.432608  -99.13321
    ## 16   11/23/1999 39.1697222  -91.88278
    ## 17    12/3/2004  20.659538 -103.34944
    ## 18     2/1/2007  20.671956 -103.41650
    ## 19   11/28/2007  26.498997 -100.17969
    ## 20    4/27/2004  31.866743 -116.59637
    ## 21    12/7/2006  29.097274 -110.98434
    ## 22   11/26/2003 31.3352778 -109.94750
    ## 23     3/4/2003  34.478889 -105.88194
    ## 24    1/11/2002  32.514947 -117.03825
    ## 25    1/11/2005  25.686614 -100.31611
    ## 26    1/11/2005  25.686614 -100.31611
    ## 27     2/1/2007  20.653407 -105.22533
    ## 28     2/1/2007  31.866743 -116.59637
    ## 29    1/21/2008  15.865535  -97.06945
    ## 30    4/14/2009  15.865535  -97.06945
    ## 31    2/14/2010  19.951944  -99.53278
    ## 32    2/14/2006  16.863611  -99.88250
    ## 33    5/15/2006  33.493478 -112.93708
    ## 34   12/20/2012   19.02317  -98.62384
    ## 35   11/21/2010   19.70595 -101.19498
    ## 36    12/2/2013  19.181739  -88.47914
    ## 37    12/3/2004  20.653407 -105.22533
    ## 38    12/9/2003  21.161908  -86.85153
    ## 39   12/16/2005  27.893965 -110.87467
    ## 40     7/3/2013   27.46449  -82.67255
    ## 41     2/4/2013  25.686614 -100.31611
    ## 42    2/12/2004  32.514947 -117.03825
    ## 43     3/4/2008  27.477936  -99.54957
    ## 44    4/13/2010  21.161908  -86.85153
    ## 45    12/3/2004  20.653407 -105.22533
    ## 46    5/15/2006  22.890533 -109.91674
    ## 47   11/11/2013  32.514947 -117.03825
    ## 48     4/2/1999 40.5375000  -77.35361
    ## 49   10/27/2004  26.092222  -98.27778
    ## 50    2/22/2002  23.236111 -106.41528
    ## 51    12/7/2006  32.624539 -115.45226
    ## 52     2/3/2012  20.653407 -105.22533
    ## 53     2/1/2007  20.659699 -103.34961
    ## 54    1/10/2009  32.624539 -115.45226
    ## 55    7/16/2003  20.359906  -89.76838
    ## 56    6/12/2008  19.432608  -99.13321
    ## 57     2/1/2007  21.161908  -86.85153
    ## 58    12/9/2003  20.211944  -87.46583
    ## 59    2/14/2006  20.653407 -105.22533
    ## 60    4/17/2008  18.069623  -96.12431
    ## 61   11/21/2010  40.416775   -3.70379
    ## 62     3/4/2008  23.063656 -109.70244
    ## 63    8/28/2003  21.161908  -86.85153
    ## 64    1/11/2005  25.686614 -100.31611
    ## 65    1/10/2014  25.686614 -100.31611
    ## 66    1/16/2014  32.514947 -117.03825
    ## 67    4/17/2008  22.890533 -109.91674
    ## 68     8/5/2001  19.173494  -98.34444
    ## 69    3/11/2006  32.692651 -114.62769
    ## 70    9/29/2004  22.233104  -97.86110
    ## 71     3/4/2003  25.686614 -100.31611
    ## 72   12/12/2011  25.686614 -100.31611
    ## 73    1/28/1999  19.195096 -100.13267
    ## 74   12/12/2013  20.653407 -105.22533
    ## 75    2/18/2001  23.063656 -109.70244
    ## 76    9/19/2002  28.632996 -106.06910
    ## 77    1/21/2008  19.432608  -99.13321
    ## 78    2/16/1999  32.514947 -117.03825
    ## 79    1/11/2002  21.161908  -86.85153
    ## 80    6/10/2003 29.9477778  -85.41806
    ## 81    2/14/2006  20.653407 -105.22533
    ## 82     3/2/2004  21.161908  -86.85153
    ## 83     4/2/1999  43.916231 -123.96400
    ## 84     3/2/2004  21.469114  -78.65689
    ## 85     6/4/2004  32.514947 -117.03825
    ## 86    1/28/1999  20.659699 -103.34961
    ## 87    2/24/2007  24.805249 -107.38343
    ## 88    3/18/2014  20.588793 -100.38989
    ## 89    2/14/2006  20.653407 -105.22533
    ## 90    2/14/2008  21.161908  -86.85153
    ## 91     7/5/1999  21.161908  -86.85153
    ## 92    2/14/2006  20.211944  -87.46583
    ## 93    3/31/2008  20.653407 -105.22533
    ## 94    5/14/2002   22.15647 -100.98554
    ## 95    6/12/2007  21.161908  -86.85153
    ## 96    2/14/2008  19.432608  -99.13321
    ## 97    2/14/2008  20.653407 -105.22533
    ## 98    2/14/2008  27.961788 -111.03710
    ## 99    2/10/2012  15.865535  -97.06945
    ## 100   3/13/2012  20.653407 -105.22533
    ## 101   5/11/2005  29.107985 -111.04136
    ## 102    7/3/2013  21.504165 -104.89459
    ## 103    4/8/2002  31.351594 -113.30227
    ## 104   3/19/2009  46.181795   18.95431
    ## 105   3/18/2014  31.866743 -116.59637
    ## 106   4/14/2009  21.161908  -86.85153
    ## 107   5/15/2013  20.659699 -103.34961
    ## 108  11/20/2002  10.340556  -68.73694
    ## 109   4/14/2009  21.161908  -86.85153
    ## 110   3/23/2011  22.890533 -109.91674
    ## 111   3/21/2014  20.629559  -87.07389
    ## 112  10/30/2006   20.75682 -105.33361
    ## 113   4/18/2012  20.653407 -105.22533
    ## 114  10/31/2003  20.422984  -86.92234
    ## 115    4/3/2011  20.774469 -105.51374
    ## 116    4/1/2000 29.9477778  -85.41806
    ## 117   8/10/1999  19.689722  -98.86083
    ## 118   4/25/2002  31.316667 -113.53694
    ## 119   4/25/2002  31.316667 -113.53694
    ## 120   4/27/2007  21.161908  -86.85153
    ## 121   9/17/2000  20.653407 -105.22533
    ## 122    6/4/2004  19.432608  -99.13321
    ## 123    6/4/2004  19.432608  -99.13321
    ## 124   5/15/2013  23.063656 -109.70244
    ## 125   5/15/2006  22.890533 -109.91674
    ## 126   4/14/2009  29.072967 -110.95592
    ## 127   10/8/2007 -33.617702  -71.62266
    ## 128   7/16/2006 -33.617702  -71.62266
    ## 129   3/10/2011   22.15647 -100.98554
    ## 130   4/14/2009  19.432608  -99.13321
    ## 131   3/19/2009  19.916576 -103.02129
    ## 132   4/15/2000  19.432608  -99.13321
    ## 133   5/15/2013   20.52611  -97.85597
    ## 134    8/5/2001  21.161908  -86.85153
    ## 135   4/18/2014 40.8222222  -86.11556
    ## 136   4/28/2001  21.161908  -86.85153
    ## 137   4/27/2004  21.161908  -86.85153
    ## 138  11/21/2010  34.478889 -105.88194
    ## 139  11/16/2002  18.918611  -99.23417
    ## 140    5/2/2011  31.758488   35.16927
    ## 141   4/27/2007  21.161908  -86.85153
    ## 142   9/19/2002  28.632996 -106.06910
    ## 143   6/12/2007  20.211944  -87.46583
    ## 144    6/3/2003  21.161908  -86.85153
    ## 145    8/5/2001  10.340556  -68.73694
    ## 146   4/27/2004  32.514947 -117.03825
    ## 147   5/11/2000  32.470997 -116.97493
    ## 148   3/19/2009  18.918611  -99.23417
    ## 149   5/11/2005  20.629559  -87.07389
    ## 150   4/27/2007  32.513917 -116.89948
    ## 151   4/13/2010  21.161908  -86.85153
    ## 152   3/19/2009  18.069623  -96.12431
    ## 153   4/27/2007  20.653407 -105.22533
    ## 154   4/27/2007  20.653407 -105.22533
    ## 155   6/12/2008  20.629559  -87.07389
    ## 156    7/8/2004  20.036111 -100.73139
    ## 157    3/2/2004  20.282153 -100.80272
    ## 158  10/15/2003  19.631726  -99.26054
    ## 159   7/29/2000  20.653407 -105.22533
    ## 160    9/9/2003  18.466667  -97.40000
    ## 161  11/21/2010  20.653407 -105.22533
    ## 162    6/4/2004  20.653407 -105.22533
    ## 163    6/4/2004 -25.275014  -57.54835
    ## 164    3/4/2008  25.686614 -100.31611
    ## 165   5/29/2012 39.1697222  -91.88278
    ## 166    6/4/2004  21.161908  -86.85153
    ## 167   9/19/2002  21.161908  -86.85153
    ## 168  10/12/2001  28.951915 -113.56243
    ## 169   5/13/2012 43.4594444  -76.22917
    ## 170   7/25/2004  23.236111 -106.41528
    ## 171   5/12/2011  19.432608  -99.13321
    ## 172   5/12/2010  10.340556  -68.73694
    ## 173   7/25/2004  32.486464 -116.95905
    ## 174   7/16/2006  20.966044  -89.62743
    ## 175   5/15/2006  21.161908  -86.85153
    ## 176  12/16/2005  32.624539 -115.45226
    ## 177   3/19/2002  29.072967 -110.95592
    ## 178   5/24/1999  17.956765 -102.19435
    ## 179   4/27/2007  19.566519 -101.70683
    ## 180    7/4/2012  17.644352 -101.55038
    ## 181   2/16/2000  31.866743 -116.59637
    ## 182    2/8/2011  21.167823 -102.46738
    ## 183   8/10/1999  10.340556  -68.73694
    ## 184   9/19/2002  28.632996 -106.06910
    ## 185    4/8/2002  19.432608  -99.13321
    ## 186    9/1/2004  18.948392  -99.49358
    ## 187    8/7/2007 39.1697222  -91.88278
    ## 188    8/5/2001  43.916231 -123.96400
    ## 189   6/27/2011  19.432608  -99.13321
    ## 190   6/10/2003  21.161908  -86.85153
    ## 191   7/11/2000  21.161908  -86.85153
    ## 192    7/1/2002  43.916231 -123.96400
    ## 193   7/16/2006  22.890533 -109.91674
    ## 194   7/16/2006  46.181795   18.95431
    ## 195    8/5/2009 39.1697222  -91.88278
    ## 196  10/30/2006  14.540111  -74.96764
    ## 197   1/19/2005  21.161908  -86.85153
    ## 198    8/7/2007  20.395974  -87.31590
    ## 199   7/16/2006  25.686614 -100.31611
    ## 200    2/1/2007  23.736159  -99.17829
    ## 201    8/5/2001  32.624539 -115.45226
    ## 202    6/2/2013   19.70595 -101.19498
    ## 203   7/14/2013  22.890533 -109.91674
    ## 204   8/11/2004  25.686614 -100.31611
    ## 205   7/26/2002  10.340556  -68.73694
    ## 206   7/29/2010   19.24647  -99.10135
    ## 207   7/16/2003  20.682618  -88.56864
    ## 208   3/28/2004  28.951915 -113.56243
    ## 209   7/26/2002  28.632996 -106.06910
    ## 210   8/27/2009      19.54  -96.92750
    ## 211   8/28/2003  20.422984  -86.92234
    ## 212    7/5/2005  40.593541 -105.04487
    ## 213   8/28/2002  21.161908  -86.85153
    ## 214  10/31/2003  31.866743 -116.59637
    ## 215  10/10/2011  25.542844 -103.40679
    ## 216  10/31/2008  23.059298 -109.68604
    ## 217  10/30/2006  32.514947 -117.03825
    ## 218   8/11/2004  22.890533 -109.91674
    ## 219   9/24/2012  23.063656 -109.70244
    ## 220    4/2/1999  29.072967 -110.95592
    ## 221    9/6/2002  32.514947 -117.03825
    ## 222    6/9/2009  21.161908  -86.85153
    ## 223    9/6/2002  32.514947 -117.03825
    ## 224  11/16/2002 31.7586111 -106.48639
    ## 225    9/2/2005  25.781562 -100.18760
    ## 226    9/4/2003  20.299546 -103.26344
    ## 227  10/31/2008  18.918611  -99.23417
    ## 228  10/30/2006  18.908889 -103.87472
    ## 229   1/21/2008  19.432608  -99.13321
    ## 230  10/30/2006  21.161908  -86.85153
    ## 231   9/17/2003  32.514947 -117.03825
    ## 232   9/12/1999 39.1697222  -91.88278
    ## 233   2/22/2005  20.653407 -105.22533
    ## 234   9/17/2003  32.514947 -117.03825
    ## 235   9/17/2003  32.514947 -117.03825
    ## 236    3/7/1998  30.889354 -108.18858
    ## 237   10/2/1999  23.446362 -110.22651
    ## 238  10/10/2011  22.890533 -109.91674
    ## 239   1/11/2002  21.161908  -86.85153
    ## 240    9/9/2003  20.299546 -103.26344
    ## 241   9/24/2012  20.653407 -105.22533
    ## 242  10/20/2005  46.181795   18.95431
    ## 243   11/3/2005  36.142233 -115.24637
    ## 244   10/8/2007 31.3352778 -109.94750
    ## 245   9/15/2005  32.506329 -116.91786
    ## 246  10/10/2011  16.892335  -99.82345
    ## 247   10/2/1999  20.422984  -86.92234

# EU Countries Datas

From here on, starting from “dataset4” I created the dataset for the
European countries. I do not know if there is a faster way than the one
I used. Anyway, this is my code, with which I transformed all the
countries that had the name in the ‘city’ column by giving them the
corresponding value in the ‘country’ column.

``` r
dataset3 <- dataset2 %>% 
  mutate(country = ifelse(city %like% "canada" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ca", country))
dataset4 <- dataset3 %>% 
  mutate(country = ifelse(city %like% "uk/england" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "uk", country))

dataset5 <- dataset4 %>% 
  mutate(country = ifelse(city %like% "italy" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "it", country))

dataset6 <- dataset5 %>% 
  mutate(country = ifelse(city %like% "spain" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "sp", country))
dataset7 <- dataset6 %>% 
  mutate(country = ifelse(city %like% "india" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "in", country))
dataset8 <- dataset7 %>% 
  mutate(country = ifelse(city %like% "netherlands" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "nd", country))
dataset9 <- dataset8 %>% 
  mutate(country = ifelse(city %like% "new zealand" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "nz", country))
dataset10 <- dataset9 %>% 
  mutate(country = ifelse(city %like% "germany" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "de", country))
dataset11 <- dataset10 %>% 
  mutate(country = ifelse(city %like% "brazil" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "br", country))
dataset12 <- dataset11 %>% 
  mutate(country = ifelse(city %like% "israel" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "is", country))
dataset13 <- dataset12 %>% 
  mutate(country = ifelse(city %like% "sweden" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "sw", country))
dataset14 <- dataset13 %>% 
  mutate(country = ifelse(city %like% "norway" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "no", country))
dataset15 <- dataset14 %>% 
  mutate(country = ifelse(city %like% "france" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "fr", country))
dataset16 <- dataset15 %>% 
  mutate(country = ifelse(city %like% "portugal" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "pt", country))
dataset17 <- dataset16 %>% 
  mutate(country = ifelse(city %like% "hungary" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "hu", country))
dataset18 <- dataset17 %>% 
  mutate(country = ifelse(city %like% "belgium" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "be", country))

dataset19 <- dataset18 %>% 
  mutate(country = ifelse(city %like% "poland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "pl", country))
dataset20 <- dataset19 %>% 
  mutate(country = ifelse(city %like% "romania" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ro", country))
dataset21 <- dataset20 %>% 
  mutate(country = ifelse(city %like% "finland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "fn", country))
dataset22 <- dataset21 %>% 
  mutate(country = ifelse(city %like% "switzerland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "sw", country))

dataset23 <- dataset22 %>% 
  mutate(country = ifelse(city %like% "greece" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "gr", country))
dataset24 <- dataset23 %>% 
  mutate(country = ifelse(city %like% "czech republic" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "cz", country))
dataset25 <- dataset24 %>% 
  mutate(country = ifelse(city %like% "albania" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "alb", country))
dataset26 <- dataset25 %>% 
  mutate(country = ifelse(city %like% "ukraine" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ukr", country))
dataset27 <- dataset26 %>% 
  mutate(country = ifelse(city %like% "iceland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "isl", country))
dataset28 <- dataset27 %>% 
  mutate(country = ifelse(city %like% "latvia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "lt", country))
dataset29 <- dataset28 %>% 
  mutate(country = ifelse(city %like% "estonia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "et", country))
dataset30 <- dataset29 %>% 
  mutate(country = ifelse(city %like% "lithuania" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "lit", country))
dataset31 <- dataset30 %>% 
  mutate(country = ifelse(city %like% "croatia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "cr", country))
dataset32 <- dataset31 %>% 
  mutate(country = ifelse(city %like% "bosnia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "bos", country))
dataset33 <- dataset32 %>% 
  mutate(country = ifelse(city %like% "serbia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ser", country))
dataset34 <- dataset33 %>% 
  mutate(country = ifelse(city %like% "austria" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ost", country))
dataset35 <- dataset34 %>% 
  mutate(country = ifelse(city %like% "switzerland" 
                          & !(city %like% "in flight") 
                        
                          , "swi", country))
```

``` r
View(dataset35)
```

Here I create a dataset that only includes values from European
countries. Then I divide them by geographical regions and add the column
‘percentage’.

``` r
ue_sightings<-filter(dataset35, country %in% c("it","sp","fr",
                                  "pl","pt","ro","fn","swi","sw","gr",
                                  "alb", "ukr","isl","lt","et","lit",
                                  "cr","bos","ser","ost","hu","no",
                                  "be","uk","nd","de"))
View(ue_sightings)
sightings_per_uecountry <- data.frame(table(ue_sightings$country))


sightings_per_uecountry <- sightings_per_uecountry %>% 
  mutate(percentage = Freq/sum(Freq) * 100,
          region = case_when(Var1 == 'it'
                              | Var1 == 'sp'
                              | Var1 == 'pt' 
                              | Var1 == 'gr' ~ 'South_eu'
                              , Var1 == 'swi' 
                              | Var1 == 'ost' 
                              | Var1 == 'nd' 
                              | Var1 == 'be'
                              | Var1 == 'de' 
                              | Var1 == 'fr' ~ 'Center_eu'
                              , Var1 == 'hu' 
                              | Var1 == 'pl' 
                              | Var1 == 'ro'
                              | Var1 == 'alb'
                              | Var1 == 'ukr'
                              | Var1 == 'lt' 
                              | Var1 == 'et' 
                              | Var1 == 'lit' 
                              | Var1 == 'cr' 
                              | Var1 == 'bos'
                              | Var1 == 'ser'~ 'East_eu'
                              , Var1 == 'fn'
                              | Var1 == 'sw'
                              | Var1 == 'uk' 
                              | Var1 == 'no' 
                              | Var1 == "isl" ~ 'North_eu',
                               TRUE ~ 'Other'
         )) %>%
  rename('num_of_sightings' = Freq, 'state' = Var1)
View(sightings_per_uecountry)
```

``` r
sightings_per_ueregion <- sightings_per_uecountry %>% 
  filter(region != 'Other') %>%
  group_by(region) %>%
  summarize(sightings_count = sum(num_of_sightings)) %>%
  mutate(percentage = sightings_count/sum(sightings_count) * 100) %>%
  arrange(-percentage) 
View(sightings_per_ueregion)
```

I realised that there is an error in the date column, which is why in
the code below I am changing the format so that it is of type ‘date’ and
can be used. The new dataset is “ue_sightings_v3”

``` r
datetime_v2 <- mdy_hm(ue_sightings$datetime)
ue_sightings_v2 <- cbind (ue_sightings,datetime_v2)
ue_sightings_v3 <- ue_sightings_v2 %>%
  dplyr::select(-datetime) %>%
  relocate(datetime_v2, .before=city)
View(ue_sightings_v3)
```

Here I create a new dataset in order to work with the months. In
addiction, I created a new column, named “season” according to the
month.

``` r
ue_monthly_sightings <- data.frame(table(month(ue_sightings_v3$datetime_v2)))
month_name <- month.abb[ue_monthly_sightings$Var1]
ue_monthly_sightings <- ue_monthly_sightings %>%
  cbind(month_name) %>%
  relocate(month_name, .after=Var1) %>%
  mutate(percentage = Freq/sum(Freq) * 100) %>%
  rename(month_number = Var1, num_of_sightings = Freq) %>%
  arrange(-num_of_sightings)
View(ue_monthly_sightings)
ue_monthly_sightings <- ue_monthly_sightings %>% 
  mutate(season = case_when(month_name == 'Dec' 
                            | month_name == 'Jan' 
                            | month_name == 'Feb' ~ "Winter"
                            , month_name == 'Mar'
                            | month_name == 'Apr'
                            | month_name == 'May' ~ "Spring"
                            , month_name == 'Jun'
                            | month_name == 'Jul'
                            | month_name == 'Aug' ~ "Summer"
                            , TRUE ~ "Fall"))
View(ue_monthly_sightings)
```

Finally I created a table according to the shape spotted.

``` r
sighting_shape <- data.frame(table(ue_sightings_v3$shape))

sighting_shape <- sighting_shape %>% 
  mutate(percentage = Freq/sum(Freq) * 100) %>%
  mutate(round_type_shape = case_when(Var1 %like% 'circle' 
                                      | Var1 %like% 'ball'
                                      | Var1 %like% 'sphere'
                                      | Var1 %like% 'disk'
                                      | Var1 %like% 'oval'
                                      | Var1 %like% 'cigar'
                                      | Var1 %like% 'cylinder'
                                      | Var1 %like% 'egg'
                                      | Var1 %like% 'round'
                                      ~ TRUE
                                      , TRUE ~ FALSE)) %>%
  rename(shape = Var1, num_of_sightings = Freq) %>%
  arrange(-num_of_sightings)

View(sighting_shape)
sighting_shape %>%
  group_by(round_type_shape) %>%
  summarize(sightings_count = sum(num_of_sightings)) %>%
  mutate(percentage = sightings_count/sum(sightings_count) * 100) %>%
  arrange(percentage)
```

    ## # A tibble: 2 × 3
    ##   round_type_shape sightings_count percentage
    ##   <lgl>                      <int>      <dbl>
    ## 1 TRUE                         485       41.6
    ## 2 FALSE                        681       58.4

Finally, I have reported the sightings over the years in a single table.

``` r
ue_yearly_sightings <- data.frame(table(as.numeric(format(ue_sightings_v3$datetime_v2,'%Y'))))
View(ue_yearly_sightings)
ue_yearly_sightings <- ue_yearly_sightings %>%
  rename(year = Var1, num_of_sightings = Freq) %>%
  arrange(-num_of_sightings)
View (ue_yearly_sightings)
```

# Data Viz

``` r
ggplot(ue_yearly_sightings, aes(x = year, y = num_of_sightings, group = 1)) + 
  geom_line(color = "#03AC13") +
  geom_point(color = "#03AC13") +
  labs(title = "Reported UFO Sightings in Ue Over Time"
       , y = "Number of Sightings"
       , x = "Year") +
  annotate ("text", x=43, y=96, label = "year 2003", colour= 'black', size = 3, angle= 25)+
 scale_x_discrete(breaks = seq(1904, 2014, by = 10))
```

![](UE_UFO_Sightings_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

``` r
ggplot(sightings_per_ueregion, aes(x = region, y = sightings_count)) +
  geom_col(aes(fill = region), width = 0.3) +
  scale_fill_manual(values = c("#234F1E", "#028A0F", "#03C04A", "#AEF539"))+
  labs(title = "Reported UFO Sightings Per U.E Region"
       , x = "Region"
       , y = "Number of Sightings")+
  guides(fill = guide_legend(title = "Region"))
```

![](UE_UFO_Sightings_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

``` r
ggplot(sighting_shape, aes (x = reorder (shape, -num_of_sightings), y=num_of_sightings)) + 
  geom_col(aes(fill = shape), width=0.4, position = position_dodge(width=0.5)) + 
  theme(axis.text.x= element_text(angle = 90)) +
  labs(title = "Shape of UFO sightings in EU"
       , y = "Number of Sightings"
       , x = "Shape")
```

![](UE_UFO_Sightings_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

``` r
ggplot(ue_monthly_sightings, aes (x = reorder (month_name, season), y= percentage)) +
  geom_col(aes(fill = month_name)) +
  labs(title = "EU sightings per Month"
       , y = "Percentage of Sightings"
       , x = "Month") +
  guides(fill=guide_legend(title="Month"))
```

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

    ## Warning in mean.default(X[[i]], ...): l'argomento non è numerico o logico: si
    ## restituisce NA

![](UE_UFO_Sightings_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

``` r
 ggplot (ue_monthly_sightings, aes (x= reorder (season, -percentage), y = percentage)) + 
    geom_col (aes (fill = season)) +
    labs(title = "EU sightings per Season"
         , y = "Percentage of Sightings"
         , x = "Season")
```

![](UE_UFO_Sightings_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

``` r
ggplot (sightings_per_uecountry, aes (x = reorder (state, -percentage), y = percentage)) + 
   geom_col (aes (fill = state)) + 
theme(axis.text.x= element_text(angle = 90)) + 
labs(title = "EU sightings per Country"
     , y = "Percentage of Sightings"
     , x = "Country")
```

![](UE_UFO_Sightings_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

``` r
ggplot (sightings_per_uecountry, aes (x = reorder (region, -percentage), y = percentage)) + 
  geom_col (aes (fill = region)) + 
  theme(axis.text.x= element_text(angle = 45)) +
labs(title = "EU sightings per Region"
     , y = "Percentage of Sightings"
     , x = "Region")
```

![](UE_UFO_Sightings_files/figure-gfm/unnamed-chunk-16-1.png)<!-- --> \#
Conclusion Visualisations are very useful to draw some conclusions: Most
of the sightings were in northern Europe. Actually, as we can clearly
see from the graph “EU sightings per country” this conclusion is
somewhat inaccurate. In fact, many more sightings took place in England
than in the rest of Europe. This makes me think that there are actually
more sightings from the UK in the database, thus partially distorting
the results. Secondly, sightings have increased in recent years, but
even this conclusion is uncertain, as it is obviously difficult to find
data on sightings from many years ago. It is quite clear that most of
the sightings have occurred during summer periods. The reason is, in my
opinion, that in summer, the skies in Europe are clearer and therefore
easier to observe lights or possibly sightings.

# Possible improvements

It could be useful toredo the studies on Europe by dividing the English
sightings into (Wales, Ireland, Scotland). It would also be useful to
weight the number of sightings by the number of inhabitants of the
country. finally, it might be useful to look at the number of sightings
according to weather conditions.
