# ShiftSubtitles
You downloaded the matching SRT subtitles but they are out of phase?

* ###What is this?
ShiftSubtitles is a short script that readjust your subtitles given a number representing the seconds out of phase

* ###Prerequisites
You should have [ruby v2.2.0 installed](https://www.ruby-lang.org/en/documentation/installation/ "Install Ruby")

* ###How to use it?
  1.**Clone this repository** You may also want to place your subtitles (.srt file) inside the cloned folder

  2.**Watch the movie a little bit** Take notes on how many seconds the subtitles are out of phase.
  Note that may happen that your subtitles need an unshift, so you just pass the seconds with a negative number. **e.g.** -4

  3.**Execute the script** Just run the script with two arguments:
  ```sh
  $ ruby shift_subtitles.rb <srt_file> <seconds_to_shift>
  ```
  A living example might look like this:
  ```sh
  $ ruby shift_subtitles.rb GOT_01.srt 5
  ```

  4.**Watch your movie** If you fail by a couple of seconds, just re-run the script with a negative number

* ###General considerations
  * Don't get surprised to find two subtitles files in your folder after executing the script. The original file will be modified to have a name like "old_NAME.srt", so if something goes wrong, you'll still have the original file.
