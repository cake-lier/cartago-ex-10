!test_agent.

+!test_agent : true <-
    .wait(1000);
    println("Before creating the first workspace");
    createWorkspace("firstWorkspace");
    println("After creating the first workspace, before creating the second and only then joining the first");
    createWorkspace("secondWorkspace");
    joinWorkspace("firstWorkspace", FirstWsp);
    println("After joining the first workspace, before creating the third workspace");
    createWorkspace("thirdWorkspace");
    println("After creating the third workspace, before joining it");
    joinWorkspace("thirdWorkspace", ThirdWsp);
    println("After joining the third workspace, before quitting it");
    quitWorkspace(ThirdWsp);
    println("After quitting the third workspace, before quitting the first and then joining the second");
    quitWorkspace(FirstWsp);
    joinWorkspace("secondWorkspace", SndWsp);
    println("After joining the second workspace, before quitting it").
    quitWorkspace(SndWsp).

+joinedWsp(WspId, WspName, NodeId) : true <-
    println("The agent joined the workspace ", WspName, " with id ", WspId, " and on node with id ", NodeId).

-joinedWsp(WspId, WspName, NodeId) : true <-
    println("The agent left the workspace ", WspName, " with id ", WspId, " and on node with id ", NodeId).

{ include("$jacamoJar/templates/common-cartago.asl") }
