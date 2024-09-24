;; 4. **Test Description:**    - Export a function that features multiple nested blocks with `br` instructions targeting various levels.    - Import and call this function, ensuring that the `br` instructions correctly reference the intended blocks and the operand stack remains consistent.    - **Constraint:** Validate proper label indexing and correct branch target resolution when dealing with nested structures across module boundaries.

(assert_invalid
  (module
    (func $nested-label-export (export "test")
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (i32.const 2)
          (block (result i32)
            (i32.const 3)
            (br 2)
            (drop)
          )
          (drop)
        )
        (drop)
      )
    )
    (import "env" "test_import" (func $test_import))
    (func $main
      (call $test_import)
    )
    (start $main)
  )
  "type mismatch"
)