IF trigger == "open"
    buyMap = nucleus.servershop.getBuyPrices()
    page = 0
ENDIF

IF trigger == "click"
    IF slot == 45 && page > 0
        page = page - 1
    ELSEIF slot == 53 && (page+1)*45 < buyMap.size()
        page = page + 1
    ELSEIF slot >= 0 && slot <= 44
		IF click.contains("Shift")
            #CMD "itembuy "+item.getType().getName()+" 64"
        ELSE
            #CMD "itembuy "+item.getType().getName()+" 1"
        ENDIF
	ELSEIF slot == 49
		#GUI "shop"
    ENDIF
ENDIF

IF trigger != "close"
    entrySet = buyMap.entrySet()
    entries = list()
    entries.addAll(entrySet)

    fromIndex = page*45
    toIndex = page*45+45
    
    IF toIndex > entries.size()
        toIndex = entries.size()
    ENDIF

    inventory.clear()

    FOR index = fromIndex:toIndex
        entry = entries.get(index)

        x = (index%45)%9
        y = (index%45)/9

        IF itemType(entry.getKey().getId()) != null
            item = item(entry.getKey().getId(), 1)
            addLore(item, color("&d구매가격 &c"+entry.getValue()))
            addLore(item, color(""))
            addLore(item, color("&d[클릭시 구매]"))
            addLore(item, color("&d[시프트 클릭시 64개 구매]"))
            inventory.set(x,y,item)
        ENDIF
    ENDFOR

    item_prev = item("arrow", 1)
	item_back = item("wooden_door", 1)
    item_next = item("arrow", 1)

    setItemTitle(item_prev, color("&d[이전]"))
	setItemTitle(item_back, color("&c[뒤로 가기]"))
    setItemTitle(item_next, color("&d[다음]"))

    inventory.set(0, 5, item_prev)
	inventory.set(4, 5, item_back)
    inventory.set(8, 5, item_next)
ENDIF