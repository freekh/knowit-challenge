# KnowIt Challenge by Fredrik Ekholdt


## Remarks
- I ran and tested this on XCode 7.3.1 - since this is not my dev machine, I didn't want 
to spend time on upgrading (the OS and XCode).
- Could have used a Navigation Controller to do navigation, but started with a simple view 
and kept going.
- Could have used a CollectionViewController (?) to handle the first view with the photos, 
but went with constraints since I started on that path. 
- Could have used some sort of Promise/Future library to handle downloads, but ended up 
with a NSURLSessionDownloadDelegate.
- Could not test the calling because I don't have an iPhone and apperently opening tel:// 
doesn't in the Simulator.
- In Swift 2.2 the Mark "pragmas" should be as I have written them, but they didn't seem to work 
my version of XCode.
- Since this is an exercise I didn't pick very descriptive names for the View Controllers.
- There's a comment about the country codes and why I don't use them. I figured it is OK 
for this exercise.
- Honestly, it took me a bit longer than the 4 hours (more like 8) - if that invalidates 
this challenge so be it. It was fun to discover Swift though the hardest part by far was 
figuring out Interface build and constraints (see my comment on CollectionViewController). 
I must have not been able to communicate well enough that I am not a Mobile dev. 
- Finally, this is my first time with Swift and last time I actually did anything in 
Interface Builder there was only one screen size for iOS devices.


