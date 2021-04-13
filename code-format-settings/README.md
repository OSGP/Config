# Differences in IntelliJ and Eclipse formatting

1. Code cleanup in IntelliJ removes the last semicolumn in a enum, and Eclipse does not do this.
Both code-styles are fine! Eclipse will not add the semi column again

Valid style enum with semicolumn:
```
public enum MethodAccessModeType {
    NO_ACCESS,
    ACCESS,
    AUTHENTICATED_ACCESS;
}
```

Valid style enum without semicolumn:
```
public enum MethodAccessModeType {
    NO_ACCESS,
    ACCESS,
    AUTHENTICATED_ACCESS
}
```
