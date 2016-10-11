


Trac / SVN LDAP interaction:

```
unity-idm_1      | [LOOKUP] FilteringOperationContext for Dn 'uid=admin,ou=system', *
unity-idm_1      | [BIND] BindContext for Dn 'uid=admin,ou=system', credentials <0x61 0x64 0x6D 0x69 0x6E 0x31 0x32 0x33 >
unity-idm_1      | [SEARCH] SearchContext for Dn 'ou=system', filter :'(&(objectClass=person)(mail=test))'. userSearch=true, username=test
unity-idm_1      | [SEARCH RESPONSE] #entry filters=0
unity-idm_1      | [LOOKUP] FilteringOperationContext for Dn 'cn=test,ou=system', *
unity-idm_1      | [BIND] BindContext for Dn 'cn=test,ou=system', credentials <0x74 0x65 0x73 0x74 >
unity-idm_1      | [LOOKUP] FilteringOperationContext for Dn 'uid=admin,ou=system', *
unity-idm_1      | [BIND] BindContext for Dn 'uid=admin,ou=system', credentials <0x61 0x64 0x6D 0x69 0x6E 0x31 0x32 0x33 >
unity-idm_1      | [LOOKUP] FilteringOperationContext for Dn 'ou=system', +, *
unity-idm_1      | compare: CompareContext for Dn 'ou=system', oid : <member>, value :'cn=test,ou=system'
unity-idm_1      | [LOOKUP] FilteringOperationContext for Dn 'ou=system', +, *
unity-idm_1      | compare: CompareContext for Dn 'ou=system', oid : <uniqueMember>, value :'cn=test,ou=system'
unity-idm_1      | [LOOKUP] FilteringOperationContext for Dn 'ou=system', +, *
unity-idm_1      | compare: CompareContext for Dn 'ou=system', oid : <objectClass>, value :'groupOfNames'
unity-idm_1      | [LOOKUP] FilteringOperationContext for Dn 'ou=system', +, *
unity-idm_1      | compare: CompareContext for Dn 'ou=system', oid : <objectClass>, value :'groupOfUniqueNames'
```