minimal-blogger
===============

The source code I use to generate the static html for my blog.

Quick Usage Directions:

* Put your posts into the /posts/ directory. One post per file. The posts should be in the following format:
    
    > Line 1: Post Title

    >Line 2: Unix epoch timestamp of post creation date
    
    > Line 3: Author Name
    
    > Line 4 - eof: Markdown of the post content

* Setup the paths in the Config.hs file. Only need to edit the "siteDirectory" function to point to where your files are.

* Edit the templates in the css and templates directories.

* Run the command [code]runhaskell Main.hs[/code]
