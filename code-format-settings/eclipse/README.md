# Eclipse configuration & templates

The files in this directory are used to configure eclipse.

The configuration files and instructions are based on [eclipse-java-google-style.xml](https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml) combined with conventions in the GXF code base. Some modifications were made taking into account that rules can be applied by IDE configuration in Eclipse and IntelliJ to get consistent results.

1. Install the google-java-format Eclipse plugin for Google Java Format version 1.7 (you may need to [build this plugin yourself](#google-java-format-eclipse-plugin) first) by copying it into the dropins folder with your Eclipe installation
2. Import Formatter and Clean Up configuration in the `Java > Code Style` section from Eclipse `Preferences`
   * under `Clean Up` import [JavaCleanup.xml](./code-format/JavaCleanup.xml) and keep `GXFGoogleJavaFormat` as active profile
   * under `Formatter`
     - import [JavaFormatter.xml](./code-format/JavaFormatter.xml) and keep `GXFGoogleJavaFormat` as active profile
     - select `google-java-format` as formatter implementation (if not available make sure the plugin is in the dropins folder and restart Eclipse)
   * under `Code Templates` import [codetemplates.xml](../code-templates/codetemplates.xml) to enable the template for the Apache 2 license header
   * under `Organize Imports`
     - remove any package or type name prefixes (Google Java Style [mandates only two groups](https://google.github.io/styleguide/javaguide.html#s3.3.3-import-ordering-and-spacing): static and other imports)
     - set number of (static) imports needed for .* as high as possible, e.g. 999999999 (this should prevent [wildcard imports](https://google.github.io/styleguide/javaguide.html#s3.3.1-wildcard-imports))
3. Configure `Save Actions` in the `Java > Editor` section from Eclipse `Preferences`
   * Format source code
   * Organize imports
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
4. Import [JavaScript formatter configuration](./code-format/JavaScriptFormatter.xml) in the `Web > Client-side Javascript > Formatter` section from Eclipse `Preferences`
5. Configure XML formatting (initial baseline, further conventions to be added) in the `XML > XML Files > Editor` section from Eclipse `Preferences`
   * Insert whitespace before closing empty end-tags
   * Indent using spaces
   * Indentation size: 2

## Google Java Format Eclipse Plugin

When looking for an Eclipse Plugin on the [Google Java Format GitHub pages](https://github.com/google/google-java-format) you can find a reference to an Eclipse Plugin that belongs with the google-java-format 1.6 release.
In the google-java-format 1.7 release some improvements have been made to the formatting that are not backwards compatible with the earlier version.
While the IntelliJ plugin has been updated to work with google-java-format 1.7 for the Eclipse Plugin no such release has been made available as downloadable jar.

With the help of [one of the comments](https://github.com/google/google-java-format/issues/331#issuecomment-455685768) from [Google Java Format Issue 331](https://github.com/google/google-java-format/issues/331) it should almost be possible to build the jar for yourself quite easily.
The original instructions mention that the maven build fails, and that you should follow instructions to build the plugin by exporting from an Eclipse SDK build.
With the following recipe you should be able to create the plugin by executing the maven build (without build failure or necessary additional steps from Eclipse).

1. Clone the google-java-format git repository and set up a branch for changes from tag `google-java-format-1.7` to create the plugin:
   ```
   git clone https://github.com/google/google-java-format.git
   cd google-java-format
   git checkout -b eclipse-google-java-format-1.7 google-java-format-1.7
   ```
2. Apply changes from [a patch file](./google-java-format-1.7-eclipse-plugin.patch) so that maven will be able to create the Eclipse Plugin
   (copy the patch file into the root of the cloned repository or modify the path in the shell command):
   `git apply google-java-format-1.7-eclipse-plugin.patch`
3. Execute maven build from the root of the cloned google-java-format repository:
   `mvn install`
4. Copy the freshly built plugin (`eclipse_plugin/target/google-java-format-eclipse-plugin-1.7.0.jar`) to the `dropins` folder of your Eclipse installation.

