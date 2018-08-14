IF trigger == "open"
    WHILE true
        grid = inventory

        //4
        headItem = headForName($playername)
        setItemTitle(headItem, color("&6플레이어&8: &7"+$playername))
        clearLore(headItem)
        addLore(headItem, color("&d어서오세요!"))
        grid.set(4, 0, headItem)

        //15
        shopItem = item("emerald", 1)
        setItemTitle(shopItem, color("&6경제 활동"))
        clearLore(shopItem)
        addLore(shopItem, color("&7현재 돈&8: &6"+$money))
		addLore(shopItem, color(""))
		addLore(shopItem, color("&d[클릭해서 열기]"))
        grid.set(6, 1, shopItem)

        #WAIT 1
    ENDWHILE
ENDIF

IF trigger == "click"
    IF slot == 0
        #TP {"spawn.DIM7.location"}
    ENDIF

    IF slot == 11
        #CMD "kit base"
    ENDIF
	
	IF slot == 15
		#GUI "shop"
	ENDIF

    IF slot == 22
        IF cooldown
            #MESSAGE "&c천천히 눌러주세요."
            #STOP
        ENDIF

        #GIVE {"items.tinkers.manual"}
        #GIVE {"items.thermal.manual1"}
        cooldown = true
        #WAIT 5
        cooldown = false
    ENDIF

    IF slot == 40
        #CMD "spawn"
    ENDIF
ENDIF