#STOP
IF player.hasPermission("test")
    IMPORT org.spongepowered.api.data.key.Keys

    result = event.getEndResult()
    successfulData = result.getSuccessfulData()
    #MESSAGE successfulData.size()
    IF successfulData.size() < 1
        #STOP
    ENDIF

    immutableValue = successfulData.get(0)
    key = immutableValue.getKey()
    #MESSAGE key.getId()
    IF key != Keys.ITEM_DURABILITY
        #STOP
    ENDIF

    originalData = event.getOriginalChanges().getSuccessfulData().get(0)

    #MESSAGE originalData
    #MESSAGE immutableValue
ENDIF