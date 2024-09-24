;; 10. **Test 10**: Create nested `block` and `loop` constructs with `br_if` instructions that break to different levels based on conditions met at various depths. Validate the control flow respects the proper context of each block and loop, ensuring robust management of complex nested blocks.

(assert_invalid
  (module
    (func $test (result i32)
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (i32.const 2)
          (loop (result i32)
            (br_if 2 (i32.const 1))
            (i32.const 3)
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)