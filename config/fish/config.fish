if status is-interactive
    # Commands to run in interactive sessions can go here
    #set -Ux PATH $HOME/.local/bin $PATH
    fish_add_path $HOME/.local/bin
    set -x EDITOR nvim
    set -x VISUAL nvim
    set -x TERM "xterm-256color"
    set -g theme_nerd_fonts yes
    set fish_greeting
    $HOME/.local/bin/roxx-colorscripts/launchSmall 
	alias ls='eza --icons'

	# Long listing with icons and git support
	alias ll='eza -l --git --icons'

	# Tree view
	alias lt='eza --tree --icons'

	# Show hidden files
	alias l='eza -la --icons'

	# Show all files including dotfiles and use long list
	alias lla='eza -la --git --icons'


	# install package
	function i
		paru -S $argv
	end

	# search package
	function s
		paru -Ss $argv
	end

	# remove package
	function r
		paru -Rns $argv
	end

	#git essential
	#git add
	function ga
		git add $argv
	end

	#git commit
	function gc
		git commit -m "$argv"
	end

	# git push
	function gp
		git push $argv
	end

	#git all
	function gall
		git add .
		git commit -m "$argv"
		git push origin
	end
	function c
		cd $argv
	end
	# codium-insiders
	function code
		codium-insiders $argv
	end
	#nvim 
	function n
		nvim $argv
	end

	function nv
    		lvim $argv
  	end
	
	#vim
	function v
		vim $argv
	end

	function bl
		sudo systemctl start bluetooth
		bluetuith
	end

	#aria2c 
	function dn
		aria2c -x 16 -s	32 $argv
	end
	function cd
		builtin cd $argv; and ll
	end
	function ex --description "Extract bundled & compressed files"
		if test -f "$argv[1]"
			switch $argv[1]
				case '*.tar.bz2'
                			tar xjf $argv[1]
            			case '*.tar.gz'
                			tar xzf $argv[1]
            			case '*.bz2'
                			bunzip2 $argv[1]
            			case '*.rar'
                			unrar $argv[1]
            			case '*.gz'
                			gunzip $argv[1]
            			case '*.tar'
                			tar xf $argv[1]
            			case '*.tbz2'
                			tar xjf $argv[1]
            			case '*.tgz'
                			tar xzf $argv[1]
            			case '*.zip'
                			unzip $argv[1]
            			case '*.Z'
                			uncompress $argv[1]
            			case '*.7z'
                			7z $argv[1]
            			case '*.deb'
                			ar $argv[1]
            			case '*.tar.xz'
                			tar xf $argv[1]
            			case '*.tar.zst'
                			tar xf $argv[1]
            			case '*'
                			echo "'$argv[1]' cannot be extracted via ex"
        		end
   		else
       			echo "'$argv[1]' is not a valid file"
   	end
end

end
