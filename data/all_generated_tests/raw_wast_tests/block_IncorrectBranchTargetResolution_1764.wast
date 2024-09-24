;; 5. A deeply nested block test with a series of `br` instructions aiming to branch progressively outward through each enclosing block's label. This ensures accurate relative nesting depth calculation and control transfer.

(assert_invalid
  (module
    (func $deeply_nested_branching
      (block (result i32) 
        (i32.const 1)
        (block (result i32)
          (i32.const 2)
          (block (result i32)
            (i32.const 3)
            (block (result i32)
              (i32.const 4)
              (block (result i32)
                (i32.const 5)
                (br 4)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)