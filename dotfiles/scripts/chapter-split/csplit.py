#!/usr/bin/python3
import os
import subprocess
import sys
import json

EXT=".opus"

def main():
    src_filepath = sys.argv[1]
    target_dir = sys.argv[2]

    if os.path.exists(target_dir):
        raise RuntimeError("target directory already exists, aborting")

    chapter_data = get_chapters(src_filepath)
    print("chapter_data", chapter_data)

    # create target dir
    try:
        os.makedirs(target_dir)
    except IOError:
        raise RuntimeError("failed to create target directory")

    for i, chapter in enumerate(chapter_data['chapters']):
        print("Processing chapter: ", chapter['id'], chapter['tags']['title'])
        print("Chapter range: ", chapter['start'], chapter['end'])
        title = chapter['tags']['title']
        start, end = chapter['start_time'], chapter['end_time']
        out_file = get_file_name(target_dir, title)

        command = ["ffmpeg", '-i', src_filepath,
                   '-acodec', 'copy',
                   '-ss', str(start),
                   '-to', str(end),
                   out_file
        ]

        try:
            subprocess.call(command, stdout=subprocess.DEVNULL)
        except subprocess.CalledProcessError as e:
            raise RuntimeError("Failed to cut chapter with output: ", e.output)

        tag_command = ["opustags", "-i", "-S", out_file]

        try:
            tag_process = subprocess.Popen(tag_command, stdin=subprocess.PIPE)
            tag_process.stdin.write(
                get_opus_tags(chapter, i, len(chapter_data['chapters'])))
            tag_process.stdin.flush()

            tag_process.communicate()
        except subprocess.CalledProcessError as e:
            raise RuntimeError("Failed to tag output file: ", e.output)


def get_file_name(target_dir, title):
    return os.path.join(target_dir, title.lower().replace(" ", "_") + EXT)


def infer_artist_title(full_title):
    parts = full_title.split(" - ")
    if len(parts) >= 2:
        return (parts[0], " - ".join(parts[1:]))
    else:
        # Return full title in both fields by default
        return (full_title, full_title)


def get_opus_tags(chapter, idx, total):
    (artist, title) = infer_artist_title(chapter['tags']['title'])

    tag_string = "Artist=%s\nTitle=%s\nTrack=%d\nTotal=%d" % (artist, title, idx + 1, total)

    print("Tagging with tags: ", tag_string)

    return bytes(tag_string, 'utf-8')


def get_chapters(src_file):
    command = ["ffprobe", "-i", src_file, "-print_format", "json", "-show_chapters"]
    output = ""

    try:
        output = subprocess.check_output(
            command, universal_newlines=True)
    except subprocess.CalledProcessError as e:
        output = e.output
        raise RuntimeError("ffmpeg process exited with error")

    chapters = json.loads(output)
    # print("Got chapters: ", chapters)
    return chapters


if __name__ == "__main__":
    main()
