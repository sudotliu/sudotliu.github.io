---
title: "Bonsai Metric Tree"
order: 3
published: false
excerpt: "[2020] Side project with a mission to create a SaaS tool for improved project planning and metric roll-ups"
classes: wide
header:
  teaser: /assets/images/bonsai/logo.png
sidebar:
  - title: "Role"
    text: "Technical Cofounder"
  - title: "Period"
    text: "2020"
---

This project spanned mid to late 2020 and was another idea initially dreamt up by 
<a href="https://www.linkedin.com/in/jgarg/" target="_blank">Jay Garg</a>.

By this point in our careers we had both seen project planning done in a number of ways and the
common denominator was that they all seemed insufficient. There was a lack of **precision**,
**adaptability**, and **detail** in most planning processes, and we set out to solve this.

"Bonsai" was born shortly after as we imagined a "metric tree" that would enable you to break down
anything into its more basic components so that you could estimate those simpler components and have
it compute the final top-level result. You can't improve something that you can't measure, and
almost anything worth solving can be measured in some way. The easiest things to measure or estimate
are typically simpler and at the bottom of the tree you're thinking about. Based on these
assumptions, we solved for **precision** by making everything about numbers, specifically the low-level
numbers or the "leaves" of the tree.

We solved for **adaptability** by making it so that you could add a new leaf node anywhere or change any
values at any time. Once you did that, the tree would be recomputed where necessary to reflect the
new values. Plans change all the time and this was our way to ensure that we can always adjust our
understanding of the metrics based on new estimates or insights.

To add an extra level of **detail**, we had planned to solve for cases where a number of projects
could affect any number of nodes outcomes. For example, you could define a project "A" that affects
node 1 by 10% and node 2 by 5% and a project "B" that affects node 3 by 20%. If your team could only
choose one project to do between the two of them, being able to see the final outcome for either
project would make for a quick comparison and decision. Of course, all of this is assuming that your
baseline estimates and percentages of impact are correct in the first place, which becomes the new
challenge. As tough as those details are to get right, we found that better than sticking a wet
finger in the air and saying "the wind is blowing this way".

Here is what the product ended up looking like:
[![Bonsai metric tree simple example](/assets/images/bonsai/ex_tree.png)](/assets/images/bonsai/ex_tree.png)


- bonsai
    - Conda, Django, Python, React, Docker, AWS, GCP

- walker_tree
    - add python tests
    - open source code - pending response from UNC re: license
        - update README based on response
    - create TS version and create open source org tree app?
      - better yet, create something with algo embedded that allows open specification of what the React node looks like


This quickly generalized into a solution that could roll up any kind of metric or render metadata
for any kind of tree.


[![Bonsai metric tree ARR example](/assets/images/bonsai/arr_example.png)](/assets/images/bonsai/arr_example.png)
