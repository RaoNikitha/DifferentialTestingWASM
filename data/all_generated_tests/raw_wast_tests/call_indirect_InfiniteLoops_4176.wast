;; 5. **Test Description**: Develop a scenario where `call_indirect` is called within a double-loop structure, and the inner loop has a `br` instruction dependent on the result of the indirect call. The outer loop should break only if a particular condition involving both loops is met.    - **Constraint Being Checked**: Proper handling of control flow dependency across nested loops.    - **Relation to Infinite Loops**: Incorrect operand or result propagation might cause the condition to never be true, resulting in infinite loops.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      (local.get 0)
    )
    (table 2 funcref)
    (elem (i32.const 0) $f)
    (func $test
      (loop $outer
        (loop $inner
          (call_indirect (type $sig) (i32.const 0) (i32.const 1))
          (br_if $inner (i32.const 0))
        )
        (br_if $outer (i32.const 1))
      )
    )
  )
  "control flow dependency across nested loops causing infinite loop"
)