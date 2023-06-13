<!--
SPDX-FileCopyrightText: Contributors to the GXF project

SPDX-License-Identifier: Apache-2.0
-->

# Code Style and Formatting

Originally the GXF code base has had formatting conventions that were largely based on Eclipse defaults.
Developers using other IDEs such as IntelliJ were unable to set up their development environment to match these settings completely.
This caused formatting differences distracting from the actual changes and discussions handling pull requests, and harmed consistency.

In search of better defaults we decided to check if we could establish conventions that are easier shared, and ended up with [Google Java Format](https://github.com/google/google-java-format).
IDE configuration settings to apply an extended version of the Google Java Format conventions for Eclipse and IntelliJ can be found in this Config repository.
The modifications to Google Java Format add pre-existing conventions in the GXF code base that should not conflict with [Google Java Style](https://google.github.io/styleguide/javaguide.html).

# Differences in IntelliJ and Eclipse formatting

1. Code cleanup in IntelliJ removes the last semicolon in an enum that has no code following the constants, and Eclipse does not do this.
Both code-styles are fine! Eclipse will not add the semicolon again.

Valid style enum with semicolon:
```java
public enum MethodAccessModeType {
    NO_ACCESS,
    ACCESS,
    AUTHENTICATED_ACCESS;
}
```

Valid style enum without semicolon:
```java
public enum MethodAccessModeType {
    NO_ACCESS,
    ACCESS,
    AUTHENTICATED_ACCESS
}
```
