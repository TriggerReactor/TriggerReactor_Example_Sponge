IF trigger == "open"
    WHILE true
        goldIngot = item("emerald", 1)
        setItemTitle(goldIngot, color("&6경제 활동"))
        clearLore(goldIngot)
        addLore(goldIngot, color("&7현재 돈&8: &6"+$money))
        inventory.set(4, 0, goldIngot)

        #WAIT 1
    ENDWHILE
ENDIF

IF trigger == "click"
    IF slot == 3
        #GUI "buyshop"
    ENDIF

    IF slot == 5
        #GUI "sellshop"
    ENDIF
	
	IF slot == 8
		#GUI "menu"
	ENDIF
ENDIF