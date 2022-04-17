---
title: TIL - About certbot, nginx and http2 on port 80
lang: en
author: Andreas Kohler
date: 4th of April, 2022
description: "Wanna have a bad time? Put 'location 80 http2;' in your nginx file"
keywords:
  - certbot 
  - nginx
  - http2
  - port80
article:
  link: https://notes.andi-makes.dev/2022-04-04-til-certbot-http2/
  author-link: https://andi-makes.dev/

---

Today I wanted to move my [Conduit Server](https://conduit.rs/) to it's own subdomain from [https://andi-makes.dev](https://andi-makes.dev).
Why? Well, it apparently has something to do with CORS when also
hosting a client on the same domain.

> But Andi, you don't even host a client on your domain!

*Yet.* That's something I'd like to do (Cinny *is* looking fancy after all).

So, I set out to move the homeserver to https://matrix.andi-makes.dev. No problem,
I thought, just create a new nginx entry, configure TLS using certbot, and *poof*, done.

Well, I couldn't have been more wrong.

First of all, I forgot to create a DNS Entry for the subdomain. Certbot was complaining. Well,
that's an easy enough fix. Adding the required records, done.

Now, re-run certbot and profit. Well, certbot still wasn't happy, I was too fast, the 
DNS Records didn't propagate through. Well, just wait another minute or so, and try again.

And I tried again. Nevertheless, it didn't work. Certbot was complaining that traffic over
Port 80 used http2, which it doesn't support. Well then, I'll remove the http2 directive from
the nginx configuration, no problem, re-run certbot and I'm *finally* good to go, right?

WRONG. Certbot was still complaining. Still about http2. Didn't I restart nginx? I am sure I
did, but just try again. Well, no. Ok, let's try again. Certbot errors out again, but this
time because I got rate limited. Fair, I did "spam" a little bit. Let's enable the staging environment and debug.

After a lot of searching the internet and fooling around, I found 
[this stack overflow post](https://stackoverflow.com/questions/39453027/how-to-disable-http2-in-nginx).

Everything makes sense now. Nginx listens on Port 80, and if *any of your servers* is using
the http2 directive, *everything* is using http2. So, I removed every occurance of http2 
on my enabled sites. Tried again, and it worked. *Finally.*

Well, then just disable the staging environment and simply... oh wait. 
I'm still rate limited. For around an hour. What am I doing now? How to pass the time...

> I have an idea.

Huh? What is your idea?

> How about you write down your little Adventure?

You know what? Why not. Here we go.

