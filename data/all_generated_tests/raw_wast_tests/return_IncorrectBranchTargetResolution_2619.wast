;; 8. Test Description: Write a function mixing control instructions like br, br_if, and indirect calls within nested blocks. Use the return instruction within a loop to validate it correctly bypasses intermediate control instructions and resolves the correct function scope. This tests for proper handling of complex branches.

(assert_invalid
  (module
    (func $test (result i32)
      (block $outer (result i32)
        (loop $inner
          (br_if $outer (i32.const 1))
          (call_indirect (type $sig) (return) (i32.const 0))
        )
      )
    )
    (type $sig (func (result i32)))
  )
  "type mismatch"
)