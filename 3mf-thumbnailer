#!/usr/bin/env python3

import sys
import zipfile

def main():
    # Check if the archive path and output path were passed as arguments
    if len(sys.argv) != 3:
        print('Usage: {} archive_path output_path'.format(sys.argv[0]))
        sys.exit(1)

    # Check if the file exists inside the archive
    with zipfile.ZipFile(sys.argv[1], 'r') as archive:
        if 'Metadata/plate_1.png' in archive.namelist():
            extract_file(archive, 'Metadata/plate_1.png', sys.argv[2])
        else:
            # Fallback to the largest PNG file if 'Metadata/plate_1.png' doesn't exist
            largest_png = find_largest_png(archive)
            if largest_png:
                print(f"Using fallback: Extracting the largest PNG file '{largest_png}'")
                extract_file(archive, largest_png, sys.argv[2])
            else:
                print("No PNG files found in the archive")
                sys.exit(1)

def extract_file(archive, file_path, output_path):
    # Extract the file to standard output without preserving the folder structure and save it to the specified output path
    with archive.open(file_path, 'r') as file:
        with open(output_path, 'wb') as output:
            output.write(file.read())
        print('File extracted successfully')

def find_largest_png(archive):
    png_files = [f for f in archive.namelist() if f.lower().endswith('.png')]
    if not png_files:
        return None

    largest_png = max(png_files, key=lambda f: archive.getinfo(f).file_size)
    return largest_png

if __name__ == '__main__':
    main()
