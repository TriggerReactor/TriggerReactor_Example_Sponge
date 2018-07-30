IF trigger == "open"
	IMPORT org.spongepowered.api.item.inventory.type.GridInventory
	IMPORT org.spongepowered.api.item.inventory.query.QueryOperationTypes
	IMPORT org.spongepowered.api.item.inventory.property.SlotIndex
	
	WHILE true
		grids = inventory.query(QueryOperationTypes.INVENTORY_TYPE.of(GridInventory))
		grid = grids.first()
		#MESSAGE grid.set(5, 0, headForValue($playername))
		
		#WAIT 1
	ENDWHILE
ENDIF

IF trigger == "click"
	#MESSAGE "CLICK "+slot
	#MESSAGE "inv: "+inventory
ENDIF

IF trigger == "close"
	#MESSAGE "CLOSE"
ENDIF