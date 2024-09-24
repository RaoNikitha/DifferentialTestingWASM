;; 4. **Test Name: Nested Loop Branching with Mismatched Types**    - Construct deeply nested loop blocks where a `br` targets an outer loop but with operand types that the outer loop does not expect. This detects improper type handling in nested structures.

(assert_invalid
  (module
    (func
      (block (loop (param i32) (result i32)
        (br 1 (i32.const 42))
      ))
    )
  )
  "type mismatch"
)