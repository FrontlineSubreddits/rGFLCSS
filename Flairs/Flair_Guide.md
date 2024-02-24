# Flair Guide
The first part is just a general guide to creating flairs including making them and sorting the CSS. The second section only covers r/girlsfrontline currently as it’s the additional steps to update the flair website. The only thing you really need is photo editing software, I use Paint.net personally.
All of the existing files and tools I use are included in the Flairs folder of https://github.com/ad3z10/rGFLCSS

## Part 1
1. Decide on your flairs – Whilst doing a small batch is possible, going through the process is a bit of a faff so I’d recommend doing a batch of 30-50 in one go. 
2. Locate source images
 - For GFL Costumes - In this case, you can make your life easy and grab the existing flairs from the game files, locate `resource_cardavatar.ab` and use the Asset Bundle Extractor to grab the character icons. `resource_cardavatar.ab` is found in the game files under `Android/data/com.sunborn.girlsfrontline.en/files/Android/New`. If you use IOS good luck bro. The file names probably will be scrambled with a bumch of numbers, use a regex search to find `cardavatar` somewhere in the folder. Open that file with the extractor, it'll probably yell about it being compressed, uncompress it, then open that file. Sort files by type and select all Texture2D files. On the right, hit plugins and export to PNG. Pick a folder and all your icons will be thrown there. Once you have them it’s simply a case of resizing them to 40x40px one by one, you may need some trial & error to find the best resampling option (I use Adaptive Best Quality).
 - Other Icons and cropping – Find a source of high res icons, preferably with background art, from either the wiki or some other page (I’ve used guides as a source in the past). Once you have all your base images, grab one into your editor and select a perfect square portrait of them, think about framing here to make sure you keep the essence of the character but be wary of zooming out too much as a lot of detail will be lost on compression. Also, be mindful that you’re going to lose 10% on each edge to the border.
Once you’re happy crop to selection and resize the image to 40x40px, I have an AutoHotkey script to do this in Paint.net called Flair.ahk that crops and resizes when you hit F1, you’ll appreciate the macro by the end of a batch.
3. Add the frame – add an appropriate frame as a new layer (use the mini ones which are already the correct resolution) then go to the base image and erase the bottom left corner. Finally, merge the layers and save it as a .png.
4. Create Sprite Sheet - Visit https://www.toptal.com/developers/css/sprite-generator/ and copy all of your images into the page, set padding to 0 with the style as top-down, save the sheet and name it something appropriate and add it to the subreddit through the CSS page.
5. Create CSS – You can do this manually by looking at another image batch but I have a program to partially automate the process called css.exe (incredibly basic source code also available). To use this, put your flair names (usually denoted by batch-character or batch-themeCharacter) one for each line into the file flair_list.csv in the same order as the sprite sheet then run the .exe and you’ll have a text file with the CSS. The last step is to add the prefix which will be in the form:

` .flair[class*="-batch-"]{background-image:url(%%spriteSheet%%);} `

Once you’re done, add the whole thing in a new line under the existing flairs. (Note – r/girlsfrontline has its CSS minified to save space, the full CSS is available on the GitHub which you will then need to minify before uploading it to the sub – Please push any changes you make to GitHub so that they aren’t overwritten).

6. Add Flairs to sidebar 
 - Not relevant for r/girlsfrontline! - go to the edit flair page then the user flair templates tab. On the bottom row put in the character name and the CSS flair class i.e. batch-character or batch-themeCharacter, If everything has been done correctly, the character's face should appear when you hit save.

## Part 2: GFL Flair Site shenanigans.
This is only relevant for r/girlsfrontline at this moment, you’ll want a code editor for this (VS Code or Notepad++), an understanding of Git and ideally some basic HTML knowledge. Start by making a fork or branch of https://github.com/xealiouth/xealiouth.github.io and doing a pull to your local machine.

6. Add flair images to the site
 - Grab your individual icons and chuck them all into the appropriate folder on your local machine e.g. costumes released in 2021 on CN would go into images/redditflair/costume/2021.
7. Update the html files – this is very manual I’m afraid. Work out if you need a new section in index.html or costume.html and create it as required. Create a blank entry in the form:
```
<a href="https://www.reddit.com/message/compose/?to=DinergateFlairBot&subject=flair&message=batch-theme, theme"
       target="_blank" class="image icon">
       <img src="images/redditflair/costume/2020/.png" alt="" />
       <h4> </h4>
</a> 
```
Then copy this for however many entries you need then fill in the details. Once you’re done, you should be able to open the HTML files with a web browser to ensure that they appear as intended. Finally, you can update the site note on index.html.
Once you’re done, push your changes and make a pull request.

8. Rename your flair_list.csv into something else then open up Flairs/FlairBot/ flair_list.csv in the rGFLCSS GitHub and add your flair names to the bottom of the list, next add a character name to each one of these and then send the file to Xeal on discord whilst nagging him to update the site. Please push your updated file to the rGFLCSS GitHub as well.
9. Once Xeal does his magic, you’re all set, just test to make sure things were configured correctly by testing a few of the new flairs.
