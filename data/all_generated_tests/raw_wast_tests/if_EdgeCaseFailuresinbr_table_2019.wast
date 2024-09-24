;; 10. **Test 10**: Retriggering a `br_table` inside an `else` of an `else` branch with an index that is two steps out of bounds, ensuring that multiple levels of else nesting handle edge cases correctly.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then (i32.const 10))
        (else
          (i32.const 0)
          (if (result i32)
            (i32.const 1)
            (then (i32.const 20))
            (else (block
              (i32.const 2)
              (br_table 0 1 2 (i32.const 3))
            ))
          )
        )
      )
    )
  )
  "unknown label"
)