IF trigger == "open"
    sellMap = nucleus.servershop.getSellPrices()
    page = 0
ENDIF

IF trigger == "click"
    IF slot == 45 && page > 0
        page = page - 1
    ELSEIF slot == 53 && (page+1)*45 < sellMap.size()
        page = page + 1
    ELSEIF slot >= 0 && slot <= 44
		#MESSAGE "&d판매하려는 아이템을 손에 들고 &6/itemsell &d명령어를 사용하세요."
		#MESSAGE "&d들고있는 아이템과 같은 아이템을 모두 판매하려면 &6/itemsellall"
	ELSEIF slot == 49
		#GUI "shop"
    ENDIF
ENDIF

IF trigger != "close"
    entrySet = sellMap.entrySet()
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
            addLore(item, color("&d판매가격 &a"+entry.getValue()))
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