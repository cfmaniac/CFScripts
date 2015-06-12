<cfscript>
    oldList = "1,2,3,4,5,6,7";
    newList = "1,2,3,4,5,6,7,8,9,10,11,12";

    result = compareLists(oldList, newList);
    listLoop(result.deletemItems, loopBody);
	
	function loopBody(item) {
    //runningTotal = runningTotal + item;
    //writeOutput("Running Total: #runningTotal#");
    writeOutput(item);
	}
    //writeDump(result);
	

    // -------------------------------------------------------------------------

    public struct function compareLists (
        required string listA,
        required string listB
    ){

        local.a = listToArray(arguments.listA, ',');
        local.b = listToArray(arguments.listB, ',');

        local.itemsNotInListB = [];
        local.itemsNewInListB = [];

        // Compare all items in 'list A' to 'list B'
        for (local.item in local.a) {
            if (!arrayContains(local.b, local.item))
            {
                arrayAppend(local.itemsNotInListB, local.item);
            }
        }
        // Compare all items in 'list B' to 'list A'
        for (local.item in local.b) {
            if (!arrayContains(local.a, local.item))
            {
                arrayAppend(local.itemsNewInListB, local.item);
            }
        }

        return {
             newItems = local.itemsNewInListB,
             deletedItems = local.itemsNotInListB
        };
    }
</cfscript>