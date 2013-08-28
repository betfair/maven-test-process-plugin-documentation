maven-test-process-plugin-documentation
---------------------------------------

This repo contains the code to generate the site for [maven-test-process-plugin](http://github.com/betfair/maven-test-process-plugin). It publishes to the gh-pages branch of that project to push to [t'internet](http://betfair.github.io/maven-test-process-plugin/).

Publishing
----------
Run 

    ./publish.sh <version> <github-username>

This requires that the following exist:
* Repository betfair/maven-test-process-plugin-documentation with branch &lt;version>
* Repository betfair/maven-test-process-plugin with branch gh-pages
* Repository betfair/maven-test-process-plugin with branch &lt;version>

And will perform the following:
* Remove all docs from repository betfair/maven-test-process-plugin with branch gh-pages in folder &lt;version>
* Copy all docs from repository betfair/maven-test-process-plugin-documentation with branch &lt;version> to that directory
* Generate the maven site for that version and place in a "maven" subdirectory

Top level docs which are not version specific are held in betfair/maven-test-process-plugin with branch gh-pages.


Licensing
---------

The maven-test-command-plugin-documentation is covered by "[The Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)":

    Copyright 2013, The Sporting Exchange Limited
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
