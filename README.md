# SummusTakeHome
Take home project for SUMMNUS

Completed in 4 hours over 2 days

There were a couple of design decisions taken for brevity
- On the home page, I pull down all the users to display their name (do this by filtering on matching id) - I think a cleaner way to implement this would be with lazy loading where you pull down the author name before a post enters the users view
- On the detailed author page when displaying all the photos in the future I would have liked to display a grid of all the albums with a thumbnail image of the first photo in that album, then when selecting that it would take you to a view displaying all the images in that album, when selecting a photo here it would display the full size image.
- This would also change the networking architecture a bit since you could pull down images filtered on the selected album reducing load
- Given more time I would've chained the requests from getAlbums() and getPhotos() a bit more cleanely, right now it is fairly "brute forced"
- Given more time I would break out the UI into being more modular and standardize certain view elements
