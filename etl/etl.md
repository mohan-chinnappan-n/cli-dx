## Data Filter and Transform operations using CLI

- Note plugin is not yet released, will be released soon!

### Topics
- [Filter](#filter)
- [Transform](#transform)


<a name='filter'></a>
### Data file

```
$ cat  ~/datasets/netflix_titles.csv
```

```
$ head ~/datasets/netflix_titles.csv
show_id,type,title,director,cast,country,date_added,release_year,rating,duration,listed_in,description
s1,TV Show,3%,,"João Miguel, Bianca Comparato, Michel Gomes, Rodolfo Valente, Vaneza Oliveira, Rafael Lozano, Viviane Porto, Mel Fronckowiak, Sergio Mamberti, Zezé Motta, Celso Frateschi",Brazil,"August 14, 2020",2020,TV-MA,4 Seasons,"International TV Shows, TV Dramas, TV Sci-Fi & Fantasy","In a future where the elite inhabit an island paradise far from the crowded slums, you get one chance to join the 3% saved from squalor."
s2,Movie,7:19,Jorge Michel Grau,"Demián Bichir, Héctor Bonilla, Oscar Serrano, Azalia Ortiz, Octavio Michel, Carmen Beato",Mexico,"December 23, 2016",2016,TV-MA,93 min,"Dramas, International Movies","After a devastating earthquake hits Mexico City, trapped survivors from all walks of life wait to be rescued while trying desperately to stay alive."
s3,Movie,23:59,Gilbert Chan,"Tedd Chan, Stella Chung, Henley Hii, Lawrence Koh, Tommy Kuan, Josh Lai, Mark Lee, Susan Leong, Benjamin Lim",Singapore,"December 20, 2018",2011,R,78 min,"Horror Movies, International Movies","When an army recruit is found dead, his fellow soldiers are forced to confront a terrifying secret that's haunting their jungle island training camp."
s4,Movie,9,Shane Acker,"Elijah Wood, John C. Reilly, Jennifer Connelly, Christopher Plummer, Crispin Glover, Martin Landau, Fred Tatasciore, Alan Oppenheimer, Tom Kane",United States,"November 16, 2017",2009,PG-13,80 min,"Action & Adventure, Independent Movies, Sci-Fi & Fantasy","In a postapocalyptic world, rag-doll robots hide in fear from dangerous machines out to exterminate them, until a brave newcomer joins the group."
s5,Movie,21,Robert Luketic,"Jim Sturgess, Kevin Spacey, Kate Bosworth, Aaron Yoo, Liza Lapira, Jacob Pitts, Laurence Fishburne, Jack McGee, Josh Gad, Sam Golzari, Helen Carey, Jack Gilpin",United States,"January 1, 2020",2008,PG-13,123 min,Dramas,A brilliant group of students become card-counting experts with the intent of swindling millions out of Las Vegas casinos by playing blackjack.
s6,TV Show,46,Serdar Akar,"Erdal Beşikçioğlu, Yasemin Allen, Melis Birkan, Saygın Soysal, Berkan Şal, Metin Belgin, Ayça Eren, Selin Uludoğan, Özay Fecht, Suna Yıldızoğlu",Turkey,"July 1, 2017",2016,TV-MA,1 Season,"International TV Shows, TV Dramas, TV Mysteries","A genetics professor experiments with a treatment for his comatose sister that blends medical and shamanic cures, but unlocks a shocking side effect."
s7,Movie,122,Yasir Al Yasiri,"Amina Khalil, Ahmed Dawood, Tarek Lotfy, Ahmed El Fishawy, Mahmoud Hijazi, Jihane Khalil, Asmaa Galal, Tara Emad",Egypt,"June 1, 2020",2019,TV-MA,95 min,"Horror Movies, International Movies","After an awful accident, a couple admitted to a grisly hospital are separated and must find each other to escape — before death finds them."
s8,Movie,187,Kevin Reynolds,"Samuel L. Jackson, John Heard, Kelly Rowan, Clifton Collins Jr., Tony Plana",United States,"November 1, 2019",1997,R,119 min,Dramas,"After one of his high school students attacks him, dedicated teacher Trevor Garfield grows weary of the gang warfare in the New York City school system and moves to California to teach there, thinking it must be a less hostile environment."
s9,Movie,706,Shravan Kumar,"Divya Dutta, Atul Kulkarni, Mohan Agashe, Anupam Shyam, Raayo S. Bakhirta, Yashvit Sancheti, Greeva Kansara, Archan Trivedi, Rajiv Pathak",India,"April 1, 2019",2019,TV-14,118 min,"Horror Movies, International Movies","When a doctor goes missing, his psychiatrist wife treats the bizarre medical condition of a psychic patient, who knows much more than he's leading on."
```

### Filter spec
```
$ cat ~/tmp/filter-4.txt
```

```
listed_in.includes('Music')

```
### Run filter
```
$ sfdx mohanc:etl:filter -i ~/datasets/netflix_titles.csv -f ~/tmp/filter-4.txt 
```

### Filter output
```
...
{
  show_id: 's7785',
  type: 'Movie',
  title: 'Zulu Man in Japan',
  director: '',
  cast: 'Nasty C',
  country: '',
  date_added: 'September 25, 2020',
  release_year: '2019',
  rating: 'TV-MA',
  duration: '44 min',
  listed_in: 'Documentaries, International Movies, Music & Musicals',
  description: "In this documentary, South African rapper Nasty C hits the stage and streets of Tokyo, introducing himself to the city's sights, sounds and culture.\r\n"
}
...

```
<a name='transform'></a>

## Transform

### Transform Spec

```
$ cat ~/tmp/xf-1.json 

```

```json
{ 
  "rd":  "rating + ' ' +   duration",
  "ts":  "type   +  ' ' +  show_id"
  
} 
```

### Run Transform

```
$ sfdx mohanc:etl:transform -i ~/datasets/netflix_titles.csv -t ~/tmp/xf-1.json 
```

### Output
```
...
{
  show_id: 's7786',
  type: 'TV Show',
  title: "Zumbo's Just Desserts",
  director: '',
  cast: 'Adriano Zumbo, Rachel Khoo',
  country: 'Australia',
  date_added: 'October 31, 2020',
  release_year: '2019',
  rating: 'TV-PG',
  duration: '1 Season',
  listed_in: 'International TV Shows, Reality TV',
  description: 'Dessert wizard Adriano Zumbo looks for the next “Willy Wonka” in this tense competition that finds skilled amateurs competing for a $100,000 prize.\r\n',
  rd: 'TV-PG 1 Season',
  ts: 'TV Show s7786'
}
...
```


