;; 2. **Nested Blocks With Cross-Module Function Calls**    - Test nested `block` structures including calls to functions from other modules. Introduce deep nesting levels and ensure the correct management of the operand and label stacks.    - This will stress test the correct context handling and label insertion by jumping in and out of modules, revealing any inconsistencies between implementations.

(assert_invalid
  (module
    (func $external (import "mod" "external_func") (result i32))
    (func 
      (block (result i32)
        (i32.const 0)
        (block (result i32)
          (call $external)
          (br 0 (i32.const 3))
        )
        (i32.add)
      )
    )
  )
  "type mismatch"
)