# SSO 


- [Can I enable SSO for Salesforce admins?](https://help.salesforce.com/s/articleView?id=sf.sso_tips.htm&type=5)
    - You can enable SSO for Salesforce admins, but we recommend that **you allow some or all of your admins to log in directly using multi-factor authentication (MFA)**. 
    - Admins who can log in directly can address an outage or other problem with your SSO implementation. 
        - For example, consider a situation where your third-party SSO provider has a sustained outage. An admin can use the standard Salesforce login page to log in with their username and password, and then they can disable SSO until the problem is resolved.

- [Delegate Administrative Duties](https://help.salesforce.com/s/articleView?id=sf.admin_delegate.htm&type=5)

## MFA (with OpenID Connect) Demo

- ![Demo of MFA](https://mohan-chinnappan-n5.github.io/devops/bp/img/slds-scanner-1.webm.gif)


## FAQ

- Question: Can signature support team could help activate an inactive break glass user, in the case of the SSO providing becoming unavailable.


- Response:  Salesforce Signature Support cannot activate an inactive user for a customer in any situation. Typically these are activities performed by the administrator of the org.  [Please refer to the user account reactivation process](https://help.salesforce.com/s/articleView?id=000330190&type=1) that article outlines the process 

<hr/>

- Question: How to restrict using System Admin standard profile and still manage admin function through custom profiles.


- Response:  Salesforce provides capabilities to [delegate admin roles and responsibilities](https://help.salesforce.com/s/articleView?id=sf.admin_delegate.htm&type=5)  It is also possible to carve out custom profiles to delineate admin duties as outlined in [this article](https://help.salesforce.com/s/articleView?id=000326132&type=1) and not assign any users to standard System Admin profiles. However, maintaining one or more break glass users with full Administrator rights and platform authentication is generally recommended best practice.

## References

- [FAQs for Single Sign-On](https://help.salesforce.com/s/articleView?id=sf.sso_tips.htm&type=5)
- [FAQs for Delegated Authentication](https://help.salesforce.com/s/articleView?id=sf.sso_delauthentication_tips.htm&type=5)
- [Require Users to Log In with SSO](https://help.salesforce.com/s/articleView?id=sf.sso_enforce_sso_login.htm&type=5)
- [Best Practices and Tips for Implementing Single Sign-On](https://developer.salesforce.com/docs/atlas.en-us.214.0.securityImplGuide.meta/securityImplGuide/sso_tips.htm)
- [Configure Salesforce for Delegated Authentication](https://help.salesforce.com/s/articleView?id=sf.sso_delauthentication_configuring.htm&type=5)

