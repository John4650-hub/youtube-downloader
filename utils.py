import argparse


def getArgs():
    parser = argparse.ArgumentParser(
        prog="app.py", description="Download youtube videos easily"
    )
    parser.add_argument(
        "url", metavar="videoUrl", help="Paste url of youtube video", default="done"
    )
    parser.add_argument(
        "-m",
        "--mode",
        metavar="mode",
        help="""
    mode can either be pl->playlist 
    or left empty->normal video""",
        default="",
    )
    parser.add_argument(
        "-i",
        "--itag",
        metavar="itag",
        type=int,
        help="""
    itag can only be number like
    17, 18, 22, ...Read the readme 
    for supported itags """,
        default=18,
    )

    return parser.parse_args()


def video_quality(video_object):
    video_qualities = video_object.streams.filter(progressive=True)
    for v in video_qualities:
        m = str(v).split(" ")
        y = m[1]
        sizev = v.filesize * (9.5367431640625 * 10**-7)
        vs = round(sizev, 2)
        print(f"  {y} ⇒ size: {(vs)}mb")


def audio_quality(audioQualityObject):
    for aud in audioQualityObject:
        m = str(aud).split(" ")
        y = m[1]
        sizev = aud.filesize * (9.5367431640625 * 10**-7)
        vs = round(sizev, 2)

        print(f"  {y} ⇒ size: {(vs)}mb")


def totalsize(pl):
    total_size = []
    for v in pl:
        filt = v.streams.get_by_itag("18")
        sizev = filt.filesize * (9.5367431640625 * 10**-7)
        vs = round(sizev, 2)
        total_size.append(vs)
    return str(sum(total_size)) + "mbs"
