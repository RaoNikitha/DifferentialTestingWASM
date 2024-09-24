;; 6. **Deeply Nested Blocks with Recursive Calls**    - Implement multiple nested blocks with recursive calls to imported functions, ensuring return and control flow correctness.    - Tests correct nesting and ensuring recursive calls correctly restore contexts and stack states, focusing on deep label stack corrections.

(assert_invalid
  (module
    (import "env" "recursive_func" (func $recursive_func))
    (func (export "test") (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (call $recursive_func)
            (br 2 (i32.const 1))
          )
          (br 1 (i32.const 2))
        )
        (br 0 (i32.const 3))
      )
    )
  )
  "type mismatch"
)