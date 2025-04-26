import os

def read_files_from_directory(directory, extension):
    combined_text = ""
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(extension):
                file_path = os.path.join(root, file)
                with open(file_path, 'r', encoding='utf-8') as f:
                    combined_text += f"Folder: {root}\n" 
                    combined_text += f"File: {file}\n"  # Change this line
                    combined_text += f.read() + "\n"
    return combined_text

def write_to_file(file_path, text):
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(text)

def main():
    gml_directory = r"D:\PenguinIsleProject\Penguin Isles\objects"
    yy_directory = r"D:\PenguinIsleProject\Penguin Isles\objects"
    gml_output_path = r"C:\Users\Shorty\Downloads\combined_gml_files.txt"
    yy_output_path = r"C:\Users\Shorty\Downloads\combined_yy_files.txt"

    gml_combined_text = read_files_from_directory(gml_directory, ".gml")
    yy_combined_text = read_files_from_directory(yy_directory, ".yy")

    write_to_file(gml_output_path, gml_combined_text)
    write_to_file(yy_output_path, yy_combined_text)

    print("Files successfully combined and saved.")

if __name__ == "__main__":
    main()