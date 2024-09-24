;; 9. Implement `unreachable` after a series of stack manipulating instructions (push, pop) inside a loop, ensuring the loop exits upon hitting `unreachable` without further stack operations.    - **Constraint:** `unreachable` immediately stops execution, even after multiple stack operations within loops.    - **CFG Check:** Verify stack and loop interactions are correctly terminated by `unreachable`.

(assert_invalid
  (module
    (func $test-unreachable-stack-loop
      (loop
        (i32.const 1)
        (i32.const 2)
        (drop)
        (br 1)
        (unreachable)
        (br 0)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)