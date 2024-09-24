;; 10. **Test Description:** Create a complex function with cascading `block`, `loop`, and `if` statements. Use `br_if` with multiple label references to test correct forward and backward jump behavior. Place `unreachable` instructions outside these constructs to detect if any invalid control transfers are leading to unexpected execution.

(assert_invalid
  (module
    (func $complexNestedBrIf
      (block (result i32)
        (block
          (i32.const 1)
          (br_if 1 (i32.const 1)) 
          (block
            (br_if 1 (i64.const 1)) 
          )
        )
        (loop (result i32)
          (br_if 0 (i32.const 1)) 
        )
      )
      (unreachable)
    )
  )
  "type mismatch"
)