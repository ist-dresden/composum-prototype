#!/bin/bash
echo Creates a project from this archetype via script, so that variations of the arguments can be easily tested.
echo Copy this script and edit as needed.

/bin/rm -fr composum-prototype-assets-pagesintegration/

# we use org.apache.maven.plugins:maven-archetype-plugin:3.1.0:generate since strangely the 3.1.2 creates too many newlines in the poms

groupId=com.composum.prototype
artifactId=composum-prototype-assets-pagesintegration
version=1.0.0-SNAPSHOT

tenant=composum
domain=prototype
project=assets-pagesintegration

package=composum.prototype.assets.pagesintegration

name="Example for Pages integration of Assets"
description="Test- and Exampleproject of the integration of the Assets framework into Composum Pages"

mvn "org.apache.maven.plugins:maven-archetype-plugin:3.1.0:generate" -DinteractiveMode=false -DarchetypeGroupId=com.composum.meta.ist.archetype \
  -DarchetypeArtifactId=composum-pages-project-archetype -DarchetypeVersion="1.0-SNAPSHOT" -DgroupId="$groupId" -DartifactId="$artifactId" -Dpackage="$package" \
  -Dtenant="$tenant" -Ddomain="$domain" -Dproject="$project" -Dpackage="$package" -Dname="$name" -Ddescription="$description"
