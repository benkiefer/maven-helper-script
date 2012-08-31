##Maven Helper Script

A script to simplify how you execute mvn commands. For example, instead of:

    mvn clean install -pl parent && mvn clean install -pl domain

You can do something like:

    m ci p ci d

All you need is a little YAML. A simple YAML file call 'm.yml' with contents like the one below will get you on your way.

    mappings:
      p: parent
      d: domain

    maven:
      phases:
        - clean
        - install

**How do I use it?**

I'm working on something a little nicer, but for now...

 - Make sure you have ruby installed.
 - Checkout the project to a directory on your machine.
 - Put the directory with the m file in it on your PATH.
 - Look at the "m" file in the checkout directory. This file points to the appropriate ruby file to execute. Tweak it as necessary.
 - In a command window, 'cd' to the project's parent directory which should contain your YAML file.
 - Execute a command like the one.

**To Do**
 - Set up a sample mvn project inside this project that lets you see how the example works.
 - Change the script so that it allows you to execute the commands from anywhere within the project, rather than just the top level folder.
 - Make the project into a gem that can be installed so that you don't have to screw around with the clunky path stuff.