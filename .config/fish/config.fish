if status is-interactive
    # Commands to run in interactive sessions can go here
	set -gx PATH /home/roxx/.local/bin $PATH
	set -U fish_greeting
	# Install package: i <packagename>
	function i
    		sudo pacman -S $argv
	end

	# Search for package: s <keyword>
	function s
    		pacman -Ss $argv
	end
	#for paru install
	function pi
		paru -S $argv
	end
	
	#for paru search
	function ps
		paru -Ss $argv
	end

end
