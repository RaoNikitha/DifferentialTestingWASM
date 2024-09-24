;; Test 9: Create a complex conditional structure with multiple nested `br_if` instructions. Test with conditions that are inherently challenging to evaluate correctly (e.g., involving arithmetic and logical operations). Compare the function call sequences and results.

(assert_invalid
  (module
    (func $complex-conditional (result i32)
      (local i32)
      (i32.const 10)
      (local.set 0)
      (block
        (block
          (block
            (block
              (br_if 3 (i32.eq (local.get 0) (i32.const 10)))
              (br_if 2 (i32.eqz (local.get 0)))
              (br_if 1 (i32.le_s (local.get 0) (i32.const 5)))
              (call 1 (i32.const 1))
            )
            (call 1 (i32.const 2))
          )
          (call 1 (i32.const 3))
        )
        (call 1 (i32.const 4))
      )
      (local.get 0)
    )
    (func)
  )
  "type mismatch"
)