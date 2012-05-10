#Image Lazy Loader

Felipe Ribeiro <felipernb@gmail.com>

This script allows you to load your page with low resolution images and substitute them by the hi-resolution ones just when needed (i.e. as soon as the image becomes visible in the initial load and when scrolling), saving bandwidth

It uses vanilla JavaScript and doesn't require any dependency. 

## how to use
Load the lazy_loader.js in your page, and all the images that should be replaced when necessary should look like this:

```
 <script src="lib/lazy_loader.js" async></script>
 ...
 <img src="low.jpg" class="low_res" data-img-src="high_resolution_image.jpg"> 
 ...
```
##Browser compatibility

Tested on:
 * Chrome 18 - OK
 * Safari 5.1.5 - OK
 * Firefox 12 - OK
 * Opera 11.64 - OK
 * IE 10 - OK
 * IE 9 - FAIL :(
 * IE 8 - FAIL :(