;; 1. **Test Description**: Create a module that imports a function which internally contains a `loop` instruction. Export another function that calls the imported function and introduces a branch within the loop that utilizes a `br` instruction. This tests for proper unwinding and resetting of the stack across module boundaries when the imported function reinitializes the loop.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func $test
      (call $imported_func)
      (loop (result i32) 
        (br 0) 
      )
    )
    (export "test" (func $test))
  )
  "type mismatch"
)