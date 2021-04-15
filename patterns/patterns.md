# Enterprise Patterns

## SOC - Separation of concerns
- establish proper boundaries
- layers
    - Presentation 
        - Page Layouts
        - Reports and Dashboards
        - LWC, Aura, Visualforce 
        
    - Biz logic
        - Apex
        - Flow
        - Process Builder
    - Data Access
        - Create/update/delete records
        - SOQL, SOSL, REST API, SOAP API
    - Database
        - Custom Objects, Fields
        - Triggers 
    
## DRY (Don't Repeat Yourself) principle
- Every piece of the knowledge must have
    - single representation 

## SOLID  principle
- Single-responsibility
- Open-closed 
    - open for extension
    - closed for modification
- Liskov substitution 
    - replaceable by sub-types
- Interface segregation
    - many client-specific interfaces are better than one general-purpose interface
- Dependency inversion
    - depend on the abstractions and not concretions

## DI - Dependency Injection 


## Resources
- [Enterprise Patterns](https://trailhead.salesforce.com/content/learn/modules/apex_patterns_sl)
- [Apex Enterprise Patterns: Domain & Selector Layers](https://trailhead.salesforce.com/en/content/learn/modules/apex_patterns_dsl)

- [Catalog of Patterns of Enterprise Application Architecture](https://martinfowler.com/eaaCatalog/)
- [FFLib Apex Common](https://github.com/apex-enterprise-patterns/fflib-apex-common)

- Videos
    - [Salesforce Lightning Platform Enterprise Patterns | Apex Enterprise Patterns](https://www.youtube.com/watch?v=Vl5sQ8vECdk)

