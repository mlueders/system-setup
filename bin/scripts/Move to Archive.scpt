on run {}
	tell application "Microsoft Outlook"
		activate
		set msgSet to current messages
		if msgSet = {} then
			error "No messages selected. Select at least one message."
			error -128
		end if
		set theMsg to item 1 of msgSet
		set theAccount to account of theMsg
		set archiveFolder to folder id 124
		--set archiveFolder to folder "Archive" of theAccount
		--set archiveFolder to folder "Archive" of folder "Inbox" of "Bancvue"
		repeat with aMessage in msgSet
			move aMessage to archiveFolder
		end repeat
	end tell
end run
