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

The year was 2015. While maintaining our full-time day jobs, an old friend and I embarked on our
first startup adventure, a move that profoundly shaped my engineering career. At that time, while
enhancing my backend skills at work, I was also keen to explore the rest of the tech stack, and this
project proved to be the perfect catalyst. Although I was already familiar with HTML, CSS, and
JavaScript from creating static websites in school, I still had much to learn about integrating
these technologies with a backend effectively. It's strange to think about now, but learning jQuery
was near the top of my to-do list back then.

The idea for the app was to build a social network that focused on polls as a primary format of
content and means of communication. While we talked about how we might make a business of it down
the road, we were really just focused on learning and building something fun and engaging. It wasn't
long at all before I was crossing off "learn jQuery" from my to-do list as we got to work building
our initial prototype as a web application.

We knew that it was going to be a much better fit as a mobile application in the long term but we
also knew that we could launch it to the web far faster given our skills at the time. We built the
original web application on AWS Elastic Beanstalk using a simple Go REST API, PostgreSQL DB, Go HTML
templates, and a Bootstrap-styled frontend. This was back when React was just starting to gain more
attention among the many blossoming and competing frontend frameworks so we kept things simple as we
tackled other new challenges like implementing a means of authentication (Authboss) and email
delivery (Mailchimp).

Iterating on our web application enabled us to pick up new skills and evolve the product. Meanwhile,
I had been keeping an eye on the shifts in frontend technology at the time as well and we reached an
inflection point in early 2016 when we decided to rebuild everything in React Native for several
reasons:
- React was growing in popularity and we bet on it becoming a leading frontend technology
- We had a more clearly-defined MVP and were ready to push past prototyping
- Managing media queries and supporting both desktop and mobile web experiences became taxing
- User interviews suggested that delivering a native mobile experience might be more important than
  having a desktop experience at all

As you can imagine, we did not take rebuilding roughly a year's worth of work lightly and there was
extensive time spent on research prior to landing on React Native as the direction to take. The more
I read into the philosophy behind both React and React Native at the time though, the more clear it
became that it was the way to go. It is perhaps one of the best bets I've ever made as it is still
paying dividends to this day.

![Mandalorian this is the way image](/assets/images/pop/way.jpg){: .align-center}

While we were initially mostly rebuilding for feature parity with the web application, my cofounder
came up with a really brilliant product pivot which was to allow user submission of an optional
URL along with their poll. Suddenly, what was previously a rather plain text post of a question and
answers now had the ability to become a rich view of metadata regarding a news piece or article that
the poll could be based on. We learned countless things on this journey but one of the most
surprising still has to be the concept of the <a href="https://ogp.me/" target="_blank">Open Graph
protocol</a>, which is largely what made this new idea feasible. We leveraged that to extract the
metadata we needed to render a much more lively view of content alongside each poll that offered it.

Our new main codebase was a React Native application but this time we decided to use Firebase as our
primary datastore as it also simplified things like user account management and authentication flow.
We converted our previous web application into a simple marketing page and set up a new private web
application for administrative purposes; compared to shelling into a Postgres DB with `psql`,
Firebase was less easy and flexible to query against, so we needed an interface for administrative
tools that would allow actions like loading new content en masse. Firebase presented some new
challenges but it also provided us with interesting new serverless capabilities like "Cloud
Functions". We wrote a few in TypeScript to run asynchronous tasks like managing logic triggers and
push notifications for events like friend requests, new poll submissions, etc.

<div style="display: flex; align-items: center;">
  <div style="flex: 2; padding-right: 20px;">
    <img src="/assets/images/pop/ios12.png" alt="Poll results screenshot" style="max-width: 100%;">
  </div>
  <div style="flex: 2;">
    <p>
      Of course, it took some time to learn React and figure out how app building and testing should work
      since the mobile app ecosystem was a little different from web in a number of ways, but we were
      soon enjoying most of the benefits of developing a native mobile application. Bye-bye,
      media queries! ...hello, different device sizes and orientations? 😵‍💫
      <br/><br/>
      One of the main downsides of being so relatively early to use React Native was that we were somewhat
      limited in our ability to express more complex UX based on what React Native libraries were readily
      available. One such challenge came up when we were trying to render the poll results as a pie chart
      as shown on the left here. We ended up repurposing a circular progress bar component to accomplish this! 😅
    </p>
  </div>
</div>

<div style="display: flex; align-items: center;">
  <div style="flex: 2;">
    <p>
      One of our goals from the very beginning was to have a social element and here is an example
      of how we ended up delivering that. The idea here was to be able to compare your poll results against
      a friend's. This feature was quite fun to test as we started to learn things we didn't know about
      each other.
      <br/><br/>
      This was also around the time we took our UI design skills to a whole new level. I remember thinking there was something magical about the simplicity of our positive and negative sentiment faces used as quick indicators in these comparisons. If I recall correctly, my cofounder created the negative face (of utter shock and dismay) by literally just flipping the smile upside down – talk about efficient design!
    </p>
  </div>
  <div style="flex: 2; padding-left: 20px;">
    <img src="/assets/images/pop/ios13.png" alt="Polls comparison screenshot" style="max-width: 100%;">
  </div>
</div>

<div style="display: flex; align-items: center;">
  <div style="flex: 2; padding-right: 20px; display: flex; justify-content: center;">
    <img src="/assets/images/pop/demo.gif" alt="POP app feed demo" style="max-width: 100%;">
  </div>
  <div style="flex: 2;">
    <p>
      The main feed was one of the most challenging areas to get right. Only when you build your own
      feed do you realize how much you have taken other world-class feed design experiences for granted. Just a few of the reasons the feed kept me up at night:
    </p>
    <ul>
      <li>must coordinate pagination and scrolling</li>
      <li>scrolling should work "infinitely" (or to last post)</li>
      <li>complex feed state must be managed carefully</li>
      <li>should retain feed position through navigation</li>
      <li>scroll speed and momentum must feel natural</li>
      <li>rapid scrolling should not cause issues</li>
      <li>pulling down past top post should refresh feed</li>
      <li>when already on "Feed", pressing "Feed" tab should scroll to top</li>
    </ul>
  </div>
</div>
<br/>

For the vast majority of the time we spent working on the React Native app, we focused solely on the
iOS experience, partly because that allowed us to test on our personal devices. It was also an
intentional strategy to focus on only one platform first and avoid getting caught up in balancing
platform differences before we even knew what was going to make it into the final product. It wasn't
until we were ready to make the app public that we even began to look at the Android side of things.
After building up 2+ years of iOS-optimized code, I was a little nervous what it was going to take
to actually produce a feature-equivalent Android app but this is where React Native *really* paid
off beyond our wildest imaginations. We were ready to deploy the finished Android app to the Google
Play store within a month of starting on it.

Some of the harder lessons learned had nothing to do with how to build it so much as "why" and "for
whom", but those are stories for another post. We ultimately did not see much meaningful engagement
and decided to shutter the project in 2019, but I will never regret a single late night or busy
weekend spent on this maiden voyage. In the end, the true value we built has stayed with us as
knowledge gained and bonds formed. I think we did okay for something that basically started as a
reason to learn jQuery.