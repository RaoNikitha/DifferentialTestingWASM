;; 4. **Test 4**: - **Description**: Multiple `loop` structures interleaved with `block`, where `br_if` inside a `loop` targets a different loop nested within a block. - **Constraint Checked**: Proper identification and handling of loops within nested blocks.

(assert_invalid
  (module (func
    (block (result i32)
      (loop (result i32)
        (block (result i32)
          (loop (result i32)
            (br_if 1 (i32.const 1))
            (i32.const 0)
          )
          (i32.const 0)
        )
        (i32.sub (i32.const 4) (i32.mul (i32.const 2) (i32.const 3)))
      )
    )
  ))
  "type mismatch"
)