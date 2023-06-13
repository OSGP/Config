<!--
SPDX-FileCopyrightText: Contributors to the GXF project

SPDX-License-Identifier: Apache-2.0
-->

# Eclipse configuration & templates

The files in this directory are used to configure eclipse.

The configuration files and instructions are based on [eclipse-java-google-style.xml](https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml) combined with conventions in the GXF code base. Some modifications were made taking into account that rules can be applied by IDE configuration in Eclipse and IntelliJ to get consistent results.

1. Install the google-java-format Eclipse plugin for Google Java Format by downloading the `google-java-format-eclipse-plugin-1.13.0.jar` from [plugin jar](https://github.com/google/google-java-format/releases) and copying it into the dropins folder with your Eclipe installation.
2. In order to work the following lines should be added to `eclipse.ini` (see [Stackoverflow](https://stackoverflow.com/questions/69228635/eclipse-plugin-add-exports-java-16)):
   ```
   --add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED
   --add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED
   --add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED
   --add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED
   --add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED
   --add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED
   ```
3. Import Formatter and Clean Up configuration in the `Java > Code Style` section from Eclipse `Preferences`
   * under `Clean Up` import [JavaCleanup.xml](./code-format/JavaCleanup.xml) and keep `GXFGoogleJavaFormat` as active profile
   * under `Formatter`
     - import [JavaFormatter.xml](./code-format/JavaFormatter.xml) and keep `GXFGoogleJavaFormat` as active profile
     - select `google-java-format` as formatter implementation (if not available make sure the plugin is in the dropins folder and restart Eclipse)
   * under `Code Templates` import [codetemplates.xml](./code-templates/codetemplates.xml) to enable the template for the Apache 2 license header
   * under `Organize Imports`
     - remove any package or type name prefixes (Google Java Style [mandates only two groups](https://google.github.io/styleguide/javaguide.html#s3.3.3-import-ordering-and-spacing): static and other imports)
     - set number of (static) imports needed for .* as high as possible, e.g. 999999999 (this should prevent [wildcard imports](https://google.github.io/styleguide/javaguide.html#s3.3.1-wildcard-imports))
4. Configure `Save Actions` in the `Java > Editor` section from Eclipse `Preferences`
   * Format source code
   * Organize imports
   * Additional actions
     - Add 'this' qualifier to unqualified field accesses (`Member Accesses`, Always)
     - Add 'this' qualifier to unqualified method accesses (`Member Accesses`, Always)
     - Convert control statement bodies to block (`Code Style > Control statements`)
     - Add final modifier to method parameters (`Code Style > Variable declarations`)
     - Add final modifier to local variables (`Code Style > Variable declarations`)
     - Use uppercase for long literal suffix (`Code Style > Number literals`)
     - Remove unused imports (`Unnecessary Code > Unused code`)
     - Add missing '@Override' annotations (`Missing Code > Annotations`)
     - Add missing '@Override' annotations to implementations of interface methods (`Missing Code > Annotations`)
     - Add missing '@Deprecated' annotations (`Missing Code > Annotations`)
     - Remove unnecessary casts (`Unnecessary Code > Unnecessary code`)
     - Remove redundant semicolons (`Unnecessary Code > Unnecessary code`)
     - Remove unnecessary '$NON-NLS$' tags (`Unnecessary Code > Unnecessary code`)
     - Remove trailing white spaces on all lines (`Code Organizing > Formatter`)
     - Correct indentation - not checked (`Code Organizing > Formatter`)
5. Import [JavaScript formatter configuration](./code-format/JavaScriptFormatter.xml) in the `Web > Client-side Javascript > Formatter` section from Eclipse `Preferences`
6. Configure XML formatting (initial baseline, further conventions to be added) in the `XML > XML Files > Editor` section from Eclipse `Preferences`
   * Insert whitespace before closing empty end-tags
   * Indent using spaces
   * Indentation size: 2
