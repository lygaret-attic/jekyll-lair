describe("Sanity", function() {
    
    it("should be able to run a test", function() {
        var hello = hello_world()
        expect(hello).toBeTruthy("hello, world");
    });

});