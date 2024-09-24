;; 7. **Test 7: Handling Recursion with Imported Functions**    - Description: Create a module that imports a recursively defined function and calls it recursively, ensuring returns are handled correctly at each recursion level.    - Relation: This test checks if recursive calls and returns involving multiple modules are correctly managed.

(assert_invalid
  (module
    (import "env" "recursive_func" (func $recursive_func (result i32)))
    (func $call_recursive (result i32)
      (return (call $recursive_func))
    )
  )
  "type mismatch"
)