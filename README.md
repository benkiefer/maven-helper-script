##Maven Helper Script
*****

A script to simplify how you execute mvn commands. For example, instead of:

    mvn clean install -pl parent && mvn clean install -pl domain

You can do something like:

    m ci p ci d

*****

**Additional Features**

If you don't want to define a mapping for your module, you can use it's name.

    m ci parent ci d

You can also create shorthand commands for various plugin phases. For example, executing "jetty:run" on your "web module could be:

    m jr web

All parameters passed into the helper script are applied to every execution. So when you type:

    m ci web ci parent -o

You get:

    mvn clean install -pl web -o && mvn clean install -pl parent -o

******

**How do I use it?**
 - Make sure you have ruby installed and on your path.
 - Checkout the project to a directory on your machine.
 - From the checkout directory, type "rake install".
 - Put an "m.yml" file in you maven project's parent directory as described above.
 - In a command window, "cd" to a directory in your project.
 - Execute a command like the one above.

All you need is a simple YAML file call "m.yml" with contents like the one below in your top level maven project directory.

    mappings:
      p: parent
      d: domain

    maven:
      phases:
        - clean
        - install
        - jetty:run

If you're having trouble, take a look at the sample-mvn-project.
