
on run {}
	tell application "Microsoft Outlook"
		activate
		set msgSet to current messages
		if msgSet = {} then
			error "No messages selected. Select at least one message."
			error -128
		end if

		set listFolders to mail folders
		repeat with objFolder in listFolders
			if (name of objFolder is "Archive") then
				set archiveFolder to objFolder
			end if
		end repeat

		repeat with aMessage in msgSet
			move aMessage to archiveFolder
		end repeat
	end tell
end run
