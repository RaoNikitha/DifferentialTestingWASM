;; 4. **Test 4: Stack Polymorphism with Return**   Define two modules where one imports a function from the other. The imported function uses a stack-polymorphic instruction sequence before returning a value. Check if stack consistency is maintained when the polymorphic sequence is involved.   **Constraint**: Ensure polymorphic stack handling consistency using `c.results` and `checkAndPopArgs` in return scenarios.   **Relation to Incorrect Handling of Control Flow**: Verify that stack polymorphism is correctly implemented across module call boundaries.

(assert_invalid
  (module
    (import "math" "add" (func $add (param i32 i32) (result i32)))
    (func $caller (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $add
      return
    )
    (func $test (result i32)
      i32.const 1
      i32.const 2
      call $caller
      return
    )
  )
  "type mismatch"
)