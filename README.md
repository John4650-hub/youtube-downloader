<h2 style="font-family: Times New Roman; color:red;">YouTube Video Downloader</h2><hr />
<p>This is a simple youtube video downloader program written in python </p>

You will need to install **Pytube**
`pip install pytube`
<h3>Content</h3>
<ul>
    <li><a href="#video">About downloading videos and audios</a></li>
    <li><a href="#playlist">About downloading playlists</a></li>
    <li><a href="#exit">#How to stop the program.</a></li>
</ul>
<p>This program is capable of downloading;</p>
<ol type ='i'>
    <li>videos</li>
    <li>audios</li>
    <li>playlists</li>
</ol>
<h4>Steps to follow to download:</h4>
<h5 id = 'video'>Videos and Audios</h5><hr />
<ul>
    <li style="color:red;">url<sup>*</sup> </li>
    <dt>Paste the <b>url</b> of the video.</dt><br />
    <li style="color:blue">Optional Entry <sup>*</sup> </li>
    <dt>Next, leave this entry blank. </dt><br />
    <li style="color:green;">choose preferred itag <sup>*</sup></li>
    <dt>Both <b>video</b> and <b>audio</b> itags will be displayed and you will be required to choose only one from the list.</dt>
</ul>
<p>it will be done in a few seconds</p>
<h5 id="playlist">Playlist</h5><hr />
<ul>
    <li>url<sup>*</sup></li>
    <dt>Paste the playlist url and press enter</dt><br />
    <li>Optional Entry<sup>*</sup></li>
    <dt>Enter 'pl' lower-case and press enter.</dt><br />
    <li>3<sup>rd</sup> Entry<sup>*</sup></li>
    <dt>Enter 'i' to enter interactive mode or 'n' to download straight-away</dt><br />
    <li>In-interractive-mode<sup>*</sup></li>
    <dt>You will be required to select an itag for every single video in the playlist or 'skip' to skip the ones you don't want.</dt>
</ul>
#terminal sample

>Type in 'done' without quotes to humbly end this program.

>url: https://youtube.com/playlist?list=PLumYWZ2t7CRvdJJ206QarbisxYPAyYwj0

>type playlist if it is or leave blank: pl

>Enter 'i' to prompt interactive mode or 'n' for none-interactive-mode: i

>Title :How to Really Make a Phaser Game from Scratch! Part 1 - UNCUT

>choose video quality
  >>itag="17" ==> size: 8.71mb
  >>itag="18" ==> size: 35.78mb
  >>itag="22" ==> size: 75.93mb
>choose prefered itag or just type skip to skip to next: skip
>>Skipping video

>Title :How to Really Make a Phaser Game from Scratch! Part 2 - UNCUT

>choose video quality
  >>itag="17" ==> size: 3.06mb
  >>itag="18" ==> size: 13.07mb
  >>itag="22" ==> size: 29.52mb
>choose prefered itag or just type skip to skip to next: skip
>>Skipping video

>Title :How to Really Make a Phaser Game from Scratch! Part 3 - UNCUT

>choose video quality
  >>itag="17" ==> size: 4.83mb
  >>itag="18" ==> size: 21.49mb
  >>itag="22" ==> size: 42.72mb
>choose prefered itag or just type skip to skip to next: 18
>Download in progress
<p>lt will take some time depending on the size of the videos and speed of your network.</p>
<h6 id="exit">Closing / Exiting</h6>
After you have finished downloading whatever you wanted to, in the Entry for 'url' enter done and for the next entry leave blank
