import os
import random

os.chdir('..')
WALLPAPER_PATH = os.path.expanduser('~') + "/Pictures/Wallpaper"
file_list = os.listdir(WALLPAPER_PATH)
background_file = random.choice(file_list)
os.system("ln -sf " + WALLPAPER_PATH + "/" + background_file + " wallpaper-dark.jpg")

print("background set to " + background_file)
os.system('swww img ~/.config/hypr/wallpaper-dark.jpg')
