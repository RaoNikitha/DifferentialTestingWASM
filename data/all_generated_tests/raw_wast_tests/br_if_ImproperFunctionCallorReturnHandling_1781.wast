;; 2. **Test 2: Conditional Branching on Function Return**: Perform a conditional branch using `br_if` immediately after a function returns a value. Check if `wizard_engine` correctly unwinds the stack and matches the function's returned type with the branch's expected type, avoiding improper function return handling.

(assert_invalid
  (module
    (func $conditional-branch-return
      (block (result i32)
        (br_if 0 (call $return_i32) (i32.const 0))
      )
      (i32.eqz) (drop)
    )
    (func $return_i32 (result i32) (i32.const 42))
  )
  "type mismatch"
)