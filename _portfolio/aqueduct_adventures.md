---
title: "2013: Aqueduct Adventures Mobile Game"
excerpt: "Mobile game produced for a university class project."
classes: wide
header:
  teaser: /assets/images/cs470/home_screen.png
sidebar:
  - title: "Cal Poly Pomona"
    image: /assets/images/cs470/home_screen.png
    image_alt: "game home screen"
    text: "Computer Science class project"
gallery:
  - url: /assets/images/cs470/menu_screen.png
    image_path: assets/images/cs470/menu_screen.png
    alt: "menu screen"
  - url: /assets/images/cs470/map_screen.png
    image_path: assets/images/cs470/map_screen.png
    alt: "map screen"
  - url: /assets/images/cs470/tool_tip_screen.png
    image_path: assets/images/cs470/tool_tip_screen.png
    alt: "tool tip screen"
---

This project was the result of course "CS 470 - Game Development", which was one of the most
rewarding classes I have ever taken as it taught me a surprising amount about what it takes to build
a product end-to-end.

Aside from the constraints of the technology to develop on (Corona SDK, Box2D, Lua) and what the
game's underlying theme should be about (the LA Aqueduct), we were given a lot of autonomy. We had
to come up with the idea for the game, the designs, gameplay mechanics, graphics, audio, code, etc.
Over the span of a single quarter (10 weeks), my team and I collectively spent hundreds of hours
outside of class and ended up building a fully functional game prototype for the Android platform
using technology that was completely new to us.

Our game was a puzzle-type game with a simple goal: manage the flow of water and retain as much as
possible. If enough water made it in time to the reservoir at the end of a level, you would advance
to the next level.

{% include gallery caption="Screenshots from actual game demo run on Android emulator." %}

There were two breakthroughs that I was personally responsible for that I am
particularly proud of even to this day as they required a level of open-ended creative
problem-solving that was rarely called upon in other classes.

The first breakthrough came when we needed to desperately figure out a way to simulate water flow
which was a slippery task (pun intended). We decided that using many small physics engine particles
could be a suitable way to do this and it proved reasonable enough in early testing. When it came
time to really flesh out the first level of the game, however, it became apparent that having a
starting and finishing reservoir of water "particles" was going to be extremely taxing to compute.
Every time we loaded the level, all of the water "particles" would be sitting there in the starting
reservoir bouncing against each other; this caused a rippling effect of interactions that quickly
compounded and slowed the game performance to an unresponsive crawl. Things would improve as the
water spread out while playing through the level but the same thing would happen once again at the
end of the level when the water accumulated in the ending reservoir.

We brainstormed and researched some very clever but sophisticated ways of making the water more of
an amorphous "blob" with fewer actual particles involved to cut back on the interactions but there
was no clear path on how to actually implement that and we were pressed for time. Eventually, it
dawned on me that our product was a game and not a real-life simulation and as such, we could simply
have the water particles be generated on-the-fly out of nowhere by the starting valve and then have
them disappear from the game engine altogether as soon as they reached the end reservoir. This
ultimately felt no different to the player as the perception of what was happening remained
virtually the same and yet this cut back vastly on the number of water "particle" interactions. Our
game ran incredibly smoothly after that.

[![Gameplay screenshot](/assets/images/cs470/gameplay_screen.png)](/assets/images/cs470/gameplay_screen.png)

The second breakthrough came as we got deeper into more advanced level design. To increase the level
of challenge and make use of more screen real estate for the game, we had to introduce turns in the
water pipes. Up to that point we had only experimented with straight lines as physical boundaries
and that was as simple as drawing a line with some coordinates as input with something like:
```lua
function PhysicsLineFactoryII:makePhysicsLine(x0,y0,x1,y1,tag)
```

As such, drawing straight vertical and horizontal pipes with a given width and height was also easy:
```lua
function PhysicsLineFactoryII:makeHorizPipeLine(x,y,w,h,tag)
  self:makePhysicsLine(x,y,x+w,y,tag);
  self:makePhysicsLine(x,y+h,x+w,y+h,tag);
end; 

function PhysicsLineFactoryII:makeVertPipeLine(x,y,w,h,tag)
  self:makePhysicsLine(x,y,x,y+h,tag);
  self:makePhysicsLine(x+w,y,x+w,y+h,tag);
end;
```

T-shaped pipes that merged horizontal and vertical pipes were a little trickier and also required an
orientation specification. I used compass directions at the time although in hindsight, perhaps
"top", "bottom", "left", "right" might have been more sensible:
```lua
function PhysicsLineFactoryII:makeNorthTPipe(x,y,w,h,tag)
  self:makePhysicsLine(x,y,x,y+h,tag);
  self:makePhysicsLine(x+w,y,x+w,y+h,tag);
  self:makePhysicsLine(x-w,y+h,x,y+h,tag);
  self:makePhysicsLine(x+2*w,y+h,x+w,y+h,tag);
  self:makePhysicsLine(x-w,y+2*h,x+2*w,y+2*h,tag);  
end;

function PhysicsLineFactoryII:makeSouthTPipe(x,y,w,h,tag)
  ...

function PhysicsLineFactoryII:makeWestTPipe(x,y,w,h,tag)
  ...

function PhysicsLineFactoryII:makeEastTPipe(x,y,w,h,tag)
  ...
```

The real challenge was in figuring out how to draw the right semi-circles and quarter-circles of
pipe for the turns. The first thing we reached for was a library package that could draw arcs but it
was imperfect since there was limited control over the exact shape. It was only able to draw simple
elliptical arcs connecting two points and this caused numerous issues in the game environment. These
shapes would not only take extensive time to try to position among the rest of our pipe structures
but the poor fitment meant that they would often either leave gaps so that water particles would
leak out of the pipe system or they would stick out and impede the flow of water unintentionally.

What we needed was a way to maintain a constant pipe width through the turn while also leaving it
easy to adjust the turn radius, pipe girth, and position of the turn. It also had to connect
seamlessly with other pipe segments so that no unwanted leaks or blockages would be introduced. I
distinctly remember white-boarding late into the night to solve our digital plumbing issue. The key
insight that led to the solution was realizing that two straight lines forming a `\/` shape is kind
of just a really badly drawn semi-circle. With three straight lines, you get a `|_|` shape which is
a little closer but still bad. After a few more drawings with a ruler on my whiteboard though, it
became clear that a semi-circle of reasonable enough smoothness was very feasible with enough line
segments.

I spent the remainder of that evening using geometry to derive the algorithm that would allow us to
much more easily draw our pipe turns and tested it using up to 12 line segments but realized the
difference between 8 and 12 was not really discernable in the app. Once I had the ability to make
any quarter turn of pipe I needed, I realized that any half-turn pipe would really just be two
quarter turns put together.

Looking back now, of course this code could almost certainly have been further refactored, less
hard-coded, etc. but we knew for our purposes we weren't going to revisit this logic much at all
once it was working so we moved on to actual level building to finish the project. This algorithm
not only removed certain buggy-feeling interactions from our gameplay but also allowed us to much
more rapidly churn out pipe layouts and levels after this point. We aced the project and final
presentation and it was a good lesson in how realistic projects with deadlines may make you
reprioritize what code quality means – in other words, when the stakes are real and time is a
factor, done well enough early is often better than done perfectly later.

```lua
-- y is inverted
-- r is the radius of the turn, not the pipe dimensions
function PhysicsLineFactoryII:makeNECurvePipe(x, y, r, g, tag)
  -- Using 8 line segments; can use more if needed
  -- Connects 9 points using circular intersections 
  -- divided by 5 in both x and y directions
  local d = r / 5;

  local y1 = y - math.sqrt(r^2 - (1*d)^2);
  local y2 = y - math.sqrt(r^2 - (2*d)^2);
  local y3 = y - math.sqrt(r^2 - (3*d)^2);
  local y4 = y - math.sqrt(r^2 - (4*d)^2);
  local y5 = y - math.sqrt(r^2 - (5*d)^2);
  local x6 = x + math.sqrt(r^2 - (3*d)^2);
  local x7 = x + math.sqrt(r^2 - (2*d)^2);
  local x8 = x + math.sqrt(r^2 - (1*d)^2);

  -- Outside curve
  cst = {
   { x, y-r, x+1*d, y1, },
   { x+1*d, y1, x+2*d, y2, },
   { x+2*d, y2, x+3*d, y3, },
   { x+3*d, y3, x+4*d, y4, },
   { x+4*d, y4, x6, y-3*d, },
   { x6, y-3*d, x7, y-2*d, },
   { x7, y-2*d, x8, y-1*d, },
   { x8, y-1*d, x+r, y, },
  };
  for j=1,#cst do
    local sh = cst[j];
    self:makePhysicsLine(sh[1],sh[2],sh[3],sh[4],tag);
  end

  -- g is girth of the pipe itself
  r = r - g;
  d = r / 5;

  local y1 = y - math.sqrt(r^2 - (1*d)^2);
  local y2 = y - math.sqrt(r^2 - (2*d)^2);
  local y3 = y - math.sqrt(r^2 - (3*d)^2);
  local y4 = y - math.sqrt(r^2 - (4*d)^2);
  local y5 = y - math.sqrt(r^2 - (5*d)^2);
  local x6 = x + math.sqrt(r^2 - (3*d)^2);
  local x7 = x + math.sqrt(r^2 - (2*d)^2);
  local x8 = x + math.sqrt(r^2 - (1*d)^2);

  -- Inside curve
  cst = {
   { x, y-r, x+1*d, y1, },
   { x+1*d, y1, x+2*d, y2, },
   { x+2*d, y2, x+3*d, y3, },
   { x+3*d, y3, x+4*d, y4, },
   { x+4*d, y4, x6, y-3*d, },
   { x6, y-3*d, x7, y-2*d, },
   { x7, y-2*d, x8, y-1*d, },
   { x8, y-1*d, x+r, y, },
  };
  for j=1,#cst do
    local sh = cst[j];
    self:makePhysicsLine(sh[1],sh[2],sh[3],sh[4],tag);
  end
end; 

function PhysicsLineFactoryII:makeNWCurvePipe(x, y, r, g, tag)
  ...

function PhysicsLineFactoryII:makeSWCurvePipe(x, y, r, g, tag)
  ...

function PhysicsLineFactoryII:makeSECurvePipe(x, y, r, g, tag)
  ...

function PhysicsLineFactoryII:makeSouthHorseshoePipe(x, y, r, g, tag)
  local offset = 2;
  self:makeSECurvePipe(x - offset, y, r, g, tag);
  self:makeSWCurvePipe(x, y, r, g, tag);
end; 

function PhysicsLineFactoryII:makeNorthHorseshoePipe(x, y, r, g, tag)
  ...

function PhysicsLineFactoryII:makeEastHorseshoePipe(x, y, r, g, tag)
  ...

function PhysicsLineFactoryII:makeWestHorseshoePipe(x, y, r, g, tag)
  ...
```