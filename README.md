#### about

Optome: Time Machine Backup for anything you've ever viewed on screen

1. a background app takes screengrabs at a set interval
2. the screen grabs shipped off to a private remote server where they are OCR'd and indexed
3. use a web interface to search for anything you've ever read on your screen

#### Tech 

- tesseract for OCR
- ElasticSearch for full-text search
- sidekiq/resque for farming out recognition tasks (they take a couple seconds per image)
- NLP libraries for cleaning up and correcting the raw data (tiny text winds up garbled, large text is recognized accurately)

requires tesseract, screencapture

tested on os x mavericks

#### known issues

- works very well on iOS Retina screen captures. 
- has not been tested on OS X Retina screen captures, but it should perform well there.
- small text, captured on standard-resolution displays, gets garbled.


#### sample

```
Dropbox Ii
Sponsored 9

Interested in helping perfect a product that
hundreds of millions of people see?

:3 Dropbox is Hiring!
Dropbox has over 200 million...
6'

hire.jobvite.corn

I‘ Like I Comment R Share
90 people like this.

2 Zack Morgan

l Write a comment...

E

News Feed Requests Messages Notifications More
```

![Dropbox Example](/sample/drop.png "Sample")


#### plan

Upload
======
0. forever, perform screencapture to a temp dir
1. send post request to rails server
2. rails controller sends message to model
3. model handles the update by kicking off an async job
4. async job takes photo as input,
    executes text recognition performing intermediate cleanup,
    creates photo thumbnails,
    finally: persists the data

Search
======
1. enter query in form
2. query kicks off async GET request to SearchController
3. SearchController performs full-text search by sending a message to a model that wraps ElasticSearch
4. Model queries ES, and uses the ES result to fetch photo data from RDBMS
5. Model returns collection data to controller (item, thumbnail url, jumbo url)
6. ItemExhibit corrals the model data into presentable format, returned to client as JSON
7. Client examines the json to display the result
