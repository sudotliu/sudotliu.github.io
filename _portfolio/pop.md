---
title: "Popular Opinion Polling (POP)"
excerpt: "(2015-2019) Side venture startup with a mission to socialize polls as a way for people to learn more about their friends and popular opinion"
classes: wide
header:
  teaser: /assets/images/pop/logo.png
sidebar:
  - title: "Team POP LLC"
    image: /assets/images/pop/logo.png
    image_alt: "game home screen"
    text: "My first startup"
  - title: "Role"
    text: "Technical Cofounder"
  - title: "Time Period"
    text: "2015 - 2019"
gallery:
  - url: /assets/images/pop/ios9.png
    image_path: assets/images/pop/ios9.png
    alt: "iOS App Store promo screen 1"
  - url: /assets/images/pop/ios10.png
    image_path: assets/images/pop/ios10.png
    alt: "iOS App Store promo screen 2"
  - url: /assets/images/pop/ios11.png
    image_path: assets/images/pop/ios11.png
    alt: "iOS App Store promo screen 3"
  - url: /assets/images/pop/ios12.png
    image_path: assets/images/pop/ios12.png
    alt: "iOS App Store promo screen 4"
  - url: /assets/images/pop/ios13.png
    image_path: assets/images/pop/ios13.png
    alt: "iOS App Store promo screen 5"
---

Back in 2015, an old friend and I embarked on our first startup journey and I am convinced to this
day that it had a tremendous impact on my trajectory as an engineer. Back then I was still finding
my way deep into backend work at my first job. Despite my passion and interest in backend work at
the time, I did not necessarily want to lose touch with developing my frontend skills. Coming out of
school, I was familiar with HTML, CSS, and JS as I had put together a few static websites through
school but there was so much left to learn on how the whole picture comes together. It's strange to
think about today but I still had learning jQuery on my to-do list back then.

The idea for the app was to build a social network that focused on polls as the primary format of
content and means of communication. While we talked lightly about things like how we might make a
business of it down the road, we were really just focused on building something fun and engaging.

It wasn't long at all before I was crossing off "learn jQuery" from my to-do list as we got to work
building our initial prototype as a web application. We knew that it was going to be a much better
fit as a mobile application in the long term but we also knew that we could launch it to the web far
faster. We built the original web application on AWS Elastic Beanstalk using a fairly simple Go REST
API, PostgreSQL DB, Go HTML templates, and a Bootstrap-styled frontend. This was back in a time when
React was just starting to gain more attention among the many blossoming and competing frontend
frameworks so we kept things simple as we tackled other new challenges like implementing a means of
authentication (Authboss) and email delivery (Mailchimp).

Iterating on our web application lasted for around a year as we continued to learn new skills and
evolve the product. I had been keeping an eye on the shifts going on in the frontend technology
scene and we reached a point in early 2016 when we made the big decision to rebuild everything
in React Native for several reasons:
- React was growing in popularity and we bet on it becoming a leading frontend technology
- We had a more clearly-defined MVP and were ready to push past prototyping
- Managing media queries and supporting both desktop and mobile web experiences became taxing
- User interviews suggested that delivering a native mobile experience might be more important than
  having a desktop experience at all

This second pass at building our app actually gave way to a few separate projects. The core codebase
was a React Native application but this time we decided to use Firebase as our primary datastore as
it also simplified things like user account management and authentication flow. We converted our
previous web application into a simple marketing site and set up a new private web application for
administrative purposes; since Firebase was a little less easy to query and manipulate as directly
as a Postgres DB with `psql` shell, we needed better interfaces for administrative tasks like
loading new content en masse. Now that we had the power of native mobile on our side, we also tapped
into other Firebase features like "cloud functions" for running asynchronous tasks like push
notifications for friend requests and new polls.


![POP App demo](/assets/images/pop/demo.gif)

{% include gallery caption="iOS App Store previews for POP" %}
