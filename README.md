Originally forked from [https://github.com/joodan-van-github/honden](https://github.com/joodan-van-github/honden)

# Honden: A Flashcard System Built on Oboeta

This is a collection of scripts built on top of [Oboeta](https://github.com/joodan-van-github/oboeta), my minimalistic flashcard system.  All cards are stored as plain UTF-8 text in flat files: associated media files are stored in subdirectories.

## Installing

Open a terminal, navigate to the directory containing Honden's source code, and execute the `install.sh` script, passing the directory where you want to install the scripts as the first parameter.  For example,

    $ ./install.sh ~/flashcards

will copy the scripts to `~/flashcards`.  You might have to change users (e.g., run `sudo`) depending on which installation directory you select.

## Creating a Deck

Most Honden scripts use information stored within a configuration file named `config.txt`, which is nothing more than a Bourne shell script that sets environment variables.  Most of the values are easy to understand.

To create `config.txt`, create a new directory, navigate to it, and run `honden`.  This will also create the directory hierarchy described in the next section.  NOTE: `honden` will overwrite `config.txt` if it already exists but it won't overwrite the directories.

The scripts assume that the deck and log files are formatted according to Oboeta's guidelines.  The default deck settings assume that each card has four fields: the card's unique integral ID, the card's creation date, the front, and the back.  You can specify different filters in `config.txt` if your card format is different.

## The Directory Hierarchy

Assuming `.` contains `config.txt`, the directory hierarchy looks like this:

    ./
      backups/
        This directory contains backup archives created by
        backupcards.  These are bzipped TARs (.tar.bz2).
      media/
        This directory contains media files.  Honden
        ignores it.
      other/
        This directory contains miscellaneous data.
        Honden ignores it.

## The Scripts

Most of the scripts use the Bourne shell (`sh`), `gawk`, `date`, `sort`, and `uniq` utilities.  All of them should be easy to understand: Open them with your favorite text editor to check them out.  Here's a high-level overview of the most important ones:

* `backupcards` backs up all files not excluded by the configurable `$BACKUPEXCLUSION` regex filter to the `backups` directory.
* `edeck` edits the deck with your favorite text editor.
* `seedeck` views the deck with your favorite viewer.
* `nextid` scans the decks and its log file for the next unique integral flashcard ID.
* `genline` is a handy script that appends new cards generated from its parameters to the deck.  It automatically generates the cards' unique IDs.
* `review` uses SM-2 to select flashcards from the deck and sets up a local HTTP server on port 1337 to review them.
* `defaultfilter` is the filter that `config.txt` specifies by default to transform `oboeta`'s output into something that `oboetahttp` can consume.  (`review` uses this.)

## License

All of the files in this collection have been dedicated to the public domain via the Creative Commons CC0 Public Domain Dedication in the hope that they would be circulated widely and without restriction.  I won't make any money from this code and I feel that it's more important that other people are free to use, modify, and distribute it as they please, with or without charge, even if I could make money from this.  Simply put, I like contributing to a healthy public domain.  See the file `COPYING` for a complete copy of the public domain dedication.

## Authors

I wrote these scripts by myself primarily for myself, but I hope that others will find them useful.

-- Joodan Van (伴上段), 2012年11月22日
