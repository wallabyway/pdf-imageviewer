# pdf-imageviewer

This demo of the Forge viewer, shows how you can load in a really really large image, cut up as a series of tiles, and load them into the viewer.

The large image (say a 10800 x 10800 TIF image), is sliced up into tiles, at different LOD's (level of details), to form what I call an 'image tile pyramid'.  Here's a diagram explaining:

Diagram of "Image Tile Pyramid"
![leaflet](https://user-images.githubusercontent.com/440241/43065838-5f3040a2-8ea6-11e8-967a-a25b6a4e3654.png)

## Steps to create your own:

1. We use the following imageMagik script to convert a large TIF image into the tiles.  Each level of detail will be put into it's own seperate folder (z-index).

> imagemagik large-image.tif -leaflet -o myimages

2. Then we need to prepare the Forge Viewer to use these files in 'offline mode'.

All we need is a bubble.json file along with the leaflet folder.

Here it is:
```bubble.json
```

3. View it in the viewer !  [DEMO](https://wallabyway.github.io/pdf-imageviewer/)
