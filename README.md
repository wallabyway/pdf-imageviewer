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

## Steps to create your own:


### Pulling a Terrain map

To provide some sample content for my demo, I'm going to pull a tile-pyramid from [OpenMapView](https://www.openstreetmap.org), specifically, a terrain map, so I can demostrate the measure tool.

Here is my curl script:

``` 
curl openmaps.com -leaflet -folder outtiles -l 14 -x 100 -y 100
```

Now I modify the bubble.json file to point to the new folder containing all those image tiles.

When I open the index.html file, I now see my terrain map, which I can zoom in and out to get more terrain details. I can also add markup and measurements.

![dummyImage.jpg](dummyImage.jpg)

Here's a live demo: [TERRAIN DEMO]()



### Converting an OCR image

Say you have 'OCR / scanned' an image and got a really large .TIFF file, that you want to view in a browser.  It's too big and clunky by itself and... you want to add markup and measurements.

So, let's use the Forge Viewer to view it and use Forge Viewer's fast loading and built-in markup and measurement features...

I'll first need to convert the TIFF image to a jpeg tile-pyramid. I'll use [ImageMagik](imagemagik.com) to do this.

From the commandline, type in...

```
convert image.tif -resize 1.5625% -crop 256x256 +repage +adjoin out/1/tile_1_%d.jpg
convert image.tif -resize 3.125% -crop 256x256 +repage +adjoin out/2/tile_2_%d.jpg
convert image.tif -resize 6.25% -crop 256x256 +repage +adjoin out/3/tile_3_%d.jpg
convert image.tif -resize 12.5% -crop 256x256 +repage +adjoin out/4/tile_4_%d.jpg
convert image.tif -resize 25% -crop 256x256 +repage +adjoin out/5/tile_5_%d.jpg
convert image.tif -resize 50% -crop 256x256 +repage +adjoin out/6/tile_6_%d.jpg
convert image.tif -crop 256x256 +repage +adjoin out/7/tile_7_%d.jpg
```

Then copy and update the bubble.json file, so that it points to the out/z/y/x.jpg path.

Now open the index.html file and you should see the following:

![](example.jpg)



1. We use the following imageMagik script to convert a large TIF image into the tiles.  Each level of detail will be put into it's own seperate folder (z-index).

> imagemagik large-image.tif -leaflet -o myimages

2. Then we need to prepare the Forge Viewer to use these files in 'offline mode'.

All we need is a bubble.json file along with the leaflet folder.

Here it is:
```bubble.json
```

3. View it in the viewer !  [DEMO](https://wallabyway.github.io/pdf-imageviewer/)
