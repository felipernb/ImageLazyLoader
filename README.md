#Image Lazy Loader

Felipe Ribeiro <felipernb@gmail.com>

This script allows you to load your page with low resolution images and substitute them by the hi-resolution ones just when needed (i.e. as soon as the image becomes visible), saving bandwidth

It uses vanilla JavaScript and doesn't require any dependency.

## how to use
Load the lazy_loader.js in your page, and all the images that should be replaced when necessary should look like this:

```
 <script src="lib/lazy_loader.js" async></script>
 ...
 <img src="low.jpg" class="low_res" data-img-src="high_resolution_image.jpg"> 
 ...
```
