# KnowIt Challenge by Fredrik Ekholdt

## Assignment
Develop an iPhone application, which from a user perspective consists of 3 different views. Each view
shall demonstrate a specific functionality. It should be possible to switch between each view. Each
views functionality shall be initiated by pressing a button. The application shall in principle follow
Apples guidelines regarding design and architecture.

### View no. 1.
Download and display 4 images from the Internet. The images shall be downloaded in parallel and
each image shall be displayed as soon as it has been downloaded. All images shall be fully viewable
on the screen at the same time. The Images shall be downloaded from different servers on the
Internet and it shall be indicated if the image is being loaded or if an error has occurred. The images
can preferably be fetched from different web pages.

### View no. 2.
The Phone Book shall be opened when pressing a button. It shall be possible to select a phone
number. The selected phone number shall be presented in a text input box.

### View no. 3.
It shall be possible to enter a phone number. The phone number shall be dialed when the user
presses a button. The phone number from view no. 2 shall be pre-entered. This view shall be
separated from view no. 2. A confirmation alert shall be shown to the user when the call is about to
be made, giving the user a chance to abort.

### General:
If you feel that anything is unclear, use your imagination to solve the task but be clear to inform us
that you filled out the blanks.


It is allowed to use Objective-C or Swift depending on your personal preferences. The
important thing for us is that you can show your programming skills. Be prepared to
describe and motivate the design decisions you have made.
We want to have the complete project sent to us to be able to evaluate the assignment. No flashy UI
is needed and standard components can be used.

## Remarks
- I ran and tested this on XCode 7.3.1 - since this is not my dev machine, I didn't want 
to spend time on upgrading (the OS and XCode).
- Could have used a Navigation Controller to do navigation, but started with a simple view 
and kept going.
- Could have used a CollectionViewController (?) to handle the first view with the photos, 
but went with constraints since I started on that path. 
- Could have used some sort of Promise/Future library to handle downloads, but ended up 
with a NSURLSessionDownloadDelegate.
- Could not test the phone calling because I don't have an iPhone and apperently opening tel:// 
doesn't work in the Simulator.
- In Swift 2.2 the mark "pragmas" should be as I have written them, but they didn't seem to work 
my version of XCode. I might be mistaken though.
- Since this is an exercise I didn't pick very descriptive names for the View Controllers.
- There's a comment about the country codes and why I don't use them. I figured it is OK 
for this exercise.
- Honestly, it took me a bit longer than the 4 hours (more like 8) - if that invalidates 
this challenge so be it. It was fun to discover Swift though the hardest part by far was 
figuring out Interface Builder/Storyboard and constraints (see my comment on CollectionViewController). 
I must have not been able to communicate well enough that I am not a Mobile dev. 
- Finally, this is my first time with Swift and last time I actually did anything in 
Interface Builder there was only one screen size for iOS devices.
