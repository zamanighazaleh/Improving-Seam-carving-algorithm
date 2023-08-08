# Improving-Seam-carving-algorithm
An attempt to improve seam-carving algorithm using depth-aware saliency map
# What is seam carving?
Seam carving is a gradient-based algorithm for content-aware image resizing. This allows image to be resized without losing meaningful content from cropping or scaling.
# Why do we want to improve it?
If there is an object in image that has lower energy than image background, seam carving will remove the object and keeps the background.
# How to improve it?
We use a combination of depth-based seam carving and image scaling algorithms. It improves the result and preserves image details.

# Requirements
Matlab 
