;; 1. **Test 1: Simple Nested Block with Forward Branching**    - **Description:** A nested block structure with a `br` instruction targeting an outer block. Validate whether the forward branch correctly unwinds the nested stack to the outer block.    - **Constraint:** Tests the correct handling of nested blocks and forward branching.    - **Mismanagement Check:** Incorrect branching due to mismanagement of the stack unwinding or label indices.

(assert_invalid
  (module
    (func $nested_block (result i32)
      (block (result i32)
        (block (result i32)
          (br 1 (i32.const 10))
        )
        (i32.const 20)
      )
    )
  )
  "type mismatch"
)