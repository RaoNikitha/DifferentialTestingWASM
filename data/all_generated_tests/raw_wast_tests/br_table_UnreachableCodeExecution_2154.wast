;; 4. **Test Description**: A `br_table` where the operand always targets a valid label but with incorrect block types resulting in an arity mismatch, targeting an `unreachable` instruction to observe if the error is caught as expected. This examines type and arity checks for branches.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (br_table 0 0 (i32.const 0) (nop)) (unreachable)
      )
    )
  )
  "type mismatch"
)