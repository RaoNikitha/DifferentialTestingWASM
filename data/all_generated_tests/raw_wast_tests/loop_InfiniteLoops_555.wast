;; - **Test 6**:    Design a loop where a `br_if` condition arises from a comparison instruction that always evaluates false, leading the loop to iterate indefinitely.     Constraint: Always false `br_if` condition.     Relation: Checking `br_if` implementation when condition prevents loop exit.

(assert_invalid
  (module (func $indefinite-loop
    (loop (result i32)
      (i32.const 0)
      (br_if 0 (i32.const 0))
    )
  ))
  "type mismatch"
)