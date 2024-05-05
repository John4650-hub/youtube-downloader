import os
invalid_char=[' ','-',"`",'"',"+",'=','~','&','%','*',"'","/",'#']
def rename_mp4_files():
    # Get all files in the current directory
    files = os.listdir('.')

    for file in files:
        # Check if the file is an MP4 file
        if file.endswith('.mp4'):
            # Replace white space with underscore in the file name
            new_name=file
            for ch in invalid_char:
                new_name = new_name.replace(ch, '_')

            # Try to rename the file
            try:
                os.rename(file, new_name)
                print(f"Renamed '{file}' to '{new_name}'")
            except OSError as error:
                print(f"Error renaming file {file}: {error}")

if __name__ == "__main__":
    rename_mp4_files()
