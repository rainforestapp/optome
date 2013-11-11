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
