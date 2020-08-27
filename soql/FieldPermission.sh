export uid=$1
export obj=$2
echo "
SELECT Id,
    SObjectType,
    Field,
    PermissionsRead,
    PermissionsEdit,
    Parent.label,
     Parent.IsOwnedByProfile 
 FROM FieldPermissions  
 WHERE (ParentId IN 
         (SELECT PermissionSetId    
              FROM PermissionSetAssignment
                  WHERE Assignee.id = '$uid')
      ) 
     AND
       (SobjectType = '$obj') 
"
