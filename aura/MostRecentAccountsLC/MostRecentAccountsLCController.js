({
	doinit : function(component) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'},
            {label: 'Website', fieldName: 'Website', type: 'url'}
            
        ]);
        
        var action = component.get("c.getRecentAccounts");
        action.setCallback(this, function(response) {      
			var state = response.getState();
        	if(state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
        	}              
        });
		$A.enqueueAction(action);
	}
})