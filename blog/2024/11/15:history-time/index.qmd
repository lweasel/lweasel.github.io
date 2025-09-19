---
title: 'TIL#1: Adding date and time to command line history'
date: 2024-11-14
permalink: /posts/2024/11/history-time/
tags:
  - til
  - bash
  - zsh
---

Inspired by [this](https://blog.stephenturner.us/p/learning-in-public) blog post by [Stephen Turner](https://stephenturner.us), I decided that I would start to record some of the new things (to me, that is!) that I learn, be they big or small.

So, a small thing to start. Yesterday I was trying to download some sequencing data from a facility, and couldn't help thinking that I'd already done this – which a quick search of my command line history confirmed. But I was also keen to know exactly _when_ I'd downloaded the data (mainly to confirm to myself how poor my memory is!), so wanted to print the entire history with dates and times attached. 

To cut to the chase, the incantation I was looking for is `fc -li 1`, which gives the command line history from the first event, with date and time in ISO8601 `yyyy-mm-dd hh:mm` format.

I was slightly surprised to find that I was to execute [`fc`](https://en.wikipedia.org/wiki/Fc_(Unix)) ("**f**ix **c**ommand", a built-in in both Bash and Zsh), rather than some variant of the `history` built-in (which I thought that I'd been using to look through the command line history since before time began). And I was slightly more surprised to find that `history` is actually just a built-in alias for `fc -l 1`. Reaching a (moderate) peak of surprise, I realised that this doesn't mean that an actual `history` built-in doesn't still exist – it can be accessed with `builtin history`.

Well, sort of – at least in Bash. For example, in Bash, `builtin history 100` shows me the last 100 commands executed, using the `history` built-in. However in Zsh, `builtin history 100` shows the whole command line history, starting at command number 100 – because (according to `man zshbuiltins`), the `history` built-in is the "Same as fc -l". So in Zsh, `builtin history 100` is just `fc -l 100`. But for `fc -l`, to show events offset from the current event one uses a negative number. So in Zsh, `builtin history -100` behaves the same as `builtin history 100` in Bash. I think.

Slightly confusing. Anyway, for now (in Zsh), I've made an alias `htime` to `fc -li 1`, and I'll just use that...
