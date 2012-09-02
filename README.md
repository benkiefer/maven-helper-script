##Maven Helper Script

A script to simplify how you execute mvn commands. For example, instead of:

    mvn clean install -pl parent && mvn clean install -pl domain

You can do something like:

    m ci p ci d

You can also use your modules if you didn't define a mapping.

    m ci parent ci d

All you need is a simple YAML file call "m.yml" with contents like the one below will get you on your way.

    mappings:
      p: parent
      d: domain

    maven:
      phases:
        - clean
        - install

**How do I use it?**
 - Make sure you have ruby installed and on your path.
 - Checkout the project to a directory on your machine.
 - From the checkout directory, type "rake install".
 - In a command window, "cd" to your maven project's top-level directory which should contain your YAML file (as described above).
 - Execute a command like the one above.

If you're having trouble, take a look at the sample-mvn-project.
