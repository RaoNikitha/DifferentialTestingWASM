;; 5. **Test 5: Function Call after Unreachable Code Block**      Description: Set up a WebAssembly module with an unreachable code block followed by a function call. The function call should use arguments prepared before the unreachable code. This checks whether argument handling post-unreachable code is consistent across implementations.      Constraint: Include explicit stack pushes before the unreachable block.      Relation to Branch Target Resolution: Unreachable blocks test the control flow, and any mishandling could lead to resolving the wrong continuation point.

(assert_invalid
  (module
    (func $prepare (result i32)
      (i32.const 42)
    )
    (func $test
      (i32.const 1)
      (unreachable)
      (call $prepare)
    )
  )
  "type mismatch"
)