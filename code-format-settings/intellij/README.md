# IntelliJ configuration & templates

The files in this directory are used to configure Intellij.

1. Install the google-java-format plugin 
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
5. Add the copyright header:
   * under `Preferences...` -> `Editor` -> `Copyright`  -> `Copyright Profiles`
     - Add the copyright file:  [code-templates/copyright_header.txt](code-templates/copyright_header.txt)
6. Set the default copyright header
   * under `Preferences...` -> `Editor` -> `Copyright`
      - Select the default copyright
