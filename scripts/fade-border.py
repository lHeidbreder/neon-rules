#!/usr/bin/python
from PIL import Image, ImageDraw

def parse_arguments():
    from argparse import ArgumentParser
    parser = ArgumentParser(
                prog="Fade Borders"
                )

    parser.add_argument("-i", "--in-place", dest="in_place", action="store_true", default=False, help="Edit the file in place, thereby replacing the input file.")
    parser.add_argument("-w", "--fade-width", dest="fade_width", type=int, default=5, help="Manually set the fade width in percent. Default is 5.")
    parser.add_argument("input_file")
    parser.add_argument("output_file")

    global args
    args = parser.parse_args()

def fade_borders(image_path, output_path, fade_percent):
    image = Image.open(image_path).convert("RGBA")
    width, height = image.size
    
    alpha = Image.new("L", (width, height), 255)
    draw = ImageDraw.Draw(alpha)
    
    fade_width = width * fade_percent // 100
    # Calculate fading effect
    for i in range(fade_width):
        transparency = int(255 * (i / fade_width))
        
        # Top border
        draw.rectangle([(i, i), (width - i, i)], fill=transparency)
        # Bottom border
        draw.rectangle([(i, height - i), (width - i, height - i)], fill=transparency)
        # Left border
        draw.rectangle([(i, i), (i, height - i)], fill=transparency)
        # Right border
        draw.rectangle([(width - i, i), (width - i, height - i)], fill=transparency)
    
    # Put the alpha mask on the image
    image.putalpha(alpha)
    
    image.save(output_path, format='PNG')

if __name__=='__main__':
    parse_arguments()
    if args.in_place:
        args.output_file=args.input_file
    if args.output_file is None \
        or args.input_file is None:
        exit(1)
    
    fade_borders(args.input_file, args.output_file, args.fade_width)
