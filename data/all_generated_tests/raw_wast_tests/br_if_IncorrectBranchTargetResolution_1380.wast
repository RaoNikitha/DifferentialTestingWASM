;; 1. Test a `br_if` with nested `block` instructions and a label index that refers to an outer block to verify if control correctly jumps to the outer block based on a condition. This tests label resolution in a nested context.

(assert_invalid
  (module
    (func
      (block
        (block
          (i32.const 1)
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)