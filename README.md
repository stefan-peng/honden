
# Honden: A Flashcard System Built on Oboeta

This is a collection of scripts built on top of [Oboeta], my minimalistic flashcard system.  All cards are stored as plain UTF-8 text in flat files: associated media files are stored in subdirectories.

## Installing

Open a terminal, navigate to the directory containing Honden's source code, and execute the `install.sh` script, passing the directory where you want to install the scripts as the first parameter.  The installation script will also create the proper directory hierarchy if it isn't already present; see the next section for more information about the directory hierarchy.

For example:

    $ ./install.sh ~/flashcards

will copy the scripts to `~/flashcards` and create subdirectories if necessary.  You might have to change users (e.g., run `sudo`) depending on which installation directory you select.

## The Directory Hierarchy

Assuming `.` is the root directory of a Honden installation, the directory hierarchy looks like this:

    ./
      backups/
        This directory contains backup archives created by
        backupall and backupcards.  These are bzipped
        TARs (.tar.bz2).
      decks/
        This directory contains plain text flashcard deck and
        log files.  Deck files have a .txt extension and log
        files have a .log extension.  Deck and log files are
        associated by name.  For example, a deck named
        kanji.txt would have a log file named kanji.log.
      media/
        recordings/
          flashcards/
            ロー/
              This directory contains recordings of flashcards.
              Each recording's name is the integral ID of the
              associated flashcard followed by the .wav
              extension.  If there are multiple recordings for
              a single flashcard, then the first one is named
              as just mentioned, whereas subsequent recordings'
              names are the flashcard's unique ID followed by
              ".N", where N is the recording's zero-based index,
              and the .wav extension.
        sds/
          This directory contains Chinese character stroke
          order diagrams.  Each file's name is the character
          that the file describes followed by an image extension.
          Right now, all of my diagrams are PNGs.
      other/
        This directory contains miscellaneous data.  Honden
        ignores it.

## The Scripts

Most of the scripts use the Bourne shell (`sh`) and the standard `awk` (actually, some rely on `gawk`), `date`, `sed`, and `sort` utilities.  All of them should be easy to understand: Open them with your favorite text editor to check them out.  Here's a high-level overview of the most important ones:

* `backupall` and `backupcards` back up all files and just cards and the scripts, respectively, to the `backups` directory.
* `carddate` generates a timestamp suitable for use in flashcards.
* `logdate` generates a timestamp suitable for use in logs.
* `edeck` edits the specified deck with your favorite text editor, whereas `seedeck` just views it via `less`.
* `newdeck` creates a new deck and associated log file using `touch(1)`.
* `nextid` scans all decks and log files for the next unique integral flashcard ID.
* `genline` is a handy script that appends new cards generated from its parameters to the specified deck.  It automatically generates the cards' unique IDs and adds blank rubi annotations for kanji (Chinese) characters via `rubify`.
* `reviewsome` is the driver behind `reviewsentences` and `reviewkanji`.  It uses SM-2 to select flashcards from the specified deck and sets up a local HTTP server on port 1337 to review them.  It requires a "filter program" to transform `oboeta`'s output into suitable lines for `oboetahttp`.  Honden has two filters, `filterkanji` and `filtersentences`, for kanji decks and Japanese sentence decks, respectively.  `reviewkanji` and `reviewsentences` set all of this up for you assuming that you have decks named "kanji" and "sentences".
* `seesome` is identical to `reviewsome` but does not log review results.
* `reviewclozes` is like `reviewsentences` but it generates and reviews cloze deletions from the answer (back) fields of a sentence deck.

NOTE: Some of the Japanese-specific scripts depend on [Hinomoto](https://github.com/joodan-van-github/hinomoto), a small collection of programs for parsing and tagging Unicode text.  Of course, you can remove these dependencies.

## License

All of the files in this collection have been dedicated to the public domain via the Creative Commons CC0 Public Domain Dedication in the hope that they would be circulated widely and without restriction.  I won't make any money from this code and I feel that it's more important that other people are free to use, modify, and distribute it as they please, with or without charge, even if I could make money from this.  Simply put, I like contributing to a healthy public domain.  See the file `COPYING` for a complete copy of the public domain dedication.

## Authors

I wrote these scripts by myself primarily for myself, but I hope that others will find them useful.

-- Joodan Van (伴上段), 2012年11月22日
