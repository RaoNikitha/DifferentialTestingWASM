;; 6. **Test Description:** Design a function using multiple nested blocks with different operand types. After a `br` instruction targeting an outer block, add an `unreachable` to check correct operand consumption and placement back on the stack.     - **Constraint Checked:** Proper operand handling and unwinding to targeted blocks.     - **Relation to Unreachable Code Execution:** Validates operand type management to avoid reaching an `unreachable` instruction unexpectedly.

(assert_invalid
  (module
    (func $nested-blocks-with-br (result i32)
      (block (result i32)
        (i32.const 10)
        (block (result i32)
          (i32.const 20)
          (block (result i32)
            (i32.const 30)
            (br 2)
            (unreachable)
          )
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)