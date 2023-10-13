package io.github.cakelier;

import cartago.Artifact;
import cartago.OPERATION;

public class SimpleArtifact extends Artifact {
    private int counter;

    private void init() {
        this.counter = 0;
    }

    @OPERATION
    public void increment() {
        log("Counter is now at: " + this.counter);
        this.counter++;
    }
}
