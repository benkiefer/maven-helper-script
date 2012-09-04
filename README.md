##Maven Helper Script

###What is it?###

A script to simplify how you execute Maven commands. For example, instead of:

    mvn clean install -pl parent && mvn clean install -pl domain

You can do something like:

    m ci p ci d

All you need is a YAML file with contents like this:

    mappings:
      p: parent
      d: domain

    maven:
      phases:
        - clean
        - install
        - jetty:run

*****

###Additional Features###

If you don't want to define a mapping for your module, you can use it's name.

    m ci parent ci d

You can also create shorthand commands for various plugin phases. For example, executing "jetty:run" on your "web module could be:

    m jr web

All parameters passed into the helper script are applied to every execution. So you only need to flag a command like offline mode once:

    m ci web ci parent -o

Commands can be executed in any directory of your project, as long as there is an "m.yml" file in your project's top-level directory.

******

###How do I use it?###
 - Make sure you have ruby installed and on your path.
 - Check out the project to a directory on your machine.
 - From the checkout directory, type "rake install".
 - Find one of your existing maven projects and put an "m.yml" file like the one above in the top-level directory.
 - In a command window, "cd" to a directory in your project.
 - Execute a command.

If you're having trouble, take a look at the sample-mvn-project.
