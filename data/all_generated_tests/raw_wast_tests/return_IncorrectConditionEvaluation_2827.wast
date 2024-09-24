;; 6. **`br_if` Followed by Multiple Returns**:    - Setup a sequence where a `br_if` is immediately followed by multiple returns. Validate the differential between correct and incorrect conditions influencing which return is executed.

(assert_invalid
  (module
    (func $br_if-multiple-returns (result i32)
      (block
        (br_if 0 (i32.const 1))
        (return (i32.const 2))
        (return (i32.const 3))
      )
    )
  )
  "type mismatch"
)