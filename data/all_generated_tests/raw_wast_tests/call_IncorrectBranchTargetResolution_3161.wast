;; Test 10: Create a module where functions include early returns through branching instructions, with both expected and unexpected branch exits. Use scenarios to differentiate implementations based on how well they adhere to the correct label resolution within the call instructions.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $test (result i32)
      local.get 0
      (block 
        (br 0)
        (call 1 (local.get 0))
      )
    )
    (func (param i32) (result i32)
      local.get 0
    )
  )
  "type mismatch"
)