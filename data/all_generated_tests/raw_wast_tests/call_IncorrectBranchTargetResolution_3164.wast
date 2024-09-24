;; 3. **Test Description**: Execute a function which includes a loop with a branching instruction (`br`) and calls another function inside the loop. Verify that the loop correctly resolves the branch target after the function call.    - **Constraint**: Tests branch target resolution within looping structures containing nested function calls.

(assert_invalid
  (module
    (func $target (result i32)
      i32.const 1)
    (func (result i32)
      (loop $loop
        (call $target)
        (br $loop)
      )
    )
  )
  "unreachable code in branch target resolution"
)