;; 6. **Test 6: Call Instruction inside Conditional Branch**      Description: Implement a function with a conditional branch (e.g., `br_if`) that calls another function. The called function should require parameters conditionally prepared within the branch. This tests conditional branch accuracy.      Constraint: Ensure conditional logic affects argument preparation to expose discrepancies.      Relation to Branch Target Resolution: Conditional branches heavily rely on accurate label resolution and stack state; errors here can cause unintended jumps.

(assert_invalid
  (module
    (func $condition-based-call
      (param i32 i32)
      (result i32)
      (local i32)
      (local.set 2 (i32.const 0))
      (if (i32.eq (local.get 0) (i32.const 1))
        (then
          (local.set 2 (i32.add (local.get 1) (i32.const 10)))
          (call 1 (local.get 2))
        )
      )
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)