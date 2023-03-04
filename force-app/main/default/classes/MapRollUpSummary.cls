public with sharing class MapRollUpSummary {

    // Show map's information
    public void showMapInfo() {
        // Map init
        Map<String, Integer> newMap = new Map<String, Integer>();
        newMap.put('Oppporunity',10); 
        newMap.put('Account',20); 
        newMap.put('Contact',15); 
        newMap.put('Case',40);
        // Get list values
        List<Integer> values = newMap.values();
        // Get list keys
        Set<String> keys = newMap.keySet();
        // Sort list values in ascending order
        values.sort();
        //Get max values in map
        Integer maxValue = values[values.size() - 1];
        //Get min values in map
        Integer minValue = values[0];
        String minKey, maxKey;
        System.debug('Các giá trị trong map là:');
        //Display all values in map
        for (String key : keys) {
            System.debug(key + '=>' + newMap.get(key)); 
            // Get key of max value
            if (newMap.get(key) == maxValue) {
                maxKey = key;
            }
            // Get key of min value
            if (newMap.get(key) == minValue) {
                minKey = key;
            }
        }
        //Display key of max value
        System.debug('Key có value lớn nhất là: ' + maxKey); 
        //Display key of min value
        System.debug('Key có value nhỏ nhất là: ' + minKey); 
        //Display value of Opportunity
        System.debug('Giá trị của Opportunity là: ' + newMap.get('Oppporunity')); 
    }
}
