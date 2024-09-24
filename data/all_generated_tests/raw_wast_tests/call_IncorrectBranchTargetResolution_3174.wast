;; 3. **Test 3: Function Call in Nested Loops with Valid but Unaligned Data**      Description: Design a function containing nested loops where inner and outer loops share variables. Call a function in the inner loop with a sequence of arguments that do not align with the function's signature. This tests argument transfer and loop exit consistency.      Constraint: Ensure the shared variables are manipulated in ways that can cause misalignment of stack entries.      Relation to Branch Target Resolution: Misalignment may cause the loop exit branch to resolve incorrectly, especially if stack height isn't managed properly.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 0 funcref)
    (func $nested-loops
      (local i32 i32)
      (loop
        (local.set 0 (i32.add (local.get 0) (i32.const 1)))
        (loop
          (local.set 1 (i32.add (local.get 1) (i32.const 1)))
          (call_indirect (type 0) (i32.const 0) (local.get 0) (local.get 1))
        )
      )
    )
  )
  "type mismatch"
)