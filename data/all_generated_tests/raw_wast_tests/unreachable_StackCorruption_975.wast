;; 6. **Test Description:**    A sequence involving pushing multiple values to the stack, inserting `unreachable`, and attempting further stack manipulation. Tests the stack state consistency.    <br>**Constraint:** Ensure that values pushed onto the stack before `unreachable` remain unaffected and no pops occur after `unreachable`.

(assert_invalid
  (module
    (func $test-unreachable-multiple-stack-ops
      (i32.const 1)
      (i32.const 2)
      (unreachable)
      (drop)
    )
  )
  "operation after unreachable"
)