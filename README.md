# Forge as a Map/Terrain/OCR Viewer

Recently, I was asked if the Forge Viewer could view a large bitmap, like a scanned drawing, or a terrain-map.  Yes, it can and it's called a [Leaflet](leafletjs.com) view.

Using the viewer for large-images, let's you take advantage of the built-in markup and measure tools.  The same tools that BIM360 uses for PDF files.

### How does it work?

#### 1. Generating the tiles
Large images are broken up into 'tiles' of bitmaps, at different 'Levels of resolution', forming what I call a 'tile pyramid'.

Here's a 'tile pyramid' diagram...

![leaflet](https://user-images.githubusercontent.com/440241/43065838-5f3040a2-8ea6-11e8-967a-a25b6a4e3654.png)

At the top of the pyramid, level 0, a single tile, shows a blurry, low-resolution, version of the map-of-the-world image.

The next level down, level 1, the map-of-the-world is split into four tiles and the resolution is higher, less blurry.

Similarly level 2, we now have 16 tiles.  Sharper, more detail.

We keep going, generating many levels, and more image detail.

#### 2. Viewing the tiles

When a browser wants to view a city, say Paris, from google maps, it doesn't load the entire map of the world and every tile in the 'tile pyramid'.  It's too big.

Instead, the browser figures out the right 'level' in the pyramid, and only loads the tiles that are specific to Paris, at a resolution that fits our screen resolution.

#### 3. Faster UX

For a faster loading experience, the viewer, can  load, a low-quality 'preview' of the Paris tiles first, before loading the final tiles.  This is easy to do with a tile-pyramid.  Say Paris is at level 14.  First, load the single of paris, probably level 12, and stretch it to fill the screen (blurry).  Now, switch to level 13, then level 14 to show gradually sharper and sharper detail loading in.

That's what the Forge Viewer does.

### Offline Markup and Measure 

Included in this offline sample are the files needed for offline markup and measure.

Click on the measure tool and calibrate to get started.

Similarly, modify the CSS to create a custom markup UI.


## Pulling a Terrain map

To provide some sample content for my demo, I'm going to pull a tile-pyramid from OpenMapView, specifically, a terrain map, so I can demostrate the measure tool.

Here is my curl script:

``` 
curl openmaps.com -leaflet -folder outtiles -l 14 -x 100 -y 100
```


## Converting an OCR image

I have really large OCR image and I need to prepare it for the viewer, so I'll need to chop up the large image into tiles... specifically, a tile-pyramid.  I'll use [ImageMagik](imagemagik.com) for this.

From the commandline, I type:

```
> imagemagik large-OCR-file.tif -leaflet -folder outtiles
```


This is just to provid e
 Terrain or 
This demo of the Forge viewer, shows how you can load in a really really large image, cut up as a series of tiles, and load them into the viewer.

The large image (say a 10800 x 10800 TIF image), is sliced up into tiles, at different LOD's (level of details), to form what I call an 'image tile pyramid'.  Here's a diagram explaining:

Diagram of "Image Tile Pyramid"

## Steps to create your own:

1. We use the following imageMagik script to convert a large TIF image into the tiles.  Each level of detail will be put into it's own seperate folder (z-index).

> imagemagik large-image.tif -leaflet -o myimages

2. Then we need to prepare the Forge Viewer to use these files in 'offline mode'.

All we need is a bubble.json file along with the leaflet folder.

Here it is:
```bubble.json
```

3. View it in the viewer !  [DEMO](https://wallabyway.github.io/pdf-imageviewer/)
