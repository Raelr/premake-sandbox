# PREMAKE SANDBOX

This porject was made for the purpose of testing premake's build capabilities. The project consists of two 'projects', ProjectA and ProjectB. ProjectA contains most of the runtime information, including its own custom entrypoint. ProjectB depends on ProjectA by inheriting ProjectA's ApplicationA class. 

ProjectB contains an instance of ProjectA - it then uses an entrypoind definition to run itself THROUGH ProjectA's main definition. 

## BUILD INSTRUCTIONS

### MANUAL METHOD

The project can be built usng the following commands:

```
premake/premake5 gmake2
```

This will create a set of makefiles across the project. These can then be used to 'build' the project. Note that you can specify a number of project types that you want the project to be bult to. 

I.e, the command below will generate xcode project files:

```
premake/premake5 xcode4
```

After the project files are generated, you can build project using your desired tool. In this example we'll use make to buld the gmake project:

```
make config=debug all  
```

This will build the "DEBUG configuration for the projects."

Finally, run the project using the following command:

```
./bin/Debug-macosx-x86_64/ProjectB/ProjectB   
```

This should run the basic project! 

### BASH SCRIPT

If you're running OSX, you can run the two bash scripts provided with the project to build and run the project:

1. Run the build script:

```
$ ./BuildGMake.sh                                                                                                                                        ✔ 
Building configurations...
Running action 'gmake2'...
Done (43ms).
==== Building ProjectA (debug) ====
==== Building ProjectB (debug) ====
ApplicationB.cpp
Linking ProjectB
```

2. Then simply build run the project using the RunProject bash script:

``` 
$ ./RunProject.sh                                                                                                                                        ✔ 
[2020-05-17 07:40:36.749] [info] Starting app.
[2020-05-17 07:40:36.749] [info] Running app.
[2020-05-17 07:40:36.749] [info] Stopping app - releasing memory
```

If you see the output above then you successfully build and ran the project! 