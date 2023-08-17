if status is-interactive
    # Commands to run in interactive sessions can go here
end

# --- GIT COMMANDS ---

function gc
	git commit -v $argv
end

function ga
	git add $argv
end

function gs
	git status
end

function gd
	git diff $argv
end

function gdt
	git difftool $argv
end

function gdc
	git diff --cached $argv
end

function gb
	git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'
end

function gl
	git log $argv
end

function gg
	git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(yellow)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' $argv
end

function ggg
	git log --graph --abbrev-commit --decorate --format=format:'%C(yellow)%h%C(reset) - %C(bold green)%aD%C(reset) %C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
end

function gt
	git tag $argv
end

function gtd
	gd | grep -i "^+.*TODO"
end

function gr
	git rebase $argv
end

function grc
	gr --continue
end

# --- MISC FUNCTIONS ---

function openRadarNumber
	if test $argv[1]
		echo "Opening $argv[1] in Radar..."
		open "rdar://$argv[1]"
	else
		echo "No radar number given, attempting to find radar from GIT branch."

		openRadarSCM
	end
end

function openCurrentXcode
	open (xcode-select -p | grep -io ".*Xcode\.app")
end

function ox
	open *.xcodeproj
end

function lstp
	log stream --predicate $argv
end

function lsp
	log show --predicate $argv
end

function whatsa
	device_model_map -like $argv[1]
end

# ~/.config/fish/config.fish

starship init fish | source

