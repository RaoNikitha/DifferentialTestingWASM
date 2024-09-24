;; 7. Create a test involving multiple nested `if` blocks with different operand configurations, and use `br` to break out of one to target another. Confirm that the operand stack corrects itself between blocks, identifying any mismanagement leading to stack corruption by mismatched types or faulty unwinding logic.

(assert_invalid
  (module
    (func $multi-nested-if (result i32)
      (block (result i32)
        (i32.const 0) (i32.const 1)
        (if (result i32)
          (then
            (br 0)
          )
          (else
            (block (result i32)
              (br 1)
            )
            (i32.const 2)
          )
        )
      )
    )
  )
  "type mismatch"
)