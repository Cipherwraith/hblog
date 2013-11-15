hblog
=====

Static HTML generator for minimal blogs. Write your posts using markdown and the blog is built automatically.

Current features:
* RSS Feed 
* Archives 
* Most Recent Posts 
* CSS Bindings

Quick Usage Directions:

1. Put your posts into the /posts/ directory. One post per file. The posts should be in the following format:
    
    > Line 1: Post Title

    > Line 2: Unix epoch timestamp of post creation date
    
    > Line 3: Author Name
    
    > Line 4 -> eof: Markdown of the post content

2. Setup the paths in the Config.hs file. Only need to edit the "siteDirectory" function to point to where your files are.

3. Edit the templates in the css and templates directories.

4. Run the following command to compile the blog into the "html" folder:

```haskell
runhaskell Main.hs
```
