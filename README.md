# CArtAgO by exercises — Exercise 10 — Working with Multiple Workspaces

In this exercise, you'll familiarize with the concept of multiple workspaces.
In CArtAgO, it is possible for an agent to be part of multiple workspaces at once,
each of which represents a logical container for its artifacts.
The workspaces are structured in a hierarchical fashion,
where at the top it exists a "root," default workspace called "main."
When inside any workspace, another workspace can be created using a particular method by specifying its name,
and it will become the child of the workspace we are currently in.
This is a particular case of creating a workspace by relative path,
where the path is resolved starting from the current workspace.
To insert the parent workspace into the relative path, the ".."
workspace name is given.
Another way to create a workspace is to specify its absolute path,
which will necessarily start with the root workspace, so with the "/main" string.
An actor can also join a workspace,
which means that it will be part of it and will be able to access the artifacts that are in it.
When creating a workspace,
be sure to have previously joined all workspaces you need to traverse for creating the new one.
The ways to join a workspace are analogous to the ones to create it:
a workspace can be joined via its name, via a relative path from the current workspace,
or via its absolute path from the default one.
At last, a workspace can be quit via its id.
Every time an agent joins for the first time or quits a workspace,
a belief with functor "joinedWsp" is added or removed to the belief base of the agent.
This belief contains the name and id of the workspace and its absolute path inside the current node.

In the first part of the exercise, it will be asked you to use only names or relative paths,
and in the second, only absolute paths.
In the second part,
you'll see also how to interact with artifacts from other workspaces
using the annotation for the artifact id or the annotation for its name along with the annotation for the workspace name.
In the first part,
you'll build a workspace hierarchy made by a first and a second workspaces which are children of the root workspace.
The first workspace has a children which is the third workspace.
In the second part, you will add a fourth workspace as a child of the first one.

## Solution

All solution files are marked with the "solution" suffix, don't open them before solving the exercise!
