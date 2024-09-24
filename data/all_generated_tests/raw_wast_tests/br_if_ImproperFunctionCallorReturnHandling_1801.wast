;; 2. **Test: Nested Function Calls with Conditional Branching**    - **Description:** Implement nested `br_if` instructions within multiple function calls. The outer function calls an inner function with a `br_if` depending on an operand manipulated by the inner call.    - **Constraint Check:** Ensures that function call sequences and return values do not lead to stack underflow when unwinding nested calls with conditional branches.

(assert_invalid
  (module
    (func $inner (result i32)
      (block (result i32) (br_if 0 (i32.const 1)) (i32.const 0))
    )
    (func $outer
      (call $inner) (i32.const 1)
      (block (result i32)
        (br_if 0 (call $inner) (i32.const 0))
      )
    )
  )
  "type mismatch"
)