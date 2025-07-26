import tkinter as tk
from PIL import Image, ImageTk # Requires pillow library

# Create the main window
window = tk.Tk()
window.title("Window with Wallpaper")
window.geometry("2560x1440")

# Load the background image
image = Image.open("Assets/Wallpapers/defaultwallpaper.png")  # Replace with your image file
background_image = ImageTk.PhotoImage(image.resize((2560, 1440)))  # Resize to fit window

# Create a label to hold the background image
background_label = tk.Label(window, image=background_image)
background_label.place(x=0, y=0, relwidth=1, relheight=1)

# Start the event loop
window.mainloop()
