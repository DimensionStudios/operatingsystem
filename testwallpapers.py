import tkinter as tk
from PIL import Image, ImageTk

window = tk.Tk()
window.title("Window with Wallpaper")
window.geometry("2560x1440")

image = Image.open("Assets/Wallpapers/defaultwallpaper.png")
background_image = ImageTk.PhotoImage(image.resize((2560, 1440)))

background_label = tk.Label(window, image=background_image)
background_label.place(x=0, y=0, relwidth=1, relheight=1)

window.mainloop()
