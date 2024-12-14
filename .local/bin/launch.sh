#!/usr/bin/zsh

launch() {

	# Usage: launch PATH [URI...]

	# NOTE: The bulk of this function is executed in a subshell, i.e. `(..)`
	#       This isn't strictly necessary, but it keeps everything
	#       out of the global namespace and lessens the likelihood
	#       of side effects.

	(

		# where you want to install the launcher to
		appdir=$HOME/.local/share/applications

		# the template used to install the launcher
		template=launcher-XXXXXX.desktop

		# ensure $1 has a .desktop extension, exists, is a normal file, is readable, has nonzero size
		# optionally use desktop-file-validate for stricter checking
		# desktop-file-validate "$1" 2>/dev/null || {
		[[ $1 = *.desktop && -f $1 && -r $1 && -s $1 ]] || {
			echo "ERROR: you have not supplied valid .desktop file" >&2
			return 1
		}

		# ensure the temporary launcher is deleted upon exit
		trap 'rm "$launcherfile" &>/dev/null' EXIT

		# create a temp file to overwrite later
		launcherfile=$(mktemp -p "$appdir" "$template")

		launchername=${launcherfile##*/}

		# overwrite temp file with the launcher file
		if cp "$1" "$launcherfile" &>/dev/null; then
			gtk-launch "$launchername" "${@:2}"
		else
			echo "ERROR: failed to copy launcher to applications directory" >&2
			return 1
		fi

	)

}
