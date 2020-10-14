#! /usr/bin/env python3

import argparse
import os
import subprocess
import sys

# MW Perl
_MW_PERL_PATH = "/mathworks/GNB/hub/Linux/glibc-2.13/x86_64/apps/bat/perl/perl-5.20.2-mw-020/bin"
os.environ["PATH"] = _MW_PERL_PATH + os.pathsep + os.getenv("PATH")

_CONF_FILE = os.path.join(os.environ["HOME"], ".ict_result_file")
_CONF_FILE = "/home/tsuzanne/.ict_result_file" # For other users to run it

CMD="/mathworks/GNB/devel/jobarchive/Bpolyspace_core/latest_pass/matlab/test/tools/polyspace/btv/bat-stat"

VALID_RES_CMD = "/mathworks/GNB/devel/jobarchive/Bpolyspace_core/latest_pass/matlab/test/tools/polyspace/btv/bat-valid-res"

def res_file(res_dir):
    return os.path.join(res_dir, "RES_runtests")

def get_res_file():
    try:
        return open(_CONF_FILE).read().strip()
    except NameError:
        return None

def set_res_dir(res_dir):
    open(_CONF_FILE, "w+").write(res_file(res_dir))

def get_res_dir():
    return os.path.dirname(get_res_file())

def start_red(args):
    return {
        "xmobar" : "<fc=#dc322f>",
        "tty" : "\33[31m",
        "off" : "",
    }[args.color]

def start_green(args):
    return {
        "xmobar" : "<fc=#859900>",
        "tty" : "\33[32m",
        "off" : "",
    }[args.color]

def start_yellow(args):
    return {
        "xmobar" : "<fc=#b58900>",
        "tty" : "\33[33m",
        "off" : "",
    }[args.color]

def end_color(args):
    return {
        "xmobar" : "</fc>",
        "tty" : "\33[0m",
        "off" : "",
    }[args.color]

def red(txt, args):
    return "%s%s%s" % (start_red(args), txt, end_color(args))

def yellow(txt, args):
    return "%s%s%s" % (start_yellow(args), txt, end_color(args))

def green(txt, args):
    return "%s%s%s" % (start_green(args), txt, end_color(args))

def find_line(result, content):
    return next(line for line in result if content in line)

def status(args):
    try:
        result = subprocess.check_output([CMD, get_res_file()]).decode()
    except subprocess.CalledProcessError:
        print("No ICT running")
    else:
        result = result.split("\n")

        percent_line = find_line(result, "Nb tests executed")
        percent = percent_line.split(" ")[-1].strip("()")

        passed_line = find_line(result, "Nb tests passed")
        passed = passed_line.split(" ")[-2]

        failed_line = find_line(result, "Nb tests FAILED")
        failed = failed_line.split(" ")[-2]

        try:
            running_line = find_line(result, "Nb running tests")
            running = running_line.split(" ")[-1]
        except StopIteration:
            running = "0"

        try:
            yet_to_start_line = find_line(result, "Nb yet to start tests")
            yet_to_start = yet_to_start_line.split(" ")[-1]
        except StopIteration:
            yet_to_start = "0"

        not_completed = str(int(running) + int(yet_to_start))

        print(
            "ICT: %s (%s/%s/%s)" % (
                percent,
                green(passed, args),
                red(failed, args),
                yellow(not_completed, args),
            )
        )

def watch(args):
    print_tip = False
    if args.dir is None:
        res_dir = get_res_dir()
        print_tip = True
    else:
        res_dir = args.dir
        set_res_dir(res_dir)
    print("Watching dir", res_dir)
    if print_tip:
        print("Tip: use `watch .` to watch the current directory.")

def valid_res(args):
    os.chdir(get_res_dir())
    subprocess.run([VALID_RES_CMD, "-ict", "-rebuild"])

parser = argparse.ArgumentParser(description="Show ICT running status")
parser.set_defaults(func=lambda args: parser.print_help())
subparsers = parser.add_subparsers()

parser_status = subparsers.add_parser("status", description="print status")
parser_status.add_argument(
    "--color",
    choices=["xmobar", "tty", "off"],
    help="Colorise output wrt. specified format",
    default="tty" if sys.stdout.isatty() else "off",
    )
parser_status.set_defaults(func=status)

parser_watch = subparsers.add_parser("watch", description="set ICT dir to watch")
parser_watch.add_argument(
    "dir",
    type=os.path.abspath,
    nargs="?",
    help="directory containing the res file",
    )
parser_watch.set_defaults(func=watch)

parser_valid_res = subparsers.add_parser("valid-res", description="generate report")
parser_valid_res.set_defaults(func=valid_res)

args = parser.parse_args()
args.func(args)
