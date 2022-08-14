# IntelliJ configuration & templates

The files in this directory are used to configure Intellij.

## Code style
1. Install the google-java-format IntelliJ plugin for Google Java Format version 1.7 (at the moment 1.7.0.5) (you can download it from https://plugins.jetbrains.com/plugin/8527-google-java-format/versions
   * under `Preferences...` -> `Plugins`
     - Import the "google-java-format" plugin
2. Enable the google-java-format plugin
   * under `Preferences...` -> `Other Settings`
     - `google-java-format Settings` -> Enable the option "Enable the google-java-format"
3. Import the Codestyle format file:
   * under `Preferences...` -> `Editor` -> `Code-Style`
     - `Scheme` -> `Import Scheme` -> IntelliJ IDEA code style XML
     - Add the code-style file: [code-format/IntelliJ-GXFGoogleStyle-CodeStyle.xml](code-format/IntelliJ-GXFGoogleStyle-CodeStyle.xml)
4. Import the inspection format file:
   * under `Preferences...` -> `Editor` -> `Inspections`
     - `Profile` -> `Import Profile` 
     - Add the inspection file: [code-format/IntelliJ-GXFGoogleStyle-Inspection.xml](code-format/IntelliJ-GXFGoogleStyle-Inspection.xml)

## Save actions
5. Install the "Save Actions" plugin
    * under `Preferences...` -> `Plugins`
        - Import the "Save Actions" plugin
6. Configure `Save Actions`, enable the following options
     * under `Preferences...` -> `Other Settings`
      - General: Activate save actions on save
      - General: Activate save actions on shortcut
      - General: Activate save actions on batch
      - Formatting actions: Optimize imports
      - Formatting actions: Reformat file
      - Add final modifier to field
      - Add final modifier to local variable or parameter
      - Add final modifier to local variable or parameter except if it is implicit
      - Add this to field access
      - Add this to method access 
      - Add missing @Override annotations
      - Add blocks to if/while/for statements
      - Add a serialVersionUID field for Serializable classes
      - Remove unnecessarry semicolumn
      - File Path Inclusions:`.*\.java`
 
## Copyright
7. Add the copyright header:
   * under `Preferences...` -> `Editor` -> `Copyright`  -> `Copyright Profiles`
     - Add the copyright file:  [code-templates/copyright_header.txt](code-templates/copyright_header.txt)
8. Set the default copyright header
   * under `Preferences...` -> `Editor` -> `Copyright`
      - Select the default copyright

