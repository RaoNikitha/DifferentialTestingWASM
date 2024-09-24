;; 1. **Test Deeply Nested Function Calls with Br Instruction:**    Ensure to create a deeply nested set of function calls, where each function contains a `br` instruction that targets an outer control block. This tests if the implementations handle long call stacks and proper return sequences correctly without skipping or mismatching return addresses.

(assert_invalid
  (module
    (func $func1 (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (i32.const 42) (br 4)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)