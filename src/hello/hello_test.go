package main

import "testing"
import "greet"

func TestMain(t *testing.T) {

    actualResult := greet.Greet()
    var expectedResult = "Hello 中国!"
    
	if actualResult != expectedResult {
		t.Fatalf("Expected %s but got %s", expectedResult, actualResult)
    }
    
}
