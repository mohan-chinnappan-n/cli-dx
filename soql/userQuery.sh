export uid=$1
echo "SELECT Id,
    IsActive,
    ProfileId,
    Profile.Name,
    Profile.UserLicense.Name,
    UserRoleId,
    UserRole.DeveloperName,
    Username,
    Email,
    Name,
    LastLoginDate,
    CreatedBy.Name,
    CreatedDate,
    LastModifiedBy.Name,
    LastModifiedDate,
     (SELECT PermissionSet.Name           
         FROM PermissionSetAssignments          
           WHERE PermissionSet.IsOwnedByProfile = FALSE) 

FROM User WHERE Id = '$uid'  
LIMIT 1
"
