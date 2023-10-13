!test_agent.

+!test_agent : true <-
    .wait(1000);
    !relative_paths(FirstWsp, SndWsp, ThirdWsp);
    println("");
    !absolute_paths(FourthWsp);
    println("");
    !quitAllWorkspaces([FirstWsp, SndWsp, ThirdWsp, FourthWsp]).

/* First test, to show we can move between workspaces using their relative paths. */
+!relative_paths(FirstWsp, SndWsp, ThirdWsp) : true <-
    println("[test_agent] Starting in the root workspace, before creating the first one");
    /* A workspace can be created by name, it will become a child of the current one with the given name. */
    // Add your code here for creating the first workspace by name
    println("[test_agent] After creating the first workspace, before creating the second one");
    /* In fact, the creation by name is a special case of the creation by path, where the path is one relative to the current
     * workspace. */
    // Add your code here for creating the second workspace by relative path from the root workspace
    println("[test_agent] After creating the second workspace, before joining the first one");
    /* A workspace can be joined by name, it will be searched between the children of the current one. Again, this is a special
     * case of joining by path, where the path is one relative to the current workspace. */
    // Join the first workspace by name
    println("[test_agent] After joining the first workspace, before creating the third one (in the first workspace)");
    // Create the third workspace by name
    println("[test_agent] After joining the first workspace, before joining the third one");
    // Join the third workspace by relative path from the first workspace
    println("[test_agent] After joining the third workspace, before joining its parent");
    /* The ".." is a special workspace representing the parent of the current one. Here, we are joining by path. */
    // Join the parent workspace by relative path from this workspace
    println("[test_agent] After joining the first workspace, before joining the second one");
    /* The ".." syntax can be mixed with workspace names to get relative paths to be used for joining a given workspace. */
    // Join the second workspace by relative path from this workspace
    println("[test_agent] After joining the second workspace, before joining the root one");
    // Join the root workspace by relative path from this one
    println("[test_agent] Ending in the root workspace again").

/* Second test, to show we can move between workspaces using absolute paths and we can use artifacts of different workspaces. */
+!absolute_paths(FourthWsp) : true <-
    println("[test_agent] Starting in the root workspace, before creating an artifact and a fourth workspace into the first one");
    makeArtifact("simpleArtifactMain", "io.github.cakelier.SimpleArtifact", [], ArtIdMain);
    /* A workspace can be created by absolute path, it will be inserted at the given path in the hierarchy and its name will be
     * the last element of the path. The path must be starting with the root workspace, so with "/main". */
    // Create a fourth workspace by absolute path from the root workspace
    println("[test_agent] After creating the artifact and the fourth workspace, before joining the third one");
    /* A workspace can be joined also by absolute path, defining its path from the default "/main" workspace one. */
    // Join the third workspace by absolute path from the root workspace
    println("[test_agent] After joining the third workspace, before invoking an operation on the artifact and then creating a new one");
    /* Even if the artifact is in the default workspace, having its id allows us to invoke operations on it, meaning that the id
     * is unique for a given MAS. */
    // Invoke the "increment" operation on the first artifact using its artifact id
    makeArtifact("simpleArtifactW2", "io.github.cakelier.SimpleArtifact", [], ArtIdW2);
    println("[test_agent] After creating a second artifact, before joining the fourth workspace");
    // Join the fourth workspace by absolute path from the root workspace
    println("[test_agent] After joining the fourth workspace, before invoking an operation on both artifacts");
    /* We can also use the name of the artifact and not its id, but then we must necessarily pass the name of the workspace. */
    // Invoke the "increment" operation on the first artifact using its artifact name and workspace name
    // Invoke the "increment" operation on the second artifact using its artifact id
    println("[test_agent] After invoking the operations, before joining the root workspace and then calling again both operations");
    joinWorkspace("/main", _);
    /* It is clear that, by default, an operation without any annotation is invoked only on artifacts in the current workspace. */
    // Invoke the "increment" operation on the first artifact in the default way
    // Invoke the "increment" operation on the second artifact using its artifact id
    println("[test_agent] Ending in the root workspace again").

+!quitAllWorkspaces(WspIds) : true <-
    /* Note how we can use the ".member" function as in Prolog to unify the "WspId" variable to each element in the list WspIds
     * and then the "for" construct to iterate its body for each of the elements. */
    for (.member(WspId, WspIds)) {
        // Add your code here for quitting a workspace given the id contained into the variable "WspId"
    }.

+joinedWsp(WspId, WspName, NodeId) : true <-
    println("[CArtAgO] The agent joined the workspace ", WspName, " with id ", WspId, " and on node with id ", NodeId).

-joinedWsp(WspId, WspName, NodeId) : true <-
    println("[CArtAgO] The agent left the workspace ", WspName, " with id ", WspId, " and on node with id ", NodeId).

{ include("$jacamoJar/templates/common-cartago.asl") }
