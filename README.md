# DCS-Kneeboards
Extensive set of kneeboards for DCS World.

# General information
I've spent many hours compiling kneeboards for most planes and helicopters in DCS.  I've tried to cover things that are most critical for each one, the kind of things you most need to know if you're jumping into a plane after not flying it for a while.  **These are not a substitute for the manual, or for Chuck's Guides** (although they are based on those and other sources), but are intended as a quick reference guide to the most important functions while in flight.

# How to use
To use the kneeboard files in the game, they must be converted/exported to .png (or a couple other file formats, but I use .png).  Those image files are too large to go into this repo though, and anyway are strictly downstream of (that is, always the output of) these .odt files.  So to use these files in your DCS, you will need to convert them to .png.  To do so:

1. You will need to install **[LibreOffice](https://www.libreoffice.org/)**, a free and open-source MS Office equivalent.
2. Then you will need to create a subfolder called **pngs** in a module folder.
3. Run the **Convert odt in folder to png.bat** file, which calls LibreOffice with command line functions to automatically export the .odt files to .png in the pngs subfolder.
4. Finally, copy the .png files to the module folder in **C:\Users\<username>\Saved Games\DCS.openbeta\Kneeboard**.

The kneeboards will be available as soon as you spawn the plane.  (They are refreshed every time you spawn, so you can change and update the kneeboard folders without exiting the game, you just need to respawn the plane.)

# What is in the kneeboards
I've tried to cover most functions for every plane, including:
* Control configuration (**note that the controls are specific to my own HOTAS setup and mappings**, you will need to change them to match your own if you want)
* Cold start and preflight checklists
* Takeoff and landing procedures (including carrier procedures if applicable)
* Radio tuning
* Navigation, including creating/editing waypoints, and radio navigation
* Countermeasures
* A/A and A/G radar modes and radar usage
* TPOD usage
* All A/A and A/G weapons
* Other procedures that are specific to each module as needed

# Things to watch out for
**You run the .bat and .py files at your own risk!**  I've tried to make them safe, but **I make no promises or guarantees** that they will work, or that they won't overwrite or delete files they aren't supposed to.

The kneeboards are personalized to my own setup, and I've written them for my own personal use.  They are not fully comprehensive, nor are they complete, and in some cases they may not be fully accurate.  They may change at any time.  Feel free modify your own copies as you see fit, or use mine as a guide, whatever.  See the **Templates** folder for some blank template files, or just start with a copy and hack away.  I've tried to standardize on the format, but as that has evolved over time, some of the older kneeboards haven't been updated to the new format.

After some testing (see the Font Readability Test folder), I settled on DejaVu Sans Condensed as the font.  I believe that comes with LibreOffice, but if you don't have it, you should be able to [download it from somewhere](https://www.google.com/search?hl=en&q=dejavu%20sans%20condensed).  Font installation is outside the scope of this document.

The steps in the kneeboard may be greatly simplified or abbreviated, and I've written them with little to no regard for the "proper" or "correct" procedures in real life.  If that kind of thing is very important to you, these may not be what you want.
