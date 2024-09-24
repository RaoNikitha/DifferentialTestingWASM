;; 5. Create a structured block that should produce no results (void), but use `br` to exit with an integer on the stack. The test assesses whether the implementation properly detects the type mismatch in situations where no results are expected.

(assert_invalid
  (module (func (block (result i32) (i32.const 42) (br 0))))
  "type mismatch"
)