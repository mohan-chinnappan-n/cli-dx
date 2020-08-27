export uid=$1
export obj=$2
echo "
SELECT Id,
    SObjectType,

    PermissionsCreate,
    PermissionsRead,
    PermissionsEdit,
    PermissionsDelete,
    PermissionsViewAllRecords,
    PermissionsModifyAllRecords,

    Parent.label,
    Parent.IsOwnedByProfile 
 FROM ObjectPermissions  
   WHERE (ParentId IN (
                SELECT PermissionSetId                 
                  FROM PermissionSetAssignment  
                  WHERE Assignee.id = '$uid')
         ) 
      AND
         (SobjectType = '$obj')
"
