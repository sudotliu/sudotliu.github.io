---
title: "Popular Opinion Polling (POP)"
order: 2
date:   2024-06-24 20:28:00 -0700
excerpt: "[2015-2019] Side venture startup with a mission to socialize polls as a way for people to learn more about their friends and popular opinion"
classes: wide
header:
  teaser: /assets/images/pop/logo.png
sidebar:
  - title: "Team POP LLC"
    image: /assets/images/pop/logo.png
    image_alt: "POP logo"
    text: "My first startup"
  - title: "Role"
    text: "Technical Cofounder"
  - title: "Period"
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
---

{% include gallery caption="iOS App Store previews for POP" %}

The year was 2015. While maintaining our full-time day jobs, an old friend,
<a href="https://www.linkedin.com/in/jgarg/" target="_blank">Jay Garg</a>,
and I embarked on our first startup adventure, a move that profoundly shaped my
engineering career. At that time, while enhancing my backend skills at
work, I was also keen to explore the rest of the tech stack, and this project proved to be the
perfect catalyst. Although I was already familiar with HTML, CSS, and JavaScript from creating
static websites in school, I still had much to learn about integrating these technologies with a
backend effectively. It's strange to think about now, but learning AJAX and jQuery were near the top of my
to-do list back then.

We met for coffee and Jay pitched me on the idea of building a social network that focused on polls
as the main format of content and means of communication. While we considered how we might make a
business of it down the road, we were primarily focused on learning and building something fun and
engaging. It wasn't long at all before I was crossing all sorts of things off from my learning to-do
list as we got to work building our initial prototype.

We knew that it was going to be a much better fit as a mobile application in the long term but we
could launch it to the web much faster given our skills at the time. We built the prototype on AWS
Elastic Beanstalk using a simple Go REST API, PostgreSQL DB, Go HTML templates, and a
Bootstrap-styled frontend. This was back when React was just starting to gain more attention among
the many blossoming frontend frameworks, but we kept things simple as we tackled other new
challenges like implementing a means of authentication (Authboss) and email delivery (Mailchimp).

Iterating on our web application enabled us to pick up new skills and refine the product features
over the coarse of a year or so. I had been keeping an eye on the shifts in frontend technology and
we reached an inflection point in early 2016 when we decided to rebuild everything in React Native
for several reasons:
- We had a more clearly-defined MVP and were ready to push past prototyping
- Managing media queries to support both desktop and mobile web views had become taxing
- React was growing in popularity and we bet on it becoming a leading frontend technology
- React Native gave us a way to produce two native apps with one unified codebase
- User interviews suggested that a native mobile app was far more important than having a desktop
  experience at all

As you can imagine, we did not take rebuilding roughly a year's worth of work lightly and there was
extensive time spent on research prior to landing on React Native as the direction to take. The more
I read into the philosophy behind both React and React Native though, the more clear it became that
it was the way to go. It is perhaps one of the best bets I've ever made as it paid off in dividends
given React's monumental rise to popularity in the years that followed.

![Mandalorian this is the way image](/assets/images/pop/way.jpg){: .align-center}

While we were initially rebuilding for feature parity with the web application, Jay came up with a
really brilliant product change to allow user submission of an optional URL along with their poll.
Suddenly, what was previously a very plain text post of a question and answers now had the ability
to become a rich view of metadata regarding a news piece or article that the poll could be based on.
We learned countless things on this journey but one of the most surprising was still the concept of
the <a href="https://ogp.me/" target="_blank">Open Graph protocol</a>, which is largely what made
this new idea feasible. We leveraged that to extract the metadata we needed to render a much more
lively view of content alongside each poll that offered it.

Our new main codebase was a React Native application but this time we decided to use Firebase as our
primary datastore as it also simplified things like user account management and authentication flow.
We converted our previous web application into a simple marketing page and set up a new private web
application for administrative purposes; compared to shelling into a Postgres DB with `psql`,
Firebase was less easy and flexible to query against, so we needed an interface that would allow
actions like loading new content en masse. Firebase presented some new challenges but it also
provided us with interesting new serverless capabilities like "Cloud Functions". We wrote a few in
TypeScript to run asynchronous tasks like managing logic triggers and push notifications for events
like friend requests, new poll submissions, etc.

<div style="display: flex; align-items: center;">
  <div style="flex: 2; padding-right: 20px;">
    <img src="/assets/images/pop/ios12.png" alt="Poll results screenshot" style="max-width: 100%;">
  </div>
  <div style="flex: 2;">
    <p>
      Of course, it took some time to learn React and figure out how app building and testing should work
      since the mobile app ecosystem was different from web in a number of ways, but we were
      soon enjoying the benefits of developing a native mobile application. Bye-bye, media queries!
      ...hello, different device sizes and orientations? 😵‍💫
      <br/><br/>
      One of the main downsides of being so early to use React Native was that we were somewhat
      limited in our ability to express more complex UX based on what React Native libraries were 
      available. One such challenge came up when we were trying to render the poll results as something like a pie chart,
      and we ended up repurposing a circular progress bar component to accomplish this.
      Shout out to
      <a href="https://www.npmjs.com/package/react-native-circular-progress" target="_blank">
        react-native-circular-progress
      </a>! (version 0.2.0) 😅
    </p>
  </div>
</div>

<div style="display: flex; align-items: center;">
  <div style="flex: 2;">
    <p>
      One of our goals from the very beginning was to have a social element and here is an example
      of how we ended up delivering that. The idea was to compare poll results with friends, and this feature was one of
      my favorite to "dog-food" because it often sparked fun debates whenever folks learned something new about each other.
      <br/><br/>
      This was clearly also around the time we took our UI design skills to a whole new level.
      I remember thinking there was something magical about the simplicity of our positive / negative sentiment face
      indicators in these comparisons. As I recall, Jay created the negative face (of utter shock and dismay) by
      literally just flipping the smile upside down – talk about efficient design!
    </p>
  </div>
  <div style="flex: 2; padding-left: 20px;">
    <img src="/assets/images/pop/ios13.png" alt="Polls comparison screenshot" style="max-width: 100%;">
  </div>
</div>

<div style="display: flex; align-items: center;">
  <div style="flex: 2; padding-right: 20px;">
    <img src="/assets/images/pop/pie.png" alt="Polls comparison v2 screenshot" style="max-width: 100%;">
  </div>
  <div style="flex: 2;">
    <p>
      With each iteration of the app, our features grew in sophistication. With the addition of poll category tags, for example, the comparison view could provide both a comprehensive score as
      well as a breakdown by category. Something we didn't get to solve for was the fact that the
      more polls two people answered, the more stale their match results would become since each additional poll would contribute less and less toward affecting their overall match.
      <br/><br/>
      We solved that issue on paper by saying we could scope comparisons by time window as well, but
      the even bigger question became what the overall match score really meant. We considered applying
      different weights to categories depending on what a person deemed more important and we even half-jokingly considered what a high overall match would mean for someone's dating life.
    </p>
  </div>
</div>
<br/>

<div style="display: flex; align-items: center;">
  <div style="flex: 2;">
    <p>
      Of all the trials and tribulations we faced, none are as memorable as perfecting the main feed.
      Only when you build your own do you realize how much you have taken other world-class feed
      experiences for granted. We did eventually up with a very elegant feed experience that solved
      for all of these issues but here are the top reasons it kept me up some nights:
    </p>
    <ul>
      <li>must coordinate pagination and scrolling</li>
      <li>should scroll "infinitely" (or to last post)</li>
      <li>must manage complex feed state carefully</li>
      <li>should retain feed position through navigation</li>
      <li>scroll speed and momentum must feel natural</li>
      <li>rapid scrolling must not cause issues</li>
      <li>pulling down past top post should refresh feed</li>
      <li>pressing "Feed" tab again should scroll to top</li>
    </ul>
  </div>
  <div style="flex: 2; padding-right: 20px; display: flex; justify-content: center;">
    <img src="/assets/images/pop/demo.gif" alt="POP app feed demo" style="max-width: 100%;">
  </div>
</div>
<br/>

For the vast majority of the time we spent working on the React Native app, we intentionally focused
solely on the iOS experience. This not only allowed us to test on our personal devices but it let us
avoid getting caught up in balancing platform differences before we even knew what was going to make
it into the final product. It wasn't until we were ready to publish the iOS app that we even began
to look at Android. After amassing 2+ years of iOS-oriented code, I was a little nervous about what
work awaited us to actually produce a feature-equivalent Android app but this is where React Native
*really* paid off beyond our wildest dreams (and believe me, we were quite literally dreaming about
this stuff at that time). We were ready to deploy an equivalent Android app to the Google Play store
within a month of starting on it. The biggest obstacles were the differences in navigation and
routing mechanisms, which did take quite a while to reconcile generically but there was nearly no
other platform-specific work needed beyond that.

In the end, the hardest lessons learned had less to do with "how" to build it and more to do with
"why" and "for whom", but those can be topics for another post about startups in general. We
did successfully publish the app to both stores and maintain it for some time, but we ultimately did
not see enough meaningful engagement and decided to shutter the project in 2019. Despite that, I
will never regret a single late night or busy weekend spent on this maiden voyage, because the true
value we built has stayed with us to this day as knowledge gained and bonds formed. Besides, I think
we did okay for something that basically started as a means to learn more.
